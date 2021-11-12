from djongo import models

class Categoria(models.Model):
    nombre = models.CharField(max_length=200, default='')

    def __str__(self):
        return self.nombre

    """ class Meta:
        abstract = True """

class Producto(models.Model):
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=200, default='')
    
    def __str__(self):
        return self.nombre
