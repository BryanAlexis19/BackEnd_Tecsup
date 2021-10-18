from django.urls import path
from . import views


# Create your views here.
app_name = 'delivery'

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:plato_id>', views.plato, name='plato')
]