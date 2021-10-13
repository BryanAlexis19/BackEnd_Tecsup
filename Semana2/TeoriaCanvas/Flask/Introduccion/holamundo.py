from flask import Flask

app = Flask(__name__)

app.route('/')
def index():
    return "Hola mundo en desde Flask  - Python"

app.run(debug=True, port = 8000)
