import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/user/user_model.dart';
import '../controllers/home_controller.dart';
import '../widgets/user_avatar.dart';
import '../widgets/user_card.dart';
import '../widgets/user_card_shimmer.dart';

class HomePage extends GetWidget<HomeController> {
  HomePage({super.key});
  final UserModel owner = Get.arguments;

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: _appBar(context), body: _body(context));

  Widget _body(BuildContext context) => Obx(
        () => controller.loading.value
            ? ListView(
                children: [
                  ...Iterable.generate(8, (_) => const UserCardShimmer())
                      .toList(),
                ],
              )
            : ListView(
                children: [
                  for (UserModel user in controller.usersList)
                    UserCard(user: user)
                ],
              ),
      );

  PreferredSizeWidget _appBar(BuildContext context) => AppBar(
        title: Text(owner.name),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: UserAvatar(
            imageUrl: owner.picture,
            onTap: () => Get.toNamed(Routes.profile, arguments: owner),
          ),
        ),
        actions: [
          CustomButton(
            width: 80,
            bgColor: Colors.transparent,
            label: 'Back',
            onPressed: () => Get.back(),
          ),
        ],
      );
}
