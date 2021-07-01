import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/models/user.dart';
import 'package:estados/controllers/user_controller.dart';
import 'package:estados/pages/page2_page.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => {userController.removeUser()})
        ],
      ),
      body: Obx(() => userController.userExist.value
          ? UserInformationWidget(user: userController.user.value)
          : NoUserInfoWidget()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_rounded),
          onPressed: () =>
              Get.to(Page2Page(), arguments: {'name': 'Kilay', 'age': 1})),
    );
  }
}

class UserInformationWidget extends StatelessWidget {
  final User user;

  const UserInformationWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          Text(
            'Careers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...user.careers
              .map((career) => ListTile(title: Text(career)))
              .toList()
        ],
      ),
    );
  }
}

class NoUserInfoWidget extends StatelessWidget {
  const NoUserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No user information.'),
      ),
    );
  }
}
