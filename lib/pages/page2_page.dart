import 'package:flutter/material.dart';

import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData ? Text(snapshot.data.name) : Text('Page 2');
          },
        ),
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
              userService
                  .setUser(new User(name: 'Francisco', age: 26, careers: null));
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
              userService.setAge(userService.user.age + 1);
            },
          ),
          MaterialButton(
            child: Text(
              'Set Career',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
