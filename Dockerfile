
FROM nginx:1.21-alpine

LABEL maintainer="Egnatiadis-DevSecOps"
LABEL version="1.0"

WORKDIR /usr/share/nginx/html

RUN echo "<h1>Egnatiadis Security Project</h1><p>Vulnerability scan test</p>" > index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
