from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from controller import models
from .serializers import UsuarioSerializer, EntretenimentoSerializer, ComentarioSerializer, PublicacaoSerializer


class ListUsuario(generics.ListCreateAPIView):
    queryset = models.Usuario.objects.all()
    serializer_class = UsuarioSerializer


class DetailUsuario(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Usuario.objects.all()
    serializer_class = UsuarioSerializer


class ListEntretenimento(generics.ListCreateAPIView):
    queryset = models.Entretenimento.objects.all()
    serializer_class = EntretenimentoSerializer


class DetailEntretenimento(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Entretenimento.objects.all()
    serializer_class = EntretenimentoSerializer


class ListComentario(generics.ListCreateAPIView):
    queryset = models.Comentario.objects.all()
    serializer_class = ComentarioSerializer


class DetailComentario(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Comentario.objects.all()
    serializer_class = ComentarioSerializer


class ListPublicacao(generics.ListCreateAPIView):
    queryset = models.Publicacao.objects.all()
    serializer_class = PublicacaoSerializer


class DetailPublicacao(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Publicacao.objects.all()
    serializer_class = PublicacaoSerializer
