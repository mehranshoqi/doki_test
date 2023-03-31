import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  LoginPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_form(context), _loginButton(context)],
          ),
        ),
      );

  Widget _form(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            CustomInput(
              controller: controller.usernameController,
              validator: controller.usernameValidator,
              placeholder: 'username',
            ),
            CustomInput(
              controller: controller.passwordController,
              validator: controller.passwordValidator,
              placeholder: 'password',
            ),
            const SizedBox(height: 20),
            _hint(context),
          ],
        ),
      );

  Widget _loginButton(BuildContext context) => Obx(
        () => CustomButton(
          label: 'Login',
          onPressed: () => controller.submitForm(_formKey),
          loading: controller.loading.value,
        ),
      );

  Widget _hint(BuildContext context) => const Text(
        'username: mehran     .     password: 1234',
        style: TextStyle(fontWeight: FontWeight.bold),
      );
}
