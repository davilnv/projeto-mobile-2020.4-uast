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

    bool confirmar = false;

    _response = await this._dio.get(url_usuario);
    List listaUsuarios = this._response.data;
    for (var user in listaUsuarios) {
      if (user['logado']) {
        confirmar = true;
      }
    }
    return confirmar;
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
            imagem: usuario['imagem'],
            nome_imagem: usuario['nome_imagem'],
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
    if (imagem == null) {
      return false;
    }

    String base64imagem = base64Encode(imagem.readAsBytesSync());
    String filename = imagem.path.split('/').last;

    user = Usuario(
      nome: nome,
      login: login,
      senha: senha,
      pontuacao: 0,
      imagem: base64imagem,
      nome_imagem: filename,
      logado: false,
    );

    _response = await this._dio.post(url_usuario, data: user.toJson());

    return true;
  }

  Future<bool> cadastrarEntretenimento(
      String titulo,
      String descricao,
      int tempo,
      int avaliacao,
      int temporada,
      int episodios,
      DateTime dataLancamento,
      File imagem) async {
    print('cadastar entretenimento');

    String fileName = imagem.path.split('/').last;

    FormData formData = FormData.fromMap({
      'titulo': titulo,
      'descricao': descricao,
      'tempo': tempo,
      'avaliacao': avaliacao,
      'temporada': temporada,
      'episodios': episodios,
      'data_lancamento': dataLancamento,
      'imagem': await MultipartFile.fromFile(imagem.path, filename: fileName),
    });

    _response = await this._dio.post(url_entretenimento, data: formData);

    return true;
  }

  Future<List> listarEntretenimentos() async {
    print('listar entretenimento');

    _response = await this._dio.get(url_entretenimento);

    List entretenimentos = _response.data;

    return entretenimentos;
  }

  // Future<String> retornarLinkImagemEntretenimento(int id) async {
  //   _response = await this._dio.get(getByIdEntretenimento(id));

  //   return _response.data
  // }

  Future<List> listarPublicacoes() async {
    print('listar publicações');

    _response = await this._dio.get(url_publicacao);

    List publicacoes = _response.data;

    return publicacoes;
  }

  Future<List> listarUsuarios() async {
    print('listar usuarios');

    // String fileName = imagem.path.split('/').last;

    _response = await this._dio.get(url_usuario);

    List usuarios = _response.data;

    return usuarios;
  }
}
