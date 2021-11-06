from django.db import models
from cloudinary.models import CloudinaryField

from django.contrib.auth.models import User

class Cargo(models.Model):
    cargo_id = models.AutoField(primary_key=True)
    cargo_nom = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'tbl_cargo'

    def __str__(self):
        return self.cargo_nom


class Categoria(models.Model):
    categoria_id = models.AutoField(primary_key=True)
    categoria_nom = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tbl_categoria'

    def __str__(self):
        return self.categoria_nom


class Empleado(models.Model):
    empleado_id = models.AutoField(primary_key=True)
    empleado_nom = models.CharField(max_length=200)
    cargo = models.ForeignKey(Cargo, models.DO_NOTHING)
    usuario = models.OneToOneField(User, on_delete=models.RESTRICT)

    class Meta:
        managed = False
        db_table = 'tbl_empleado'

    def __str__(self):
        return self.empleado_nom


class Mesa(models.Model):
    mesa_id = models.AutoField(primary_key=True)
    mesa_nro = models.CharField(max_length=3)
    mesa_cap = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_mesa'
    
    def __str__(self):
        return self.mesa_nro


class Pedido(models.Model):
    pedido_id = models.AutoField(primary_key=True)
    pedido_fech = models.DateTimeField(blank=True, null=True)
    pedido_nro = models.CharField(max_length=200, blank=True, null=True)
    pedido_est = models.CharField(max_length=100, blank=True, null=True)
    mesa = models.ForeignKey(Mesa, models.DO_NOTHING)
    empleado = models.ForeignKey(Empleado, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_pedido'
    
    def __str__(self):
        return self.pedido_nro


class Plato(models.Model):
    plato_id = models.AutoField(primary_key=True)
    plato_nom = models.CharField(max_length=200)
    #plato_img = models.CharField(max_length=200)
    plato_img = CloudinaryField('image',default='')
    plato_pre = models.FloatField()
    categoria = models.ForeignKey(Categoria, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_plato'

    def __str__(self):
        return self.plato_nom


class PlatoPedido(models.Model):
    pedido_plato_id = models.AutoField(primary_key=True)
    pedido_plato_cant = models.IntegerField(blank=True, null=True)
    pedido_plato_pre = models.FloatField(blank=True, null=True)
    pedido = models.ForeignKey(Pedido, models.DO_NOTHING)
    plato = models.ForeignKey(Plato, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_plato_pedido'

    def __str__(self):
        return self.pedido_plato_id