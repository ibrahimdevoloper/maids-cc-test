import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
bool _isPasswordObscure = false;
  void login() {
    try {
      emit(LoginLoading());
      // Add your login logic here
      emit(LoginLoaded());
    } catch (e) {
      emit(LoginError());
    }
  }

  void viewPassword() {
    _isPasswordObscure = !_isPasswordObscure;
    emit(LoginViewPassword(_isPasswordObscure));
  }
}
