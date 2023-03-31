import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user/user.dart';
import '../friend/friend_model.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends User {
  const UserModel({
    required List<String> tags,
    required List<FriendModel> friends,
    required bool isOwner,
    required int age,
    required String guid,
    required String balance,
    required String name,
    required String email,
    required String address,
    required String about,
    required String greeting,
    required String? picture,
  }) : super(
          about: about,
          address: address,
          age: age,
          balance: balance,
          email: email,
          friends: friends,
          greeting: greeting,
          guid: guid,
          isOwner: isOwner,
          name: name,
          tags: tags,
          picture: picture,
        );

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);
}
