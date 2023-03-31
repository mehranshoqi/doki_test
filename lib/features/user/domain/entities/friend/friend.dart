import 'package:equatable/equatable.dart';

class Friend extends Equatable {
  final int id;
  final String guid, name;

  const Friend({
    required this.id,
    required this.guid,
    required this.name,
  });

  @override
  List<Object?> get props => [guid];
}
