# Payment Service

Simple Python Flask application used for the DevOps learning project.

## Endpoints

GET /health

Returns:

{
    "status": "UP"
}

GET /api/payment

Returns:

{
    "message": "Payment service is running"
}

## Port

Application runs on port 8080.

## Run locally

pip install -r requirements.txt

python app.py

## Run with Docker

docker build -t payment-service .

docker run -p 8080:8080 payment-service
