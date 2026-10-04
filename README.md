# Docker Frontend + Backend Assignment

A simple two-container Docker Compose application.

## Architecture

Browser
  |
  | http://localhost:8080
  v
Frontend / Nginx container :80
  |
  | /api/ -> http://backend:5000
  v
Docker network: app-network
  |
  v
Backend / Flask container :5000

## Project structure

Docker_Frontend_Backend_Assignment_Project/
├── docker-compose.yml
├── frontend/
│   ├── Dockerfile
│   ├── nginx.conf
│   └── index.html
├── backend/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── screenshots/
└── README.md

## Prerequisites

- Docker Desktop / Docker Engine
- Docker Compose v2
- Port 8080 available

Check:

docker --version
docker compose version

## Deploy

From the project root:

docker compose config

docker compose up -d --build

docker compose ps

## Access

Open:

http://localhost:8080

Click:

Test Backend Connection

Expected response:

{
  "message": "Hello from the Backend container!",
  "service": "Flask API",
  "status": "success"
}

## Verify communication

curl http://localhost:8080/api/message

curl http://localhost:8080/health

## Verify network

docker network ls

docker compose exec frontend getent hosts backend

docker compose exec frontend nginx -t

## Logs

docker compose logs --tail=100

## Stop

docker compose down

## If port 8080 is already in use

Windows CMD:

netstat -ano | findstr :8080

If another application is using the port, you can change:

ports:
  - "8080:80"

to:

ports:
  - "8081:80"

Then access:

http://localhost:8081

## Screenshot checklist

1. Docker version
2. New project folder
3. Project structure
4. backend/app.py
5. backend/requirements.txt
6. backend/Dockerfile
7. frontend/index.html
8. frontend/nginx.conf
9. frontend/Dockerfile
10. docker-compose.yml
11. Complete project structure
12. docker compose config
13. docker compose up -d --build
14. docker compose ps
15. Frontend browser
16. Successful frontend/backend response
17. curl API response
18. health response
19. Docker network
20. backend DNS resolution
21. nginx -t
22. Docker logs
23. docker compose down (optional)
"# DOCKER-FRONTEND-BACKEND-DEPLOYMENT-" 
