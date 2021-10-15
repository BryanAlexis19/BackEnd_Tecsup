from django.db import models
from django.db.models.base import Model
from django.db.models.fields import DecimalField, EmailField
from django.db.models.deletion import CASCADE

# Create your models here.


class clientes(models.Model):
    codCliente = models.IntegerField()
    nombreCliente = models.CharField(max_length=50)
    movilCliente = models.CharField(max_length=9)
    edadCliente = models.IntegerField()
    correoCliente = models.CharField(max_length=60)

    def __str__(self):
        return self.nombreCliente


class servicios(models.Model):
    codServicio = models.IntegerField()
    nombreServicio = models.CharField(max_length=50)
    precioServicio = models.DecimalField(decimal_places=3, max_digits=10)

    def __str__(self):
        return self.nombreServicio


class boletas(models.Model):
    codBoleta = models.IntegerField()
    codCliente = models.ForeignKey(clientes, on_delete=models.CASCADE)
    codServicio = models.ForeignKey(servicios, on_delete=models.CASCADE)
    fechaBoleta = models.DateField()

    def __str__(self):
        return str(self.codBoleta)
