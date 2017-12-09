FROM node:carbon

WORKDIR /usr/src/app

COPY index.html ./
COPY server.js ./
COPY package.json ./

RUN npm install

EXPOSE 8080

CMD [ "npm", "start" ]
