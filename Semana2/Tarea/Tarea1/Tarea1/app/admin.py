from django.contrib import admin

from .models import *
# Register your models here.

admin.site.register(clientes)
admin.site.register(servicios)
admin.site.register(boletas)

