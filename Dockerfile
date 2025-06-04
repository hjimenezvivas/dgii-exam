FROM python:3.10-slim

WORKDIR /app

# Instala certificados necesarios para conexiones HTTPS
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip --trusted-host pypi.org --trusted-host files.pythonhosted.org \
    && pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

COPY app/ ./app/

EXPOSE 5000

CMD ["python", "app/main.py"]
