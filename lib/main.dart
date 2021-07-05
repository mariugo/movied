import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movied/screens/main_screen.dart';
import '/screens/splash_screen.dart';

void main() {
  runApp(
    SplashScreen(
      key: UniqueKey(),
      onInitComplete: () => runApp(
        ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movied',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => MainScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
