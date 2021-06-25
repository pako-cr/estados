import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  void setUser(User user) {
    emit(UserCurrentState(user));
  }

  void setUserAge() {
    final currentState = state;
    if (currentState is UserCurrentState) {
      final newUser =
          currentState.user.copyWith(age: currentState.user.age + 1);
      emit(UserCurrentState(newUser));
    }
  }

  void addUserCareer(String career) {
    final currentState = state;
    if (currentState is UserCurrentState) {
      final newCareers = [...currentState.user.careers, career];
      // newCareers.add(career);
      final newUser = currentState.user.copyWith(careers: newCareers);
      emit(UserCurrentState(newUser));
    }
  }

  void removeUser() {
    emit(UserInitialState());
  }
}
