import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:tfr/Feature/Login/Model/Login_Model.dart';
import 'package:tfr/Product/Model/token_model.dart';

class LoginService {
  LoginService();

  final dio = Dio();
  Future<TokenModel?> login(LoginModel model) async {
    final baseurl = dotenv.env['BASEURL'];

    final response = await dio.post('$baseurl/token/',
        data: model.toJson(), options: Options(validateStatus: (_) => true));

    if (response.statusCode == HttpStatus.ok) {
      final TokenModel token = TokenModel.fromJson(response.data);
      var myBox = Hive.box("Token");
      myBox.put("access", token.access);
      myBox.put("refresh", token.refresh);
      return token;
    } else {
      return null;
    }
  }
}
