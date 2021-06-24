import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/services/user_service.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: userService.userExist
            ? Text(userService.user.name)
            : Text('Page 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text(
              'Set User name',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userService.user = new User(
                  name: 'Kilay',
                  age: 1,
                  careers: ['Professional Dog', 'Professional Stick Chaser']);
            },
          ),
          MaterialButton(
            child: Text(
              'Set User Age',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              if (userService.userExist) {
                userService.setAge(userService.user.age + 1);
              }
            },
          ),
          MaterialButton(
            child: Text(
              'Set Career',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              if (userService.userExist) {
                userService.addCareer('New Profession');
              }
            },
          )
        ],
      )),
    );
  }
}
