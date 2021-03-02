class Entretenimento {
  int id;
  String titulo;
  String descricao;
  int tempo;
  String dataLancamento;
  int avaliacao;
  int temporada;
  int episodios;
  String imagem;

  Entretenimento(
      {this.id,
      this.titulo,
      this.descricao,
      this.tempo,
      this.dataLancamento,
      this.avaliacao,
      this.temporada,
      this.episodios,
      this.imagem});

  Entretenimento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    tempo = json['tempo'];
    dataLancamento = json['data_lancamento'];
    avaliacao = json['avaliacao'];
    temporada = json['temporada'];
    episodios = json['episodios'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['tempo'] = this.tempo;
    data['data_lancamento'] = this.dataLancamento;
    data['avaliacao'] = this.avaliacao;
    data['temporada'] = this.temporada;
    data['episodios'] = this.episodios;
    data['imagem'] = this.imagem;
    return data;
  }
}
