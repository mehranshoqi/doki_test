import 'package:equatable/equatable.dart';

import '../../../data/models/user/user_model.dart';

class GetUsersResponse extends Equatable {
  final List<UserModel> users;

  const GetUsersResponse(this.users);

  @override
  List<Object?> get props => [users];
}
