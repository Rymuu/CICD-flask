#Grab a python image
FROM python:3.9-slim-bullseye

# Install python and pip using venv
RUN python3 -m venv /opt/venv
COPY requirements.txt /tmp/requirements.txt

RUN . /opt/venv/bin/activate && pip install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
copy . /opt/webapp/
WORKDIR /opt/webapp

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT app:app
