import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/get_users/get_users_response.dart';
import '../../user/user_model.dart';

part 'get_users_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetUsersResponseModel extends GetUsersResponse {
  const GetUsersResponseModel(List<UserModel> users) : super(users);

  factory GetUsersResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GetUsersResponseModelFromJson(data);

  @override
  List<Object?> get props => [users];
}
