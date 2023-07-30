import 'package:CFC/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'CFC',
        // theme: ThemeData(brightness: Brightness.light),
        // darkTheme: ThemeData(brightness: Brightness.dark),
        // themeMode: ThemeMode.system,
        home: SplashScreen()
    );
  }
}