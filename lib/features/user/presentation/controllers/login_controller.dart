import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/navigation/routes.dart';
import '../../data/models/login/params/login_params_model.dart';
import '../../domain/usecases/login.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();
  final Login loginUsecase;
  RxBool loading = false.obs;

  LoginController(this.loginUsecase);

  Future<void> login() async {
    loading.value = true;
    final result = await loginUsecase(
      LoginParamsModel(
        usernameController.text.trim(),
        passwordController.text.trim(),
      ),
    );
    loading.value = false;
    return result.fold(
      (failure) => Get.snackbar( failure.errorReason, 'Ops!'),
      (response) => Get.toNamed(Routes.home, arguments: response.owner),
    );
  }

  void submitForm(GlobalKey<FormState> formKey) {
    final validated = formKey.currentState!.validate();
    if (validated) login();
    formKey.currentState!.save();
  }

  /// Username validation.
  String? usernameValidator(String? value) =>
      value!.isEmpty ? 'Enter valid username' : null;

  /// Password validation.
  String? passwordValidator(String? value) =>
      value!.isEmpty ? 'Enter valid password' : null;
}
