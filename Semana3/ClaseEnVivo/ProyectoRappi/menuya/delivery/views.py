from django.shortcuts import redirect, render
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login,logout
# Create your views here.

def menu(request):
    lstCategorias = Categoria.objects.all()
    lstPlatos = Plato.objects.all()
    objNegocio = Negocio.objects.get(pk=1)

    request.session["negocio_telefono"] = objNegocio.telefono
    request.session["negocio_logo"] = objNegocio.imagen.url

    context = {
        'categorias' : lstCategorias,
        'platos' : lstPlatos,


    }

    return render(request, 'menu.html', context)

def menulist(request):
    lstPlatos = Plato.objects.all()

    context = {
        'platos' : lstPlatos
    }
    
    return render(request, 'menu-list.html', context)

def plato(request, plato_id):
    objPlato = Plato.objects.get(pk = plato_id)
    context = {
        'plato' : objPlato
    }

    return render(request, 'plato.html', context)


from .carrito import Cart

def agregarCarrito(request,plato_id):
    objPlato = Plato.objects.get(pk = plato_id)
    cantidad = int(request.POST['cantidad'])
    carrito = Cart(request)
    carrito.add(objPlato, cantidad)
    print(request.session.get("cart"))
    return render(request, 'carrito.html')

def mostrarCarrito(request):
        return render(request, "carrito.html")

def eliminarCarrito(request, plato_id):
    objPlato = Plato.objects.get(pk = plato_id)
    carrito = Cart(request)
    carrito.remove(objPlato)
    return render(request, 'carrito.html')

def limpiarCarrito(request):
    carrito = Cart(request)
    carrito.clear()
    return render(request, 'carrito.html')

def login(request):
    if request.method == 'POST':
        usuario = request.POST['usuario']
        clave = request.POST['clave']

        loginUsuario = authenticate(request,username=usuario, password=clave)

        if loginUsuario is not None:
            login(request,loginUsuario)
            return redirect('/delivery/registrarPedido')

    return render(request, 'login.html')



def registroCliente(request):
    if request.method == 'POST':
        #Registrar un nuevo cliente

        usuario = request.post['usuario']
        clave = request.post['password']
        nuevoUsuario = User.objects.create_user(username = usuario, password = clave)
        nuevoUsuario.first_name = request.POST['nombres']
        nuevoUsuario.last_name = request.POST['apellido']
        nuevoUsuario.email = request.POST['email']

        nuevoUsuario.save()

        nuevoCliente = Cliente(usuario = nuevoUsuario)
        nuevoCliente.telefono = request.POST['telefono']
        nuevoCliente.save()

        
        return redirect('/delivery/login')
    
    return render(request, "registroCliente.html")

def registrarPedido(request):
    usuarioPedido = User.get(pk=request.user.id)
    clientePedido = Cliente.objects.get(pk = usuarioPedido)
    print(request.user.id)
    print(request.user.username)

    if request.user.id is not None:
        usuarioPedido = User.objects.get(pk=request.user.id)
        clientePedido = Cliente.objects.get(usuario = usuarioPedido)
        lstFormaPago = FormaPago.objects.all()
        
        context = {
            'nombres' : request.user.first_name,
            'apellidos' : request.user.last_name,
            'telefono' : clientePedido.telefono,
            'email': request.user.email
        }
    else:
        return redirect('/delivery/login')

    return render(request, 'pedido.html', context)

def gracias(request):
    return render(request,'gracias.html')

def confirmarPedido(request):
    if request.method == 'POST':
        #Registro el pedido
        dataFormaPagoId = request.POST['chkFormaPago']
        dataDireccion = request.POST['direccion']
        dataFormaPago = FormaPago.objects.get(pk = dataFormaPagoId)

        nuevoPedido = Pedido(clientePedido)
        nuevoPedido.direccion = dataDireccion
        nuevoPedido.formaPago = dataFormaPago

        nuevoPedido.save()

        return redirect('/delivery/gracias')



