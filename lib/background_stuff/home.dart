import 'package:dot_of_context_talk/background_stuff/my_app.dart';
import 'package:dot_of_context_talk/background_stuff/neon_style_button.dart';
import 'package:dot_of_context_talk/background_stuff/provider_declarations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<Home> {
  late Color appBarColor;

  @override
  Widget build(BuildContext context) {
    var themeManagerProvider = MyApp.themeManagerOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '.of(context)',
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                child: Text(
                  'The name of the current person '
                  'is ${MyApp.currentPersonOf(context).name},\n'
                  'and they drive a ${MyApp.currentCarOf(context).typeOfCar}.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              NeonStyleButton(
                callback: () {
                  ref.read(themeProvider.state).state = themeManagerProvider.changeTheme(
                    newThemeData: themeManagerProvider.blue,
                  );
                  MyApp.currentPersonOf(context).changeName();
                  MyApp.currentCarOf(context).changeCar();
                },
                backgroundIsDark: false,
                shadowSize: 1,
                text: 'Blue',
                color: Colors.blue,
              ),
              NeonStyleButton(
                callback: () {
                  ref.read(themeProvider.state).state = themeManagerProvider.changeTheme(
                    newThemeData: themeManagerProvider.red,
                  );
                  MyApp.currentPersonOf(context).changeName();
                  MyApp.currentCarOf(context).changeCar();
                },
                backgroundIsDark: false,
                shadowSize: 1,
                text: 'Red',
                color: Colors.red,
              ),
              NeonStyleButton(
                callback: () {
                  ref.read(themeProvider.state).state = themeManagerProvider.changeTheme(
                    newThemeData: themeManagerProvider.green,
                  );
                  MyApp.currentPersonOf(context).changeName();
                  MyApp.currentCarOf(context).changeCar();
                },
                backgroundIsDark: false,
                shadowSize: 1,
                text: 'Green',
                color: Colors.green,
              ),
              NeonStyleButton(
                callback: () {
                  ref.read(themeProvider.state).state = themeManagerProvider.useRandomTheme();
                  MyApp.currentPersonOf(context).changeName();
                  MyApp.currentCarOf(context).changeCar();
                },
                backgroundIsDark: false,
                shadowSize: 1,
                text: 'Random Theme',
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
