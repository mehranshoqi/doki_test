import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/get_user/params/get_user_params_model.dart';
import '../../data/models/get_user/response/get_user_response_model.dart';
import '../../data/models/get_users/response/get_users_response_model.dart';
import '../../data/models/login/params/login_params_model.dart';
import '../../data/models/login/response/login_response_model.dart';

abstract class UserRepository {
  /// login
  Future<Either<Failure, LoginResponseModel>> login(LoginParamsModel params);
  /// get users
  Future<Either<Failure, GetUsersResponseModel>> getUsers(NoParams params);
  /// get user
  Future<Either<Failure, GetUserResponseModel>> getUser(GetUserParamsModel params);
}
