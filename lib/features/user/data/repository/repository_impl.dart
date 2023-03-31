import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/error/error_translator.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/repository.dart';
import '../datasource/data_source.dart';
import '../models/get_user/params/get_user_params_model.dart';
import '../models/get_user/response/get_user_response_model.dart';
import '../models/get_users/response/get_users_response_model.dart';
import '../models/login/params/login_params_model.dart';
import '../models/login/response/login_response_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryIMPL implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryIMPL(this.dataSource);

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginParamsModel params) async {
    try {
      final LoginResponseModel response = await dataSource.login(params);
      return Right(response);
    } catch (err) {
      return Left(Failure(sl<ErrorTranslator>()(err)));
    }
  }

  @override
  Future<Either<Failure, GetUsersResponseModel>> getUsers(
      NoParams params) async {
    try {
      final GetUsersResponseModel response = await dataSource.getUsers(params);
      return Right(response);
    } catch (err) {
      return Left(Failure(sl<ErrorTranslator>()(err)));
    }
  }

  @override
  Future<Either<Failure, GetUserResponseModel>> getUser(
      GetUserParamsModel params) async {
    try {
      final GetUserResponseModel response = await dataSource.getUser(params);
      return Right(response);
    } catch (err) {
      return Left(Failure(sl<ErrorTranslator>()(err)));
    }
  }
}
