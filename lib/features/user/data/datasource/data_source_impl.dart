import 'package:injectable/injectable.dart';

import '../../../../core/di/di.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/service/users.dart';
import '../models/get_user/params/get_user_params_model.dart';
import '../models/get_user/response/get_user_response_model.dart';
import '../models/get_users/response/get_users_response_model.dart';
import '../models/login/params/login_params_model.dart';
import '../models/login/response/login_response_model.dart';
import '../models/user/user_model.dart';
import 'data_source.dart';

///
@LazySingleton(as: UserDataSource)
class UserDataSourceIMPL implements UserDataSource {
  @override
  Future<LoginResponseModel> login(LoginParamsModel params) async {
    /// Fake awaiting time.
    await Future.delayed(const Duration(milliseconds: 700));

    if (sl<UsersService>().checkLoginInfo(params))
      return LoginResponseModel(
          sl<UsersService>().users!.firstWhere((element) => element.isOwner));
    else
      throw WrongInfoException();
  }

  @override
  Future<GetUsersResponseModel> getUsers(NoParams params) async {
    /// Fake awaiting time.
    await Future.delayed(const Duration(seconds: 3));
    return GetUsersResponseModel(sl<UsersService>().users!);
  }

  @override
  Future<GetUserResponseModel> getUser(GetUserParamsModel params) async {
    final UserModel? user = sl<UsersService>().getUser(params.userId);
    if (user != null)
      return GetUserResponseModel(user);
    else
      throw NotFoundException();
  }
}
