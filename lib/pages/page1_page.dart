import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:estados/models/user.dart';
import 'package:estados/bloc/user/user_cubit.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case UserCurrentState:
              return UserInformationWidget(
                  user: (state as UserCurrentState).user);
              break;
            case UserInitialState:
              return Center(child: Text('No user information.'));
              break;
            default:
              return Center(child: Text('No user state defined.'));
              break;
          }
        },
      ),
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
          ...user?.careers
              ?.map((career) => ListTile(title: Text(career)))
              ?.toList()
        ],
      ),
    );
  }
}
