class User {
  String name;
  int age;
  List<String> careers;

  User({this.name, this.age, this.careers});

  User copyWith({String name, int age, List<String> careers}) => User(
      name: name ?? this.name,
      age: age ?? this.age,
      careers: careers ?? this.careers);
}
