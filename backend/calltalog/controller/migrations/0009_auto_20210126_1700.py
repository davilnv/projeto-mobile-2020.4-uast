# Generated by Django 3.1.5 on 2021-01-26 17:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('controller', '0008_auto_20210126_1654'),
    ]

    operations = [
        migrations.RenameField(
            model_name='entretenimento',
            old_name='episoios',
            new_name='episodios',
        ),
    ]