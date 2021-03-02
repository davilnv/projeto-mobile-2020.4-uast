class Publicacao {
  int id;
  String titulo;
  String descricao;
  int usuario;
  int entretenimento;
  int avaliacaoEntretenimento;
  int likes;
  int deslikes;
  List<int> comentarios;

  Publicacao(
      {this.id,
      this.titulo,
      this.descricao,
      this.usuario,
      this.entretenimento,
      this.avaliacaoEntretenimento,
      this.likes,
      this.deslikes,
      this.comentarios});

  Publicacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    usuario = json['usuario'];
    entretenimento = json['entretenimento'];
    avaliacaoEntretenimento = json['avaliacao_entretenimento'];
    likes = json['likes'];
    deslikes = json['deslikes'];
    comentarios = json['comentarios'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['usuario'] = this.usuario;
    data['entretenimento'] = this.entretenimento;
    data['avaliacao_entretenimento'] = this.avaliacaoEntretenimento;
    data['likes'] = this.likes;
    data['deslikes'] = this.deslikes;
    data['comentarios'] = this.comentarios;
    return data;
  }
}
