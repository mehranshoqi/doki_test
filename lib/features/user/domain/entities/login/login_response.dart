import 'package:equatable/equatable.dart';

import '../../../data/models/user/user_model.dart';

class LoginResponse extends Equatable {
  final UserModel owner;
  const LoginResponse(this.owner);

  @override
  List<Object?> get props => [owner];
}
