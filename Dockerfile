
FROM node:14-slim

WORKDIR /usr/src/app

RUN npm install express@4.16.1

COPY . .

ENTRYPOINT ["node"]

CMD ["index.js"]

CMD [ "node", "index.js" ]
