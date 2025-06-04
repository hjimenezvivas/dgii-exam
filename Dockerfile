FROM python:3.12

WORKDIR /app

# Instala certificados necesarios para conexiones HTTPS
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY app/ ./app/

CMD ["python", "app/main.py"]
