from tkinter import *
from tkinter.ttk import Treeview

class Alumno:
    def agregar(self):
        self.trvAlumnos.insert('',0,text = self.nombre.get(), values = self.email.get())

    def __init__(self,window):
        self.wind = window
        self.wind.title("Alumno")
        #FRAME
        frame = LabelFrame(self.wind, text = "Registro de Nuevo Alumno")
        frame.grid(row=0, column = 0, columnspan = 3, pady = 10)
        #LabelNombre
        lbNombre = Label(frame, text = 'Nombre: ')
        lbNombre.grid(row=1, column=0)
        #Caja de texto
        self.nombre = Entry(frame)
        self.nombre.grid(row=1, column=1)
        #LabelEmail
        lblEmail = Label(frame, text="Email: ")
        lblEmail.grid(row=2,column=0)
        #Email
        self.email = Entry(frame)
        self.email.grid(row=2, column=1)

        #Boton para el nuevo alumno
        btnNuevoAlumno = Button(frame, text="Agregar", command = self.agregar)
        btnNuevoAlumno.grid(row=4, columnspan =2, sticky=W+E)

        #CREANDO TREEVIEW
        self.trvAlumnos = Treeview(height=10, column=2)
        self.trvAlumnos.grid(row=5, column=0, columnspan=2)
        self.trvAlumnos.heading("#0", text= 'Nombre', anchor=CENTER)
        self.trvAlumnos.heading("#1", text= 'Email', anchor=CENTER)

window = Tk()
app = Alumno(window)
window.mainloop()