import 'package:equatable/equatable.dart';

class GetUserParams extends Equatable {
  final String userId;

  const GetUserParams(this.userId);

  @override
  List<Object?> get props => [userId];
}
