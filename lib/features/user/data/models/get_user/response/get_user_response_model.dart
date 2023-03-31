import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/get_user/get_user_response.dart';
import '../../user/user_model.dart';

part 'get_user_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetUserResponseModel extends GetUserResponse {
  const GetUserResponseModel(UserModel user) : super(user);

  factory GetUserResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GetUserResponseModelFromJson(data);

  @override
  List<Object?> get props => [user];
}
