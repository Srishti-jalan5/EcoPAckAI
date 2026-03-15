from flask import Flask
from flask_cors import CORS
from routes.api import api_bp
from models.database import init_db

def create_app():
    app = Flask(__name__)
    CORS(app)

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://username:password@localhost:5432/ecopackai'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    init_db(app)

    app.register_blueprint(api_bp)

    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)