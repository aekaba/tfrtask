import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tfr/Feature/Home/Service/home_service.dart';

void main() {
  late HomeService homeService;
  setUp(() {
    homeService = HomeService();
  });
  test("Get Old Orders Test", () async {
    await dotenv.load(fileName: ".env");
    final response = homeService.getOldOrders(itsTest: true);
    expect(response, isNotNull);
  });
}
