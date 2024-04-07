#!/bin/bash

# Get the API_URL argument
API_URL=http://${BACKEND_IP}:8080/api/

# Echo
echo "API_URL: $API_URL"

# Build the Docker image
docker build -t provedcode-frontend --build-arg REACT_APP_API_URL=$API_URL -f /home/provedcode/Dockerfile --network=host .

# Run the Docker container
docker run -p 80:80 -d provedcode-frontend