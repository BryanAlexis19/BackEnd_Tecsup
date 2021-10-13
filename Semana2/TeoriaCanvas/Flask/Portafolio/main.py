#Import the libraries from flask library
from flask import Flask, render_template, url_for

#Create the app from 
app = Flask(__name__)

#Create the main page including the route by default
@app.route('/')
def index():
    skills = [
        {"curso" : "Flask",
        "imagen" : "static/img/flask.png",
        "descripcion" : "Avanzado",
        "estrellas" : 5,
        "link" : "https://flask.palletsprojects.com/en/2.0.x/"
        },
        {"curso" : "DJANGO",
        "imagen" : "static/img/django.png",
        "descripcion" : "Intermedio",
        "estrellas" : 3,
        "link" : "https://www.djangoproject.com/"
        },
        {"curso" : "CSS",
        "imagen" : "static/img/css.png",
        "descripcion" : "Basico",
        "estrellas" : 2,
        "link" : "https://developer.mozilla.org/es/docs/Web/CSS"
        }
    ]
    #Render the app
    return render_template('index.html', skills = skills)

app.run(debug=True, port=8000)