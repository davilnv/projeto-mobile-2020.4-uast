from django.db import models
from django.utils import timezone

# Create your models here.


class Usuario(models.Model):
    nome = models.CharField(max_length=200)
    login = models.CharField(max_length=200)
    senha = models.CharField(max_length=200)
    pontuacao = models.IntegerField()
    imagem = models.TextField()
    nome_imagem = models.CharField(max_length=200)
    logado = models.BooleanField(default=False)

    def __str__(self):
        return self.login


class Entretenimento(models.Model):
    titulo = models.CharField(max_length=200)
    descricao = models.TextField()
    tempo = models.IntegerField()
    data_lancamento = models.DateTimeField(default=timezone.now)
    avaliacao = models.IntegerField()
    temporada = models.IntegerField()
    episoios = models.IntegerField()
    link_imagem_capa = models.CharField(max_length=200)

    def __str__(self):
        return self.titulo


class Comentario(models.Model):
    usuario = models.ForeignKey(
        Usuario, on_delete=models.CASCADE, related_name='usuarios_comentarios')
    data = models.DateTimeField(default=timezone.now)
    descricao = models.TextField()
    likes = models.IntegerField()
    deslikes = models.IntegerField()

    def __str__(self):
        return self.usuario.nome


class Publicacao(models.Model):
    titulo = models.CharField(max_length=200)
    descricao = models.TextField()
    usuario = models.ForeignKey(
        Usuario, on_delete=models.CASCADE, related_name='usuarios_publicacoes')
    entretenimento = models.OneToOneField(
        Entretenimento, on_delete=models.SET_NULL,  null=True)
    avaliacao_entretenimento = models.IntegerField()
    likes = models.IntegerField()
    deslikes = models.IntegerField()
    comentarios = models.ManyToManyField(Comentario)

    def __str__(self):
        return self.titulo
