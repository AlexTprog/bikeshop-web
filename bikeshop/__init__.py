import os
from flask import Flask

def create_app(test_confing=None):
    app = Flask(__name__,instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',        
    )

    if test_confing is None:
        app.config.from_pyfile('config.py',silent=True)
    else:
        app.config.from_mapping(test_confing)
    
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route('/')
    def home():
        return 'Todo en Orden'
    
    return app