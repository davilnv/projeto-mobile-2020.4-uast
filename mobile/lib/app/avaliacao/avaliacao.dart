import 'package:flutter/material.dart';
import 'package:mobile/shared/cores.dart';

Widget getAvaliacao() {
  return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _getCardAvaliacao(),
          SizedBox(
            height: 20,
          ),
          _getCardAvaliacao(),
          SizedBox(
            height: 20,
          ),
          _getCardAvaliacao(),
          SizedBox(
            height: 20,
          ),
          _getCardAvaliacao(),
          SizedBox(
            height: 20,
          ),
          _getCardAvaliacao(),
        ],
      ),
    ),
  );
}

Widget _getCardAvaliacao() {
  return Container(
    height: 150,
    width: 325,
    child: Card(
      color: Cores.corCard,
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Avaliação da série The Walking Dead',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Press Start 2P',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star_border,
              ),
              Icon(
                Icons.star_border,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.thumb_up_alt,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '133',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Press Start 2P',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Icon(
                Icons.thumb_down_alt,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '50',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Press Start 2P',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
