class Usuario {
  int id;
  String nome;
  String login;
  String senha;
  int pontuacao;
  String link_imagem_perfil;
  bool logado;

  Usuario({
    this.id,
    this.nome,
    this.login,
    this.senha,
    this.pontuacao,
    this.link_imagem_perfil,
    this.logado,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "login": login,
        "senha": senha,
        "pontuacao": pontuacao,
        "link_imagem_perfil": link_imagem_perfil,
        "logado": logado
      };

  @override
  String toString() {
    return this.nome;
  }
}
