import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'review_cubit.freezed.dart';
part 'review_state.dart';

class ReviewCubit extends BaseCubit<ReviewState> {
  ReviewCubit({
    required GetFeedbackReasonsUseCase getFeedbackReasonsUseCase,
    required SendFeedbackUseCase sendFeedbackUseCase,
  })  : _getFeedbackReasonsUseCase = getFeedbackReasonsUseCase,
        _sendFeedbackUseCase = sendFeedbackUseCase,
        super(const ReviewState());

  FormGroup? form;

  final GetFeedbackReasonsUseCase _getFeedbackReasonsUseCase;
  final SendFeedbackUseCase _sendFeedbackUseCase;

  bool locked = false;

  Future<void> init() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _getFeedbackReasonsUseCase(NoParams());

    result.fold(
        (failure) => emit(
              state.copyWith(
                status: StateStatus.fetchingFailure,
                error: failure.getLocalizedString(),
              ),
            ), (reasons) {
      form = FormGroup({
        'text': FormControl<String>(),
        'rating': FormControl<int>(value: 0),
        for (final element in reasons)
          element.id.toString(): FormControl<bool>(value: false),
      });
      emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          form: form,
          reasons: reasons,
        ),
      );
    });
  }

  Future<void> submit() async {
    if (locked) return;

    locked = true;

    if (form?.valid ?? false) {
      final rating = form!.value['rating']! as int;
      List<int>? reasons;
      String? text;

      if (rating <= 3) {
        reasons = [];
        for (final reason in state.reasons) {
          if ((form!.value[reason.id.toString()]! as bool) != false) {
            reasons.add(reason.id);
          }
        }
      }

      if (rating <= 3) {
        text = form!.value['text'] as String?;
      }

      final result = await _sendFeedbackUseCase(
        FeedbackModel(
          rate: rating,
          reasons: reasons,
          message: text?.isNotEmpty ?? false ? text : null,
        ),
      );

      await result.fold((failure) {}, (success) async {
        if (rating > 3) {
          if (await InAppReview.instance.isAvailable()) {
            await InAppReview.instance.requestReview();
          }
        }
        emit(state.copyWith(status: StateStatus.finish));
      });

      locked = false;
    }
  }
}
