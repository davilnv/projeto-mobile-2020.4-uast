import 'package:flutter/material.dart';
import 'package:mobile/shared/cores.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calltalog",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Press Start 2P',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Cores.primaria,
      ),
    );
  }
}
