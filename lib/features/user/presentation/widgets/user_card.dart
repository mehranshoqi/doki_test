import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/navigation/routes.dart';
import '../../data/models/user/user_model.dart';
import 'user_avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Get.toNamed(Routes.profile, arguments: user),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: _cardDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  UserAvatar(imageUrl: user.picture),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name),
                      const SizedBox(height: 4),
                      Text(user.email),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Address: ' + user.address),
            ],
          ),
        ),
      );

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: Colors.blueAccent.withOpacity(.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade100),
      );
}
