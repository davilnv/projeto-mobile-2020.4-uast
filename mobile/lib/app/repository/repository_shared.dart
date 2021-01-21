import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile/app/login/usuario.dart';
import 'package:mobile/shared/urls.dart';

class RepositoryShared {
  Dio _dio;
  Response _response;

  RepositoryShared() {
    this._dio = Dio();
  }

  Future<bool> verificarLogin() async {
    print('logar');

    _response = await this._dio.get(url_usuario);
    return this._response.data[0]['logado'];
  }

  Future<bool> verificarUsuario(String login, String senha) async {
    print('verificar usuario');
    bool logado;
    Usuario user;
    _response = await this._dio.get(url_usuario);
    List listaUsuarios = this._response.data;
    for (var usuario in listaUsuarios) {
      if (usuario['login'] == login && usuario['senha'] == senha) {
        user = Usuario(
            id: usuario['id'],
            nome: usuario['nome'],
            login: usuario['login'],
            senha: usuario['senha'],
            pontuacao: usuario['pontuacao'],
            link_imagem_perfil: usuario['link_imagem_perfil'],
            logado: true);
        _response =
            await this._dio.put(alterarUsuario(user.id), data: user.toJson());
        logado = user.logado;
      }
    }
    return logado;
  }

  Future<bool> cadastrarUsuario(
      String nome, String login, String senha, File imagem) async {
    print('cadastar usuario');
    Usuario user;
    _response = await this._dio.get(url_usuario);
    List listaUsuarios = this._response.data;

    for (var usuario in listaUsuarios) {
      if (login == usuario['login']) {
        return false;
      }
    }
    if (imagem == null) return false;

    String base64imagem = base64Encode(imagem.readAsBytesSync());
    String filename = imagem.path.split('/').last;

    return this._response.data[0]['logado'];
  }
}
