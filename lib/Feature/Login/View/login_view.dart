import 'package:flutter/material.dart';
import 'package:tfr/Feature/Login/Widget/login_form_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const password = "Password";
    TextEditingController passControler = TextEditingController();
    const userName = "User Name";
    TextEditingController userNameControler = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(96, 108, 93, 1),
      body: LoginFormWidget(
          formKey: formKey,
          userNameControler: userNameControler,
          userName: userName,
          passControler: passControler,
          password: password),
    );
  }
}
