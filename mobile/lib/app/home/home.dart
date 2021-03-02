import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/amigos/amigos.dart';
import 'package:mobile/app/avaliacao/avaliacao.dart';
import 'package:mobile/app/catalogo/catalogo.dart';
import 'package:mobile/app/catalogo/entretenimento.dart';
import 'package:mobile/app/home/publicacao.dart';
import 'package:mobile/app/perfil/perfil.dart';
import 'package:mobile/app/repository/repository_shared.dart';
import 'package:mobile/shared/cores.dart';
import 'package:mobile/shared/exibir_avaliacao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index;
  Widget _tela;

  var publicacoes = List<Publicacao>();
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

  getPublicacoes() async {
    RepositoryShared repositoryShared = RepositoryShared();
    List lista = await repositoryShared.listarPublicacoes();
    for (var publicacao in lista) {
      Publicacao e = Publicacao.fromJson(publicacao);
      setState(() {
        publicacoes.add(e);
      });
    }
  }

  String linkImagem(int id) {
    for (var entretenimento in entretenimentos) {
      if (entretenimento.id == id) {
        return entretenimento.imagem;
      }
    }
    return 'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg';
  }

  _verificarTela() {
    switch (_index) {
      case 0:
        print("home");
        _tela = _getHome();
        break;
      case 1:
        print("catalogo");
        _tela = Catalogo();
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
    getPublicacoes();
    getEntretenimentos();
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
        onPressed: () {
          switch (_index) {
            case 1:
              Navigator.pushReplacementNamed(
                  context, 'cadastrar_entretenimento');
              break;
            default:
              break;
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Cores.primaria,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _getMenuBar(),
    );
  }

  Widget _getHome() {
    return ListView.builder(
      // padding: EdgeInsets.all(20),
      itemCount: publicacoes.length,
      itemBuilder: (context, index) {
        return _getCardPublicacao(publicacoes[index]);
      },
    );
  }

  // Widget _getHome() {
  //   return SingleChildScrollView(
  //     child: Container(
  //       margin: EdgeInsets.all(20),
  //       child: Column(
  //         children: <Widget>[
  //           _getCardPublicacao(),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           _getCardPublicacao(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _getCardPublicacao(Publicacao publicacao) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 389,
      width: 325,
      child: Card(
        color: Cores.corCard,
        elevation: 10,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(22),
              child: Image.network(
                linkImagem(publicacao.entretenimento),
                height: 290,
                width: 250,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${publicacao.likes}"),
                Icon(
                  Icons.thumb_up_alt,
                ),
                SizedBox(
                  width: 20,
                ),
                exibirAvaliacao(publicacao.avaliacaoEntretenimento),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.thumb_down_alt,
                ),
                Text("${publicacao.deslikes}"),
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
