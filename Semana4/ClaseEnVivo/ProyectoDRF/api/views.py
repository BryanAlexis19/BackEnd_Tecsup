from django.http import response
from django.http.response import HttpResponse, JsonResponse
from django.shortcuts import render
from django.http import HttpResponse

from .models import Alumno, Cursos

from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import AlumnoSerializer, CursoSerializer
# Create your views here.


def index(request):
    # return HttpResponse("Hola mundo")
    return JsonResponse({'mensaje': 'Hola mundo'})


@api_view(['GET'])
def alumnos(request):
    lstAlumnos = Alumno.objects.all()
    """ data = []
    for i in lstAlumnos:
        data.append({
            'nombre' : i.nombre,
        })

    return Response(data) """

    serializers = AlumnoSerializer(lstAlumnos, many=True)
    return Response(serializers.data)


@api_view(['GET','POST'])
def cursos(request):
    if request.method == "GET":
        lstCursos = Cursos.objects.all()
        srCursos = CursoSerializer(lstCursos, many = True)

        return Response(srCursos.data)
    elif request.method == "POST":
        #serCursos = CursoSerializer(data=request.data)
        print(request.data)
        serCursos = CursoSerializer(data=request.data)
        if serCursos.is_valid():
            serCursos.save()
            return(Response(serCursos.data, status=201))
        else:
            return(Response(serCursos.errors, status=400))

@api_view(['GET', 'PUT', 'DELETE'])
def cursoDetalle(request, curso_id):
    objCurso = Cursos.objects.get(id=curso_id)
    if request.method == 'GET':
        serCursos = CursoSerializer(objCurso)
        return Response(serCursos.data)
    elif request.method == "PUT":
        serCursos = CursoSerializer(objCurso, data=request.data)
        if serCursos.is_valid():
            serCursos.save()
            return Response(serCursos.data)
        else:
            return Response(serCursos.errors, status=400)
    elif request.method == "DELETE":
        objCurso.delete()
        return Response(status=204)

