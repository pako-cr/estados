part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;

  ActivateUser(this.user);
}

class IncrementUserAge extends UserEvent {
  IncrementUserAge();
}

class AddUserCareer extends UserEvent {
  final String career;

  AddUserCareer(this.career);
}

class RemoveUser extends UserEvent {
  RemoveUser();
}
