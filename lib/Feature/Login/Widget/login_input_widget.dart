import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfr/Feature/Login/Cubit/login_cubit.dart';
import 'package:tfr/Feature/Login/Cubit/login_cubit_state.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({
    super.key,
    required this.passControler,
    required this.password,
    required this.isPass,
  });

  final TextEditingController passControler;
  final String password;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: BlocSelector<LoginCubit, LoginState, bool>(
        selector: (state) {
          return state.isLoading;
        },
        builder: (context, state) {
          return AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: state ? 0.4 : 1,
            child: IgnorePointer(
              ignoring: state,
              child: TextFormField(
                controller: passControler,
                obscuringCharacter: "*",
                obscureText: isPass,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: password,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "you need to fill";
                  }
                  if (isPass) {
                    if (value.length < 8) {
                      return "Your password must not be less than 8 characters";
                    }
                  }
                  return null;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
