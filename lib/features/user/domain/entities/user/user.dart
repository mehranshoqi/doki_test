import 'package:equatable/equatable.dart';

import '../../../data/models/friend/friend_model.dart';

class User extends Equatable {
  final List<String> tags;
  final List<FriendModel> friends;
  final bool isOwner;
  final int age;
  final String? picture;
  final String guid, balance, name, email, address, about, greeting;

  const User({
    required this.tags,
    required this.friends,
    required this.guid,
    required this.balance,
    required this.name,
    required this.email,
    required this.address,
    required this.about,
    required this.greeting,
    required this.isOwner,
    required this.age,
    this.picture,
  });

  @override
  List<Object?> get props => [guid, email, isOwner];
}
