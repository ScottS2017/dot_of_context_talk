import 'dart:math' as math;

class Person {
  Person({
    required this.name,
  });
  String name;

  List<String> names = ['Jack', 'Yolanda', 'Pawan', 'Gunther', 'Min'];

  void changeName() {
    name = names[math.Random().nextInt(5)];
  }
}
