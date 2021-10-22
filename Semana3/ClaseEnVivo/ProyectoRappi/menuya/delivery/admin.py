from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(Negocio)
admin.site.register(Categoria)
admin.site.register(Plato)
admin.site.register(Cliente)
admin.site.register(FormaPago)
admin.site.register(Pedido)
admin.site.register(PedidoDetalle)
