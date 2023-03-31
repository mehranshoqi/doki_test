import 'package:get/get.dart';

import '../../features/user/domain/usecases/get_user.dart';
import '../../features/user/domain/usecases/get_users.dart';
import '../../features/user/domain/usecases/login.dart';
import '../../features/user/presentation/controllers/home_controller.dart';
import '../../features/user/presentation/controllers/login_controller.dart';
import '../../features/user/presentation/controllers/profile_controller.dart';
import '../di/di.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(sl<Login>()), fenix: true);
    Get.lazyPut(() => HomeController(sl<GetUsers>()), fenix: true);
    Get.lazyPut(() => ProfileController(sl<GetUser>()), fenix: true);
  }
}
