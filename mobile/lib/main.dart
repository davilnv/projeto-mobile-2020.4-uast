import 'package:flutter/material.dart';
import 'package:mobile/app/cadastrar/cadastrar.dart';
import 'package:mobile/app/home/home.dart';
import 'package:mobile/app/login/login.dart';
import 'package:mobile/app/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> rotas = {
      'splash': (_) => Splash(),
      'home': (_) => Home(),
      'login': (_) => Login(),
      'cadastrar': (_) => Cadastrar()
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: rotas,
      home: Splash(),
    );
  }
}
