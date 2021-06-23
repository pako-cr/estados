import 'dart:async';

import 'package:estados/models/user.dart';

class _UserService {
  // Stream
  StreamController<User> _userStreamController =
      new StreamController<User>.broadcast();

  Stream<User> get userStream => _userStreamController.stream;

  // User
  User _user;

  User get user => this._user;

  bool get userExist => this._user != null;

  void setUser(User user) {
    this._user = user;
    this._userStreamController.add(this._user);
  }

  void setAge(int age) {
    this._user.age = age;
    this._userStreamController.add(this._user);
  }

  dispose() {
    this._userStreamController?.close();
  }
}

final userService = new _UserService();
