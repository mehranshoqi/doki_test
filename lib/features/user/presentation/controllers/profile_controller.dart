import 'package:get/get.dart';

import '../../../../core/navigation/routes.dart';
import '../../data/models/get_user/params/get_user_params_model.dart';
import '../../domain/usecases/get_user.dart';

class ProfileController extends GetxController {
  final GetUser getUser;
  RxBool loading = false.obs;

  ProfileController(this.getUser);

  Future<void> getUserById(String userId) async {
    loading.value = true;
    final result = await getUser(GetUserParamsModel(userId));
    loading.value = false;
    return result.fold(
      (failure) => Get.snackbar(failure.errorReason, 'Ops!'),
      (response) => Get.toNamed(Routes.profile,
          arguments: response.user, preventDuplicates: false),
    );
  }
}
