# Utilisez une image Python plus récente (3.9-slim-bullseye)
FROM python:3.9-slim-bullseye

# Créez un environnement virtuel
RUN python3 -m venv env
ENV VIRTUAL_ENV /env                    
ENV PATH /env/bin:$PATH 

# Copiez le fichier requirements.txt
COPY requirements.txt /tmp/requirements.txt

# Installez les dépendances dans l'environnement virtuel
RUN pip install --no-cache-dir -q -r /tmp/requirements.txt

# Ajoutez votre code
COPY . /opt/webapp/
WORKDIR /opt/webapp

# Exposez le port (pas nécessaire pour Heroku)
# EXPOSE 5000

# Exécutez l'application avec gunicorn
CMD gunicorn --bind 0.0.0.0:$PORT main:app
