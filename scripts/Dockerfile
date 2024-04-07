FROM node:21-alpine as frontend-build

WORKDIR /app

RUN apk add --no-cache git \
    && apk add --no-cache curl

RUN git clone --branch dev https://github.com/SvarshikPlaton/frontend.git

WORKDIR /app/frontend

ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=$REACT_APP_API_URL

RUN npm update -g npm \
    && npm ci --no-audit --maxsockets 1 \
    && npm run build

FROM nginx:latest

COPY --from=frontend-build /app/frontend/build/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
