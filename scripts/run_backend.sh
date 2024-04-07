#!/bin/bash

# Run the Docker container
docker pull mnemov/provedcode-backend
docker run \
-p 8080:8080 \
-e S3_REGION=$S3_REGION \
-e BUCKET=$BUCKET \
-e S3_ACCESS_KEY=$S3_ACCESS_KEY \
-e S3_SECRET_KEY=$S3_SECRET_KEY \
-e DB_LOGIN=$DB_LOGIN \
-e DB_PASSWORD=$DB_PASSWORD \
-e DB_URL=$DB_URL \
-e SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE \
-e EMAIL_USER=$EMAIL_USER \
-e EMAIL_PASSWORD=$EMAIL_PASSWORD \
mnemov/provedcode-backend
