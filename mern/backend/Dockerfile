FROM node:18-alpine

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . /app

EXPOSE 5010

CMD ["node", "server.js"]
