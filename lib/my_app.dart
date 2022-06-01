import 'package:dot_of_context_talk/background_stuff/car.dart';
import 'package:dot_of_context_talk/background_stuff/person.dart';
import 'package:dot_of_context_talk/background_stuff/theme_manager.dart';
import 'package:dot_of_context_talk/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  /// Creates an instance of [MyApp].
  const MyApp({Key? key}) : super(key: key);

  /// General info:
  /// It's just a normal function, but declared as static so it can be called
  /// from anywhere, like a global function However, your have to provide a
  /// BuildContext, so it's almost always called from within the widget tree
  /// because the only way you can get a BuildContext is to pass it from
  /// the tree, or from something else that got it passed in from the tree.
  ///
  /// Returns a specific instance of ThemeManager that belongs to AppState.
  static ThemeManager themeManagerOf(BuildContext context) {
    final AppState state = context.findAncestorStateOfType<AppState>()!;
    return state._themeManager;
  }

  /// How it works:
  /// 1) This function takes a BuildContext and returns a Person.
  ///
  /// 2) _currentPerson is declared in the State, and instantiated in initState().
  ///
  /// 3) There is only one AppState. It's referenced using
  /// context.findAncestorStateOfType<AppState>. This looks up the tree
  /// until it finds the first instance of AppState it comes across. Since
  /// there is only one, it will be the one that contains our _currentPerson
  /// instance of Person.
  ///
  /// 4) This means by calling currentPersonOf, we'll get the instance
  /// _currentPerson in return, every time.
  ///
  /// 5) This technique is used in many places, and is normally named
  /// "of". Every time, it will take a context, and this is what people are
  /// referring to when they say "of context". Some examples are
  /// "MediaQuery.of(context)", "Navigator.of(context)",
  /// "Theme.of(context)", etc.
  ///
  /// Returns a specific instance of Person that belongs to AppState.
  static Person currentPersonOf(BuildContext context) {
    final AppState state = context.findAncestorStateOfType<AppState>()!;
    return state._currentPerson;
  }

  /// Using the logic above, think about what's happening here:
  ///
  /// Returns a specific instance of Car that belongs to AppState.
  static Car currentCarOf(BuildContext context) {
    final AppState state = context.findAncestorStateOfType<AppState>()!;
    return state._currentCar;
  }

  @override
  AppState createState() => AppState();
}

class AppState extends State<MyApp> {
  /// Handles theme changes.
  late final ThemeManager _themeManager;

  /// A person, with a name and the ability to change names.
  late final Person _currentPerson;

  /// A car, with a name and the ability to change manufacturer names.
  late final Car _currentCar;

  @override
  void initState() {
    super.initState();
    _themeManager = ThemeManager();
    _currentPerson = Person(name: 'Dash');
    _currentCar = Car();
  }

  @override
  Widget build(BuildContext context) {
    /// Using an AnimatedBuilder to handle them changes
    /// instead of a package like Provider or BLoC.
    ///
    /// We could have used a ValueListenableBuilder, but
    /// in reality it would probably be too simple for a
    /// real world scenario. AnimatedBuilder allows for more
    /// complex objects to be used as the listenable, which is
    /// what gets passed into the "animation" parameter.
    return AnimatedBuilder(
      animation: _themeManager,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: '.of(context)',
          theme: _themeManager.themeData,
          home: const Home(title: '.of(context)'),
        );
      },
    );
  }
}
