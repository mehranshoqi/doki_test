import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/get_user/params/get_user_params_model.dart';
import '../../data/models/get_user/response/get_user_response_model.dart';
import '../repository/repository.dart';

@lazySingleton
class GetUser extends UseCases<GetUserResponseModel, GetUserParamsModel> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<Either<Failure, GetUserResponseModel>> call(
          GetUserParamsModel params) async =>
      await repository.getUser(params);
}
