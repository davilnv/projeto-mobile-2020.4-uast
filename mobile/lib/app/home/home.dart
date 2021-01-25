import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/amigos/amigos.dart';
import 'package:mobile/app/avaliacao/avaliacao.dart';
import 'package:mobile/app/catalogo/catalogo.dart';
import 'package:mobile/app/perfil/perfil.dart';
import 'package:mobile/shared/cores.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index;
  Widget _tela;

  _verificarTela() {
    switch (_index) {
      case 0:
        print("home");
        _tela = _getHome();
        break;
      case 1:
        print("catalogo");
        _tela = getCatalogo();
        break;
      case 2:
        print("amigos");
        _tela = getAmigos();
        break;
      case 3:
        print("avaliacao");
        _tela = getAvaliacao();
        break;
      case 4:
        print("perfil");
        _tela = getPerfil();
        break;
      default:
        print("home");
        _tela = _getHome();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _index = 0;
    _verificarTela();
  }

  _mudarPagina(int index) {
    print(index);
    setState(() {
      _index = index;
      _verificarTela();
    });
  }

  _pesquisar() {}

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
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: _pesquisar,
        ),
      ),
      body: Center(
        child: _tela,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Cores.primaria,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _getMenuBar(),
    );
  }

  Widget _getHome() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _getCardPublicacao(),
            SizedBox(
              height: 20,
            ),
            _getCardPublicacao(),
          ],
        ),
      ),
    );
  }

  Widget _getCardPublicacao() {
    return Container(
      height: 389,
      width: 325,
      child: Card(
        color: Cores.corCard,
        elevation: 10,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(22),
              // child: Image.network(
              //   "https://upload.wikimedia.org/wikipedia/pt/5/59/The_walking_dead_season_10_poster.jpg",
              //   height: 290,
              //   width: 250,
              // ),
              child: Image.asset(
                'assets/images/twd-capa.jpeg',
                height: 290,
                width: 250,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.thumb_up_alt,
                ),
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
                Icon(
                  Icons.thumb_down_alt,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMenuBar() {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: _index,
      onTap: _mudarPagina,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      elevation: 8,
      fabLocation: BubbleBottomBarFabLocation.end,
      hasNotch: true,
      hasInk: true,
      inkColor: Colors.black,
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
          backgroundColor: Cores.primaria,
          icon: Icon(
            Icons.article,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.article,
            color: Cores.primaria,
          ),
          title: Text("Home"),
        ),
        BubbleBottomBarItem(
          backgroundColor: Cores.primaria,
          icon: Icon(
            Icons.local_movies,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.local_movies,
            color: Cores.primaria,
          ),
          title: Text("Catálogo"),
        ),
        BubbleBottomBarItem(
          backgroundColor: Cores.primaria,
          icon: Icon(
            Icons.group,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.group,
            color: Cores.primaria,
          ),
          title: Text("Amigos"),
        ),
        BubbleBottomBarItem(
          backgroundColor: Cores.primaria,
          icon: Icon(
            Icons.rate_review,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.rate_review,
            color: Cores.primaria,
          ),
          title: Text("Avaliação"),
        ),
        BubbleBottomBarItem(
          backgroundColor: Cores.primaria,
          icon: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.account_circle,
            color: Cores.primaria,
          ),
          title: Text("Perfil"),
        ),
      ],
    );
  }
}
