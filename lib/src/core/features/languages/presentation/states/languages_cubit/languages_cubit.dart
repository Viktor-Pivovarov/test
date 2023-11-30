import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'languages_cubit.freezed.dart';
part 'languages_cubit.g.dart';
part 'languages_state.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit({
    required DictRepository repository,
  })  : _repository = repository,
        super(const LanguagesState()) {
    _listen = searchFormControl.valueChanges.listen(_listenSearch);
  }

  final DictRepository _repository;

  final FormControl<String> searchFormControl = FormControl<String>();

  StreamSubscription<String?>? _listen;

  void _listenSearch(String? event) {
    emit(state.copyWith(searchValue: event));
  }

  Future<void> init(String deviceLocale, List<int> selected) async {
    await getLanguages(deviceLocale, selected);
  }

  Future<void> getLanguages(String deviceLocale, List<int> selected) async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.getLanguages();

    result.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          deviceLocale: deviceLocale,
          languages: [
            ...response.where((element) => element.code == deviceLocale),
            ...response.where(
              (element) =>
                  selected.contains(element.id) && element.code != deviceLocale,
            ),
            ...response.whereNot(
              (element) =>
                  selected.contains(element.id) || element.code == deviceLocale,
            ),
          ],
          status: StateStatus.fetchingSuccess,
        ),
      );
    });
  }

  @override
  Future<void> close() async {
    await _listen?.cancel();

    await super.close();
  }
}
