import 'package:equatable/equatable.dart';

import '../../../data/models/user/user_model.dart';

class GetUserResponse extends Equatable {
  final UserModel user;

  const GetUserResponse(this.user);

  @override
  List<Object?> get props => [user];
}
