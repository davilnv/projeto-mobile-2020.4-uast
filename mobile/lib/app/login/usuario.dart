import 'dart:io';

class Usuario {
  int id;
  String nome;
  String login;
  String senha;
  int pontuacao;
  String imagem;
  String nome_imagem;
  bool logado;

  Usuario({
    this.id,
    this.nome,
    this.login,
    this.senha,
    this.pontuacao,
    this.imagem,
    this.nome_imagem,
    this.logado,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "login": login,
        "senha": senha,
        "pontuacao": pontuacao,
        "imagem": imagem,
        "nome_imagem": nome_imagem,
        "logado": logado
      };

  @override
  String toString() {
    return this.id.toString() + "/" + this.login + " / " + this.senha;
  }
}
