import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:tfr/Feature/Home/Model/old_orders_model.dart';

class HomeService {
  final dio = Dio();
  Future<OldOrders?> getOldOrders({bool itsTest = false}) async {
    String? token;
    if (itsTest == false) {
      final myBox = Hive.box("Token");
      token = myBox.get('access');
    } else {
      token = dotenv.env['TESTTOKEN'];
    }
    final baseurl = dotenv.env['BASEURL'];

    final response = await dio.get('$baseurl/order-drivers/',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    //options: Options(validateStatus: (_) => true)
    if (response.statusCode == HttpStatus.ok) {
      final OldOrders oldOrders = OldOrders.fromJson(response.data);
      return oldOrders;
    } else {
      return null;
    }
  }
}
