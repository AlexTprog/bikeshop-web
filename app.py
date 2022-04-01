import os
from flask import Flask

#Crear y configurar el app
app = Flask(__name__)

app.config.from_mapping(
    SECRET_KEY='ga',
    DATABASE= os.path.join(app.instance_path,'bikeshop.sqlite')    
)

try:
    os.makedirs(app.instance_path)
except OSError():
    pass



# una pagia simple
@app.route('/')
def index():
    return 'Hello, Wordl!'
