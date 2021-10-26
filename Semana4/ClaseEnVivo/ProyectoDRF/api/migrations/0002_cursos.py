# Generated by Django 3.2.8 on 2021-10-26 01:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cursos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('email', models.EmailField(max_length=254)),
                ('direccion', models.CharField(max_length=200)),
                ('telefono', models.CharField(max_length=20)),
                ('dni', models.CharField(max_length=8)),
            ],
        ),
    ]
