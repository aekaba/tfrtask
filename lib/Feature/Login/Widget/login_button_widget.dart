import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfr/Feature/Login/Cubit/login_cubit.dart';
import 'package:tfr/Feature/Login/Cubit/login_cubit_state.dart';
import 'package:tfr/Feature/Home/View/main_view.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.userNameControler,
    required this.passControler,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameControler;
  final TextEditingController passControler;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isCompleted) {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => const MainView()));
        } else if (state.isWrong) {
          showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                  title: const Text(
                    "Wrong Password or User Name",
                    style: TextStyle(fontSize: 16),
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CloseButton(
                        onPressed: () {
                          Navigator.pop(context);
                          passControler.clear();
                          userNameControler.clear();
                        },
                      ),
                    ],
                  ),
                );
              });
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: !state.isLoading
                            ? const Color.fromRGBO(241, 195, 118, 1)
                            : Colors.grey),
                    child: InkWell(
                      onTap: () {
                        if ((formKey.currentState?.validate() ?? false) &&
                            (!state.isLoading)) {
                          context.read<LoginCubit>().authUser(
                              userNameControler.text, passControler.text);
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
