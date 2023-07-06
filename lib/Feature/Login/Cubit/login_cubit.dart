import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfr/Feature/Login/Cubit/login_cubit_state.dart';
import 'package:tfr/Feature/Login/Model/Login_Model.dart';
import 'package:tfr/Feature/Login/Service/login_service.dart';
import 'package:tfr/Product/Model/token_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginService loginService)
      : _loginService = loginService,
        super(const LoginState());
  final LoginService _loginService;

  Future<void> authUser(String userName, String password) async {
    emit(const LoginState(isLoading: true));
    final response = await _loginService
        .login(LoginModel(username: userName, password: password));
    emit(LoginState(
        isLoading: false,
        isCompleted: response is TokenModel ? true : false,
        isWrong: response is TokenModel ? false : true));
  }
}
