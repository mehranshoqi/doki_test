import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../features/user/data/models/user/user_model.dart';

@injectable
class UsersService {
  List<UserModel>? users;
  static final UsersService _usersService = UsersService._create();

  factory UsersService() => _usersService;

  UsersService._create() {
    users = [];
    readUsers();
  }

  Future<List> _readJson() async {
    final String response =
        await rootBundle.loadString('lib/core/helpers/data.json');
    final data = await json.decode(response);
    return data;
  }

  Future<void> readUsers() async {
    final List listData = await _readJson();
    List<UserModel> _users = [];
    for (Map<String, dynamic> map in listData)
      _users.add(UserModel.fromJson(map));
    users = _users;
    return;
  }

  UserModel? getUser(String userId) => users!.firstWhereOrNull((user) => user.guid == userId);

  
}
