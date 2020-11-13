import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

import './src/pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Middle Man',
      theme: ThemeData(primarySwatch: Colors.blue, buttonColor: Colors.blue),
      home: AnimatedSplash(
        imagePath: 'assets/splash.png',
        home: IndexPage(),
        duration: 3000,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
