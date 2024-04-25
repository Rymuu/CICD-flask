# Utilisez une image Python plus récente (3.9-slim-bullseye)
FROM python:alpine

# Créez un environnement virtuel
RUN python3 -m venv /opt/venv

# Ajoutez votre code
COPY . /opt/webapp/
WORKDIR /opt/webapp

# Copiez le fichier requirements.txt
COPY requirements.txt /tmp/requirements.txt

# Installez les dépendances dans l'environnement virtuel
RUN . /opt/venv/bin/activate 
RUN pip install --no-cache-dir -q -r /tmp/requirements.txt

# Exécutez l'application avec gunicorn
CMD gunicorn --bind 0.0.0.0:$PORT main:app
