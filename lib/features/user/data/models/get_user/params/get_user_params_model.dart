import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/get_user/get_user_params.dart';

part 'get_user_params_model.g.dart';

@JsonSerializable(createFactory: false)
class GetUserParamsModel extends GetUserParams {
  const GetUserParamsModel(super.userId);

  Map<String, dynamic> toJson() => _$GetUserParamsModelToJson(this);

  @override
  List<Object?> get props => [userId];
}
