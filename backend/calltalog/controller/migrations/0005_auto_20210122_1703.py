# Generated by Django 3.1.5 on 2021-01-22 17:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('controller', '0004_auto_20210122_1609'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='imagem',
            field=models.ImageField(upload_to='path/'),
        ),
    ]
