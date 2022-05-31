import 'dart:math' as math;

class Car {
  String typeOfCar = 'Ferrari';

  List<String> cars = [
    'Ford',
    'Jaguar',
    'Kia',
    'Panoz',
    'Suzuki',
  ];

  void changeCar() {
    typeOfCar = cars[math.Random().nextInt(5)];
  }
}
