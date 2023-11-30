import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'geo_location_cubit.freezed.dart';

part 'geo_location_cubit.g.dart';

part 'geo_location_state.dart';

class GeoLocationCubit extends Cubit<GeoLocationState> {
  GeoLocationCubit({
    required GeoLocationRepository repository,
    required GeoLocationRouter router,
  })  : _repository = repository,
        _router = router,
        super(const GeoLocationState()) {
    init();
  }

  final GeoLocationRouter _router;
  final GeoLocationRepository _repository;

  final Debouncer _debouncer = Debouncer(milliseconds: 600);

  final FormControl<String> formControl = FormControl();
  final FormControl<String> selectedFormControl = FormControl();

  StreamSubscription<String?>? _stream;

  Future<void> init() async {
    _stream = formControl.valueChanges.listen((_) {
      _debouncer(_getCities);
    });
  }

  Future<void> _getCities() async {
    if ((formControl.value ?? '').length > 3) {
      emit(state.copyWith(status: StateStatus.fetchingInProgress));
      final result = await _repository.getGeoLocation(formControl.value ?? '');

      result.fold((error) {
        emit(
          state.copyWith(
            error: error.getLocalizedString(),
            status: StateStatus.fetchingFailure,
          ),
        );
      }, (r) {
        emit(
          state.copyWith(
            geoLocation: r,
            status: StateStatus.fetchingSuccess,
          ),
        );
      });
    }
  }

  void selectCity() {
    _router.pop<GeoLocationModel>(state.selectLocation);
  }

  void onChangeGeo(String? value) {
    final selectLocation = state.geoLocation.items.firstWhereOrNull(
      (element) => element.name == value,
    );

    if (selectLocation != null) {
      selectedFormControl.value = value;

      emit(state.copyWith(selectLocation: selectLocation));
    }
  }

  @override
  Future<void> close() {
    _stream?.cancel();

    return super.close();
  }
}
