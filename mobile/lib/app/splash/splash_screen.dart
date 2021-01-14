import 'package:flutter/material.dart';
import 'package:mobile/shared/cores.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.primaria,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.tv,
              size: 180,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Calltalog",
              style: TextStyle(
                fontFamily: 'Press Start 2P',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
