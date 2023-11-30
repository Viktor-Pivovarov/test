import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_auth_cubit.freezed.dart';
part 'local_auth_cubit.g.dart';
part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthCubit() : super(const LocalAuthState.initial());

  void checkAuth() {}

  void createPin(String pinCode) {}

  void enterPin(String pinCode) {}
}
