import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/app/catalogo/entretenimento.dart';
import 'package:mobile/app/repository/repository_shared.dart';

class Catalogo extends StatefulWidget {
  @override
  _CatalogoState createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  var entretenimentos = List<Entretenimento>();

  getEntretenimentos() async {
    RepositoryShared repositoryShared = RepositoryShared();
    List lista = await repositoryShared.listarEntretenimentos();
    for (var entretenimento in lista) {
      Entretenimento e = Entretenimento.fromJson(entretenimento);
      setState(() {
        entretenimentos.add(e);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getEntretenimentos();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.all(20),
      itemCount: entretenimentos.length,
      itemBuilder: (context, index) {
        return _getCardEntretenimento(entretenimentos[index]);
      },
    );
  }

  Widget _getCardEntretenimento(Entretenimento entretenimento) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: 150,
      height: 250,
      child: Card(
        elevation: 10,
        child: Row(
          children: <Widget>[
            Image.network(
              entretenimento.imagem,
              width: 150,
              height: 250,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _entretenimentoInfo(
                  entretenimento.titulo,
                  entretenimento.descricao,
                  entretenimento.dataLancamento,
                  entretenimento.tempo,
                  entretenimento.temporada,
                  entretenimento.episodios,
                  entretenimento.avaliacao,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entretenimentoInfo(
      String titulo,
      String descricao,
      String dataLancamento,
      int tempo,
      int temporada,
      int episodios,
      int avaliacao) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titulo,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text(
            descricao,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text(
            'Lançamento: ${_formatarData(dataLancamento)}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 1)),
          Text(
            "Tempo: $tempo",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          _verificarFilmeOuSerie(episodios, temporada),
          Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          _exibirAvaliacao(avaliacao),
        ],
      ),
    );
  }

  String _formatarData(String data) {
    var strings = data.split('-');
    var stringFinal =
        strings[2].split('T')[0] + "/" + strings[1] + "/" + strings[0];
    return stringFinal;
  }

  _verificarFilmeOuSerie(int episodios, int temporada) {
    if (episodios == 1 && temporada == 1) {
      return Text("Filme");
    } else {
      return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 1)),
          Text(
            "$temporada Temporadas",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 1)),
          Text(
            "$episodios Episódios",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      );
    }
  }

  _exibirAvaliacao(int avaliacao) {
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
}
