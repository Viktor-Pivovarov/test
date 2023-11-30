import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'selection_search_params_state.dart';
part 'selection_search_params_cubit.freezed.dart';

class DemoFormFields {
  static const String distance = 'distance';
}

class SelectionSearchParamsCubit extends FormCubit<SelectionSearchParamsState> {
  SelectionSearchParamsCubit({
    required SelectionRepository repository,
    required SelectionRouter router,
  })  : _repository = repository,
        _router = router,
        super(const SelectionSearchParamsState());

  final SelectionRepository _repository;

  final SelectionRouter _router;

  Future<void> init() async {
    form = FormGroup({
      DemoFormFields.distance: FormControl<double>(),
    });

    emit(state.copyWith(status: StateStatus.firstFetchingInProgress));

    final result = await _repository.getSearchPreferences();

    result.fold((l) {
      emit(state.copyWith(status: StateStatus.fetchingFailure));
    }, (response) {
      getFormControl<double>(DemoFormFields.distance).value =
          response.distance.toDouble();

      emit(
        state.copyWith(
          params: response,
          status: StateStatus.fetchingSuccess,
        ),
      );
    });
  }

  @override
  Future<void> onSubmit() async {
    await super.onSubmit();

    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: StateStatus.finish));
  }

  Future<void> onPressedAge() async {
    await DialogService.showBottomDialog<dynamic>(
      animationConfiguration: const EasyDialogAnimationConfiguration.bounded(
        duration: Duration(milliseconds: 400),
      ),
      dialog: SearchAgePicker(
        from: state.params.ageFrom,
        to: state.params.ageTo,
        onSubmit: _onSubmitAge,
      ),
    );
  }

  Future<void> onPressedLanguages() async {
    final List<int>? result = await LanguagesDialog.showDialog(
      _router.context,
      state.params.languages.map((e) => e.id).toList().join(','),
    );

    if (result != null) {
      await _onPressedSaveLanguages(result);
    }
  }

  Future<void> _onSubmitAge(int from, int to) async {
    final result = await _repository.updateSearchAge(from, to);

    result.fold((l) => null, (r) {
      emit(
        state.copyWith(
          params: state.params.copyWith(ageFrom: from, ageTo: to),
        ),
      );
    });

    await FlutterEasyDialogs.hide(
      PositionedDialog.identifier(position: EasyDialogPosition.bottom),
    );
  }

  Future<void> _onPressedSaveLanguages(List<int> languages) async {
    await _repository.updatePreferenceLanguages(languages);

    await init();
  }

  Future<void> onSaveDistance() async {
    final int distance =
        getFormControl<double>(DemoFormFields.distance).value!.toInt();

    emit(
      state.copyWith(
        status: StateStatus.fetchingInProgress,
        params: state.params.copyWith(distance: distance),
      ),
    );

    await _repository.updateDistance(distance);

    emit(state.copyWith(status: StateStatus.finish));
  }
}
