import 'package:bloc/bloc.dart';
import 'package:estados/models/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print(event);
    if (event is ActivateUser) {
      yield state.copyWith(user: event.user);
    } else if (event is IncrementUserAge) {
      if (state.userExist) {
        yield state.copyWith(
            user: state.user.copyWith(age: state.user.age + 1));
      }
    } else if (event is AddUserCareer) {
      if (state.userExist) {
        yield state.copyWith(
            user: state.user
                .copyWith(careers: [...state.user.careers, event.career]));
      }
    } else if (event is RemoveUser) {
      yield state.removeUser();
    }
  }
}
