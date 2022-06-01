import 'package:dot_of_context_talk/background_stuff/neon_style_button.dart';
import 'package:dot_of_context_talk/my_app.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  /// Creates an instance of [Home].
  const Home({Key? key, required this.title}) : super(key: key);

  /// The title of the app.
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    /// This is only for readability. You could just as easily
    /// use the function call in the places it's used.
    var themeManager = MyApp.themeManagerOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),

        /// Theme.of(context) is your friend!!!
        /// Remember, the themeManager is returning a ThemeData
        /// object. You still need to access the theme via
        /// Theme.of(context)
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                child: Text(
                  'The name of the current person '

                  /// This is going up the tree to MyApp,
                  /// running currentPersonOf and returning
                  /// the name of the Person returned
                  /// from that call.
                  'is ${MyApp.currentPersonOf(context).name},\n'

                  /// currentCarOf is working the same way.
                  'and they drive a ${MyApp.currentCarOf(context).typeOfCar}.',
                  textAlign: TextAlign.center,

                  /// Theme.of(context) returns a Theme, which
                  /// contains a TextTheme. titleLarge is
                  /// the Material Design compliant font size, 22.
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              NeonStyleButton(
                callback: () {
                  /// Using our readability variable from above to call
                  /// the changeTheme function of the specific instance of
                  /// ThemeManager in MyApp, "themeManagerOf".
                  themeManager.changeTheme(
                    newThemeData: themeManager.blue,
                  );

                  /// Using the same technique to change the names of
                  /// MyApp's instances of Person and Car. These two
                  /// don't use a readability variable, but we could
                  /// easily have done so.
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
                  themeManager.changeTheme(
                    newThemeData: themeManager.red,
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
                  themeManager.changeTheme(
                    newThemeData: themeManager.green,
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
                  themeManager.useRandomTheme();
                  MyApp.currentPersonOf(context).changeName();
                  MyApp.currentCarOf(context).changeCar();
                },
                backgroundIsDark: false,
                shadowSize: 1,
                text: 'Random Theme',

                /// Again, access the primary color via
                /// Theme.of(context), not via themeManager.
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
