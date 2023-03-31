import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/get_users/response/get_users_response_model.dart';
import '../repository/repository.dart';

@lazySingleton
class GetUsers extends UseCases<GetUsersResponseModel, NoParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, GetUsersResponseModel>> call(NoParams params) async =>
      await repository.getUsers(params);
}
