import 'package:flutter/material.dart';

import 'package:estados/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get user => this._user;

  bool get userExist => this._user != null;

  set user(User user) {
    this._user = user;
    notifyListeners();
  }

  void setAge(int age) {
    this._user.age = age;
    notifyListeners();
  }

  void removeUser() {
    this._user = null;
    notifyListeners();
  }

  void addCareer(String career) {
    this._user.careers.add(career);
    notifyListeners();
  }
}
