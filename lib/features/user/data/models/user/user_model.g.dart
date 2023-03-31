// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      friends: (json['friends'] as List<dynamic>)
          .map((e) => FriendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOwner: json['isOwner'] as bool,
      age: json['age'] as int,
      guid: json['guid'] as String,
      balance: json['balance'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      about: json['about'] as String,
      greeting: json['greeting'] as String,
      picture: json['picture'] as String?,
    );
