import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_cubit.freezed.dart';
part 'login_cubit.g.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase, required this.checkAuthUseCase})
      : super(const LoginState.initial());

  final LoginUseCase loginUseCase;

  final CheckAuthUseCase checkAuthUseCase;

  final FormGroup form = FormGroup(<String, AbstractControl<dynamic>>{
    'login': FormControl<String>(
      validators: <Validator<dynamic>>[Validators.required],
    ),
    'password': FormControl<String>(
      validators: <Validator<dynamic>>[Validators.required],
    ),
  });

  Future<void> clear() async {
    emit(const LoginState.initial());
  }

  void setError(String error) {
    emit(state.copyWith(error: error, status: StateStatus.fetchingFailure));
  }

  void removeError() {
    emit(state.copyWith(error: null, status: StateStatus.fetchingSuccess));
  }

  Future<void> checkAuth(OnResult? onResult) async {
    final result =
        await checkAuthUseCase.call(CheckAuthUseCaseParam(onResult: onResult));

    result.fold(
      (failure) => null,
      (isAuth) => null,
    );
  }
}
