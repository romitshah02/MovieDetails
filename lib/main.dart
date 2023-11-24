import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quad_assignment/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen.scale(
          nextScreen: const Home(),
          duration: const Duration(milliseconds: 1500),
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('assets/logo.png'),
          )),
    );
  }
}
