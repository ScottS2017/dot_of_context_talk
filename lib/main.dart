import 'package:dot_of_context_talk/background_stuff/app_theme.dart';
import 'package:dot_of_context_talk/background_stuff/neon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'background_stuff/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (BuildContext context, WidgetRef ref, _) {
        ref.read(themeProvider.notifier).state = Theme.of(context);
        return const MyHomePage(title: 'Flutter Demo Home Page');
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color pageBackgroundColor;
  late Color textBackgroundColor;

  int tracker = 1;

  @override
  Widget build(BuildContext context) {
    pageBackgroundColor = Theme.of(context).backgroundColor;
    textBackgroundColor = Theme.of(context).colorScheme.secondary;
    return Consumer(builder: (BuildContext context, WidgetRef ref, _) {
      tracker += 1;
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ref.watch(themeProvider),
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: FractionallySizedBox(
              heightFactor: 1.0,
              widthFactor: 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NeonStyleButton(
                    callback: () {
                      ref.read(themeProvider.notifier).state = Theme.of(context).copyWith(
                        colorScheme: AppTheme.createColorSchemeBasedOn(
                          baseColor: Colors.red,
                        ),
                      );
                    },
                    backgroundIsDark: false,
                    shadowSize: 1,
                    text: 'Red Theme',
                    color: Colors.red,
                  ),
                  NeonStyleButton(
                    callback: () {
                      ref.read(themeProvider.notifier).state = Theme.of(context).copyWith(
                        colorScheme: AppTheme.createColorSchemeBasedOn(
                          baseColor: Colors.green,
                        ),
                      );
                    },
                    backgroundIsDark: false,
                    shadowSize: 1,
                    text: 'Green Theme',
                    color: Colors.green,
                  ),
                  NeonStyleButton(
                    callback: () {
                      ref.read(themeProvider.notifier).state = Theme.of(context).copyWith(
                        colorScheme: AppTheme.createColorSchemeBasedOn(
                          baseColor: Colors.blue,
                        ),
                      );
                    },
                    backgroundIsDark: false,
                    shadowSize: 1,
                    text: 'Blue Theme',
                    color: Colors.blue,
                  ),
                  NeonStyleButton(
                    callback: () {
                      ref.read(themeProvider.notifier).state = Theme.of(context).copyWith(
                        colorScheme: AppTheme.createColorSchemeBasedOn(
                          baseColor: AppTheme.generateRandomColor(),
                        ),
                      );
                    },
                    backgroundIsDark: false,
                    shadowSize: 1,
                    text: 'Random Theme $tracker',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
