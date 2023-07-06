import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfr/Feature/Login/Cubit/login_cubit.dart';
import 'package:tfr/Feature/Login/Service/login_service.dart';
import 'package:tfr/Feature/Login/Widget/login_button_widget.dart';
import 'package:tfr/Feature/Login/Widget/login_input_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.formKey,
    required this.userNameControler,
    required this.userName,
    required this.passControler,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameControler;
  final String userName;
  final TextEditingController passControler;
  final String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Card(
      color: const Color.fromRGBO(255, 244, 244, 1),
      margin: const EdgeInsets.all(32),
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(LoginService()),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  "The Food Runners",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                LoginInput(
                  passControler: userNameControler,
                  password: userName,
                  isPass: false,
                ),
                LoginInput(
                  passControler: passControler,
                  password: password,
                  isPass: true,
                ),
                LoginButton(
                    formKey: formKey,
                    userNameControler: userNameControler,
                    passControler: passControler),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
