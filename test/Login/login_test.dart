// ignore_for_file: file_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tfr/Feature/Login/Model/Login_Model.dart';
import 'package:tfr/Feature/Login/Service/login_service.dart';

void main() {
  late LoginService loginService;
  setUp(() {
    loginService = LoginService();
  });
  test("Login Test", () async {
    await dotenv.load(fileName: ".env");
    final response = loginService
        .login(LoginModel(username: "driver_test", password: "12345678"));
    expect(response, isNotNull);
  });
}
