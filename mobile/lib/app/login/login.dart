import 'package:flutter/material.dart';
import 'package:mobile/app/repository/repository_shared.dart';
import 'package:mobile/shared/cores.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _textoEscondido = true;
  RepositoryShared repositoryShared;
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  _irParaCadastrar() {
    Navigator.pushReplacementNamed(context, 'cadastrar');
  }

  _enviarParaServer() async {
    bool logado = await repositoryShared.verificarUsuario(
        loginController.text, senhaController.text);
    print(logado);
    if (logado) {
      Navigator.pushReplacementNamed(context, 'splash');
    }
  }

  @override
  void initState() {
    super.initState();
    repositoryShared = RepositoryShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Press Start 2P',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Cores.primaria,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Center(
              child: Form(
                key: _key,
                child: _getFormulario(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFormulario() {
    return Column(
      children: <Widget>[
        Icon(
          Icons.tv,
          size: 100,
        ),
        Text(
          "Calltalog",
          style: TextStyle(
            fontFamily: 'Press Start 2P',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Login',
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          controller: loginController,
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          obscureText: _textoEscondido,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Senha",
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _textoEscondido = !_textoEscondido;
                });
              },
              child: Icon(
                _textoEscondido ? Icons.visibility : Icons.visibility_off,
                semanticLabel:
                    _textoEscondido ? 'Mostrar senha' : 'Esconder Senha',
              ),
            ),
          ),
          controller: senhaController,
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: _enviarParaServer,
            padding: EdgeInsets.all(12),
            color: Cores.primaria,
            child: Text(
              "Entrar",
              style: TextStyle(
                fontFamily: 'Press Start 2P',
                color: Colors.black,
              ),
            ),
          ),
        ),
        FlatButton(
          onPressed: _irParaCadastrar,
          child: Text(
            "Não está cadastrado? Cadastre-se",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
