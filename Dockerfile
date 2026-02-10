FROM python:3.11-slim

# Install ffmpeg (required by pydub)
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Create directories for audio and data volumes
RUN mkdir -p /opt/audio /opt/data

EXPOSE 5000

CMD ["python", "app.py"]
