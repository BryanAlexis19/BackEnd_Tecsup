# Generated by Django 3.2.8 on 2021-10-27 00:25

import cloudinary.models
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('imagen', cloudinary.models.CloudinaryField(default='', max_length=255, verbose_name='image')),
                ('precio', models.DecimalField(decimal_places=2, max_digits=9)),
            ],
        ),
    ]
