#!/bin/bash

# Clone frontend repository from GitHub
apt-get install git
git clone --branch dev --depth 1 https://github.com/SvarshikPlaton/frontend.git
cd frontend

# Get the API_URL argument
API_URL=http://${BACKEND_IP}:8080/api/
echo "API_URL: $API_URL"

# Build the Docker image
docker build -t provedcode-frontend --build-arg REACT_APP_API_URL=$API_URL --network=host .

# Run the Docker container
docker run -p 80:80 -d provedcode-frontend