import 'package:get/get.dart';
import 'package:estados/models/user.dart';

class UserController extends GetxController {
  RxBool userExist = false.obs;
  Rx<User> user = new User().obs;

  int get careersCount {
    return this.user.value.careers.length;
  }

  void initUser(User user) {
    this.user.value = user;
    this.userExist.value = true;
  }

  void incrementAge() {
    this.user.update((val) {
      val?.age = (val.age ?? 0) + 1;
    });
  }

  void addCareer(String career) {
    this.user.update((val) {
      val?.careers = [...this.user.value.careers, career];
    });
  }

  void removeUser() {
    this.user = new User().obs;
    this.userExist = false.obs;

    // this.user.refresh();
    // this.userExist.refresh();
  }
}
