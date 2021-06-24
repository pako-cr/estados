import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () => userService.removeUser(),
          )
        ],
      ),
      body: userService.userExist
          ? UserInformationWidget(user: userService.user)
          : Center(child: Text('No user information')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_rounded),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInformationWidget extends StatelessWidget {
  final User user;

  const UserInformationWidget({this.user});

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
              .toList(),
        ],
      ),
    );
  }
}
