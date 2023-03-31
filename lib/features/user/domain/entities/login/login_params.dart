import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String username, password;

  const LoginParams(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
