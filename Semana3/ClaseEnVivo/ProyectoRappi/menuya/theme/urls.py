from django.urls import path
from . import views


# Create your views here.
app_name = 'base'

urlpatterns = [
    path('', views.base, name='base')
]