import 'package:flutter/material.dart';

Widget getCatalogo() {
  return SingleChildScrollView(
    child: Container(
      // margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getCardEntretenimento(),
                SizedBox(
                  width: 25,
                ),
                _getCardEntretenimento(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getCardEntretenimento(),
                SizedBox(
                  width: 25,
                ),
                _getCardEntretenimento(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getCardEntretenimento(),
                SizedBox(
                  width: 25,
                ),
                _getCardEntretenimento(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _getCardEntretenimento() {
  return Container(
    height: 250,
    width: 150,
    child: Image.asset(
      'assets/images/twd-capa.jpeg',
    ),
  );
}
