# Utilisez une image Python plus récente (3.9-slim-bullseye)
FROM python:3.9-slim-bullseye

# Créez un environnement virtuel
RUN python3 -m venv /opt/venv

# Ajoutez votre code
COPY . /opt/webapp/
WORKDIR /opt/webapp

# Copiez le fichier requirements.txt
# COPY requirements.txt /tmp/requirements.txt

# Installez les dépendances dans l'environnement virtuel
RUN . /opt/venv/bin/activate && pip install --no-cache-dir -q -r /opt/webapp/requirements.txt

# Exposez le port (pas nécessaire pour Heroku)
# EXPOSE 5000

# Exécutez l'application avec gunicorn
CMD /opt/venv/bin/gunicorn --bind 0.0.0.0:$PORT main.py
