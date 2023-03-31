import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:injectable/injectable.dart';

import '../../features/user/presentation/pages/home_page.dart';
import '../../features/user/presentation/pages/login_page.dart';
import '../../features/user/presentation/pages/profile_page.dart';
import 'routes.dart';

@lazySingleton
class Navigations {
  final List<GetPage> pages = [
    GetPage(name: Routes.home, page: () => HomePage()),
    GetPage(name: Routes.profile, page: () => ProfilePage()),
    GetPage(name: Routes.login, page: () => LoginPage()),
  ];
}
