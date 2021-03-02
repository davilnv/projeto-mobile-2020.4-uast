import 'package:flutter/material.dart';

exibirAvaliacao(int avaliacao) {
  switch (avaliacao) {
    case 1:
      return Row(
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
        ],
      );
      break;
    case 2:
      return Row(
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
        ],
      );
      break;
    case 3:
      return Row(
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
        ],
      );
      break;
    case 4:
      return Row(
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star_border),
        ],
      );
      break;
    case 5:
      return Row(
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
        ],
      );
      break;
    default:
  }
}
