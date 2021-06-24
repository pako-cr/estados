import 'package:meta/meta.dart';

class User {
  String name;
  int age;
  List<String> careers;

  User({
    @required this.name,
    this.age,
    this.careers,
  });
}
