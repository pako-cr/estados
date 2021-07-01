import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/controllers/user_controller.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2 ${Get.arguments['name']}'),
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
              userController.initUser(User(
                  name: 'Mali',
                  age: 1,
                  careers: ['Professional Dog', 'Professional Jumping Dog']));

              Get.snackbar('User changed', 'The user is set.',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                    )
                  ]);
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
              userController.incrementAge();
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
              userController
                  .addCareer('Pro dog ${userController.careersCount + 1}');
            },
          ),
          MaterialButton(
            child: Text(
              'Set Theme',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
          ),
        ],
      )),
    );
  }
}
