import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Hooks Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  /// [state] stores the AppLifecycleState which allows us to hide
  /// sensitive information when app is minimized and snapshot of app
  /// is shown in recent apps
  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            /// Checks is current state is AppLifecycleState.resumed
            /// If true, then opacity is set to 1.0
            ///
            /// If false, then app in minimized, so the sensitive information must be
            /// hidden -> opacity is set to 0.0
            opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withAlpha(100),
                  spreadRadius: 10,
                )
              ]),
              child: Image.asset('assets/card.png'),
            ),
          ),
        ),
      ),
    );
  }
}
