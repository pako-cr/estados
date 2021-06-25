part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {
  final userExist = false;
}

class UserCurrentState extends UserState {
  final userExist = true;
  final User user;

  UserCurrentState(this.user);
}
