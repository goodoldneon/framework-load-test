import waitress
from flask_server import app

if __name__ == "__main__":
    waitress.serve(app, host="0.0.0.0", port=8080)
