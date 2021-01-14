from django.contrib import admin

# Register your models here.
from .models import Usuario, Entretenimento, Comentario, Publicacao

admin.site.register(Usuario)
admin.site.register(Entretenimento)
admin.site.register(Comentario)
admin.site.register(Publicacao)
