import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:estados/bloc/user/user_cubit.dart';
import 'package:estados/models/user.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
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
              userCubit.setUser(new User(
                  name: 'Mali',
                  age: 1,
                  careers: ['Professional Dog', 'Professional ball chaser']));
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
              userCubit.setUserAge();
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
              userCubit.addUserCareer('Professional Dog');
            },
          ),
          MaterialButton(
            child: Text(
              'Remove User',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userCubit.removeUser();
            },
          )
        ],
      )),
    );
  }
}
