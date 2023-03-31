import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/login/params/login_params_model.dart';
import '../../data/models/login/response/login_response_model.dart';
import '../repository/repository.dart';

@lazySingleton
class Login extends UseCases<LoginResponseModel, LoginParamsModel> {
  final UserRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(
          LoginParamsModel params) async =>
      await repository.login(params);
}
