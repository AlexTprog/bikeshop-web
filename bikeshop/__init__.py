import os
from flask import Flask

#Crear y configurar el app
app = Flask(__name__,instance_relative_config=True)

app.config.from_mapping(
    SECRET_KEY='dev',
    DATABASE= os.path.join(app.instance_path,'bikeshop.sqlite')    
)

try:
    os.makedirs(app.instance_path)
except OSError():
    pass

from . import db
db.init_app(app)

# una pagina simple
@app.route('/')
def index():
    return 'Hello, Wordl!'
