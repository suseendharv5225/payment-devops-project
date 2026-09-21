# Use a lightweight Python base image
FROM python:3.12-slim

# Prevent Python from creating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Ensure Python output appears immediately in container logs
ENV PYTHONUNBUFFERED=1

# Application directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Application listens on port 8080
EXPOSE 8080

# Start the application
CMD ["python", "app.py"]
