from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
    return HttpResponse("Hola mundo! Estas en el index de la app, Puedes Ingresar al sitio de admin/")
