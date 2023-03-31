import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/login/login_response.dart';
import '../../user/user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseModel extends LoginResponse {
  factory LoginResponseModel.fromJson(Map<String, dynamic> data) =>
      _$LoginResponseModelFromJson(data);

  const LoginResponseModel(UserModel owner) : super(owner);

  @override
  List<Object?> get props => [owner];
}
