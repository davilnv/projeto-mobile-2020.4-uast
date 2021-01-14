from django.urls import path

from .views import ListUsuario, DetailUsuario, ListEntretenimento, DetailEntretenimento, ListComentario, DetailComentario, ListPublicacao, DetailPublicacao

urlpatterns = [
    path('usuario', ListUsuario.as_view()),
    path('usuario/<int:pk>/', DetailUsuario.as_view()),
    path('entretenimento', ListEntretenimento.as_view()),
    path('entretenimento/<int:pk>/', DetailEntretenimento.as_view()),
    path('comentario', ListComentario.as_view()),
    path('comentario/<int:pk>/', DetailComentario.as_view()),
    path('publicacao', ListPublicacao.as_view()),
    path('publicacao/<int:pk>/', DetailPublicacao.as_view())
]
