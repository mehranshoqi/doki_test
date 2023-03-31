import '../../../../core/entities/no_params.dart';
import '../models/get_user/params/get_user_params_model.dart';
import '../models/get_user/response/get_user_response_model.dart';
import '../models/get_users/response/get_users_response_model.dart';
import '../models/login/params/login_params_model.dart';
import '../models/login/response/login_response_model.dart';


/// 
abstract class UserDataSource {
  /// login
  Future<LoginResponseModel> login(LoginParamsModel params);
  /// get users
  Future<GetUsersResponseModel> getUsers(NoParams params);
  /// get user (find friends)
  Future<GetUserResponseModel> getUser(GetUserParamsModel params);
}
