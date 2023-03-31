// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponseModel _$GetUsersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUsersResponseModel(
      (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
