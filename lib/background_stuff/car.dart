import 'dart:math' as math;

class Car {
  /// Creates an instance of [Car].
  Car({
    this.typeOfCar = 'Ferrari',
  });

  /// The name of the car's manufacturer.
  String typeOfCar;

  /// A list of cars that will be chosen from at random.
  List<String> cars = [
    'Ford',
    'Jaguar',
    'Kia',
    'Panoz',
    'Suzuki',
  ];

  /// Randoms a name from "cars" and assigns it to typeOfCar.
  void changeCar() {
    typeOfCar = cars[math.Random().nextInt(5)];
  }
}
