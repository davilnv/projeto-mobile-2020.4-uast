from rest_framework import serializers
from controller import models


class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'nome',
            'login',
            'senha',
            'pontuacao',
            'link_imagem_perfil',
            'logado'
        )
        model = models.Usuario


class EntretenimentoSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'titulo',
            'descricao',
            'tempo',
            'data_lancamento',
            'avaliacao',
            'temporada',
            'episoios',
            'link_imagem_capa'
        )
        model = models.Entretenimento


class ComentarioSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'usuario',
            'data',
            'descricao',
            'likes',
            'deslikes'
        )
        model = models.Comentario


class PublicacaoSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'titulo',
            'descricao',
            'usuario',
            'entretenimento',
            'avaliacao_entretenimento',
            'likes',
            'deslikes',
            'comentarios'
        )
        model = models.Publicacao
