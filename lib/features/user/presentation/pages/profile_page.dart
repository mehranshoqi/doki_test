import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/friend/friend_model.dart';
import '../../data/models/user/user_model.dart';
import '../controllers/profile_controller.dart';
import '../widgets/user_avatar.dart';

class ProfilePage extends GetWidget<ProfileController> {
  ProfilePage({super.key});
  final UserModel user = Get.arguments;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(),
        body: _body(context),
      );

  PreferredSizeWidget _appBar() => AppBar(
        title: Text(user.name),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserAvatar(imageUrl: user.picture),
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

  Widget _body(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userInfo(context),
            if (user.friends.isNotEmpty) _friends(context),
            const Divider(),
            _greeting(context),
          ],
        ),
      );

  Widget _userInfo(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue),
          color: Colors.blue.withOpacity(.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _singleInfo(label: 'Balance', value: user.balance),
            _singleInfo(label: 'Age', value: user.age.toString()),
            _singleInfo(label: 'About', value: user.about),
            const SizedBox(height: 12),

            /// Edit button
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 36,
                width: 80,
                child: (user.isOwner)
                    ? CustomButton(
                        label: 'Edit',
                        onPressed: () {},

                      )
                    : null,
              ),
            ),
          ],
        ),
      );

  Widget _singleInfo({required String label, required String value}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Text(
              label + ':',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(value, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      );

  Widget _friends(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Friends',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (FriendModel friend in user.friends)
                    _singleFriend(friend),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.blueAccent,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget _singleFriend(FriendModel friend) => Padding(
        padding: const EdgeInsets.only(right: 12),
        child: InkWell(
          onTap: () => controller.getUserById(friend.guid),
          child: Chip(
            backgroundColor: Colors.blueAccent.withOpacity(.2),
            label: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(friend.name),
              ),
              onTap: () => controller.getUserById(friend.guid),
            ),
          ),
        ),
      );

  Widget _greeting(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Greeting',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueGrey.withOpacity(.2),
              ),
              child: Text(user.greeting),
            ),
          ],
        ),
      );
}
