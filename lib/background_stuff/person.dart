import 'dart:math' as math;

class Person {
  /// Creates an instance of [Person].
  Person({
    required this.name,
  });

  /// The name of the Person.
  String name;

  /// A list of names that will be chosen from at random.
  List<String> names = ['Jack', 'Yolanda', 'Pawan', 'Gunther', 'Min'];

  /// Randoms a name from "names" and assigns it to name.
  void changeName() {
    name = names[math.Random().nextInt(5)];
  }
}
