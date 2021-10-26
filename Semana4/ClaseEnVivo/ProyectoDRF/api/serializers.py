from rest_framework import serializers
from .models import *

class AlumnoSerializer(serializers.Serializer):
    nombre = serializers.CharField(max_length=100)

class CursoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cursos
        fields = '__all__'