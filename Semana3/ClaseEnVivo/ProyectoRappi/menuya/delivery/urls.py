from django.urls import path
from . import views


# Create your views here.
app_name = 'delivery'

urlpatterns = [
    path('menu', views.menu, name='menu'),
    path('menulist', views.menulist, name='menulist'),
    path('<int:plato_id>', views.plato, name='plato'),
    path('agregarCarrito/<int:plato_id>', views.agregarCarrito, name='agregarCarrito'),
    path('mostrarCarrito', views.mostrarCarrito, name='mostrarCarrito'),
    path('<int:plato_id>/', views.eliminarCarrito, name='eliminarCarrito'),
    path('', views.limpiarCarrito, name = 'limpiarCarrito'),
    path('loginUsuario', views.loginUsuario, name='loginUsuario'),
    path('registrarCliente', views.registrarCliente, name='registrarCliente'),
    path('registrarPedido', views.registrarPedido, name='registrarPedido'),
    path('gracias', views.gracias, name='gracias'),
    path('confirmarPedido', views.confirmarPedido, name='confirmarPedido')
    
]