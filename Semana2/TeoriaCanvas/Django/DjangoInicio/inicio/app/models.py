from django.db import models
from django.db.models.deletion import CASCADE

# Create your models here.


class Paradigma(models.Model):
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.nombre


class Lenguaje(models.Model):
    nombre = models.CharField(max_length=50)
    paradigma = models.ForeignKey(Paradigma, on_delete=CASCADE)
    def __str__(self):
        return self.nombre
        
