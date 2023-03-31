import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/binding/init_binding.dart';
import 'core/di/di.dart';
import 'core/navigation/navigations.dart';
import 'core/navigation/routes.dart';
import 'core/service/users.dart';
import 'features/user/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// dependency injection configuration
  await configureDependencies();

  /// read mock data
  await sl<UsersService>().readUsers();

  ///
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        getPages: sl<Navigations>().pages,
        initialRoute: Routes.login,
        initialBinding: InitialBinding(),
      );
}
