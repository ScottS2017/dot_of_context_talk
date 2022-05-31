import 'package:dot_of_context_talk/background_stuff/car.dart';
import 'package:dot_of_context_talk/background_stuff/home.dart';
import 'package:dot_of_context_talk/background_stuff/person.dart';
import 'package:dot_of_context_talk/background_stuff/provider_declarations.dart';
import 'package:dot_of_context_talk/background_stuff/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  /// It's just a normal function, but declared as static so it can be called
  /// from anywhere, like a global function... but your have to provide a
  /// context so it can find the MyApp instance in the tree.
  static ThemeManager themeManagerOf(BuildContext context) {
    final MyAppState state = context.findAncestorStateOfType<MyAppState>()!;
    return state._themeManager;
  }

  static Person currentPersonOf(BuildContext context) {
    final MyAppState state = context.findAncestorStateOfType<MyAppState>()!;
    return state._currentPerson;
  }

  static Car currentCarOf(BuildContext context) {
    final MyAppState state = context.findAncestorStateOfType<MyAppState>()!;
    return state._currentCar;
  }

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final ThemeManager _themeManager;
  late final Person _currentPerson;
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
    return ProviderScope(
      child: Consumer(builder: (BuildContext context, WidgetRef ref, _) {
        final ThemeData currentTheme = ref.watch(themeProvider);
        return MaterialApp(
            title: '.of(context)', theme: currentTheme, home: const Home(title: '.of(context)'));
      }),
    );
  }
}
