# Use a more recent Python image (3.9-slim-bullseye)
FROM python:3.9-slim-bullseye

# Create a virtual environment
RUN python3 -m venv /env
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

# Copy the requirements.txt file
COPY requirements.txt /tmp/requirements.txt

# Install dependencies inside the virtual environment
RUN pip install --no-cache-dir -q -r /tmp/requirements.txt

# Add your code
COPY . /opt/webapp/
WORKDIR /opt/webapp

# Execute the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "main:app"]
