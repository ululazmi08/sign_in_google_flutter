import 'package:get/get.dart';
import 'package:test_hi_bank/page/home_page.dart';
import 'package:test_hi_bank/page/login_page.dart';
import 'package:test_hi_bank/routes/route_name.dart';

class PagesRoute {
  static final pages = [
    GetPage(name: RouteName.home, page: ()=> HomePage()),
    GetPage(name: RouteName.login, page: ()=> LoginPage()),
  ];
}