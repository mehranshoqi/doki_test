import 'package:get/get.dart';

import '../../../../core/entities/no_params.dart';
import '../../data/models/user/user_model.dart';
import '../../domain/usecases/get_users.dart';

class HomeController extends GetxController {
  final GetUsers getUsers;
  RxBool loading = false.obs;
  RxList<UserModel> usersList = <UserModel>[].obs;

  HomeController(this.getUsers);

  @override
  void onInit() {
    super.onInit();
    getUsersList();
  }

  Future<void> getUsersList() async {
    loading.value = true;
    final result = await getUsers(NoParams());
    loading.value = false;
    return result.fold(
      (failure) => Get.snackbar( failure.errorReason, 'Ops!'),
      (response) => usersList.value = response.users,
    );
  }
}
