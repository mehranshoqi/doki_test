import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/friend/friend.dart';

part 'friend_model.g.dart';

@JsonSerializable(createToJson: false)
class FriendModel extends Friend {
  const FriendModel({
    required super.id,
    required super.guid,
    required super.name,
  });

  factory FriendModel.fromJson(Map<String, dynamic> data) =>
      _$FriendModelFromJson(data);
}
