import 'package:flutter/material.dart';

Widget getAmigos() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
                SizedBox(
                  width: 30,
                ),
                _getPerfilAmigo(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _getPerfilAmigo() {
  return Container(
    height: 150,
    width: 75,
    child: Column(
      children: <Widget>[
        Image.asset(
          'assets/images/perfil-image.png',
        ),
        SizedBox(
          height: 10,
        ),
        Text('Fulano 1'),
      ],
    ),
  );
}
