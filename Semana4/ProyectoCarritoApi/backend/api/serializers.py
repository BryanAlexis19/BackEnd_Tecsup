from rest_framework import serializers

from .models import *

class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['imagen'] = instance.imagen.url
        return data
