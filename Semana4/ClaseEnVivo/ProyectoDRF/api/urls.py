from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('alumnos', views.alumnos),
    path('cursos', views.cursos),
    path('cursoDetalle/<int:curso_id>', views.cursoDetalle, name='cursoDetalle'),
]
