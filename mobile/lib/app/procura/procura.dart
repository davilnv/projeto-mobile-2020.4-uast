import 'package:flutter/material.dart';

Widget procuraField() {
  return Container(
    margin: EdgeInsets.all(20),
    child: TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontFamily: 'Press Start 2P',
        fontSize: 14,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        icon: Icon(Icons.search),
        hintText: 'Pesquisar',
        hintStyle: TextStyle(
          fontFamily: 'Press Start 2P',
          fontSize: 14,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            32,
          ),
        ),
      ),
      controller: null,
    ),
  );
}
