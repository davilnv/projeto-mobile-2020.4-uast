import 'package:flutter/material.dart';
import 'package:mobile/app/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> rotas = {
      // 'home': (_)=>Home(),
      // 'login': (_)=>Login(),
    };

    return MaterialApp(
      routes: rotas,
      home: Splash(),
    );
  }
}
