import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/app/repository/repository_shared.dart';
import 'package:mobile/shared/cores.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  RepositoryShared repositoryShared;

  void startTime() {
    new Timer(Duration(seconds: 1), navigate); // Alterar tempo de carregamento
  }

  void navigate() async {
    print('navigate');

    bool flag = await this.repositoryShared.verificarLogin();
    if (flag) {
      Navigator.pushReplacementNamed(context, 'home');
      return;
    }
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  void initState() {
    super.initState();
    this.repositoryShared = RepositoryShared();
    this.startTime();
  }

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
