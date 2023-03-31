import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/login/login_params.dart';

part 'login_params_model.g.dart';

@JsonSerializable(createFactory: false)
class LoginParamsModel extends LoginParams {
  const LoginParamsModel(super.username, super.password);

  Map<String, dynamic> toJson() => _$LoginParamsModelToJson(this);

  @override
  List<Object?> get props => [username, password];
}
