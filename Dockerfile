FROM node:16

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm ci --silent

COPY . .

CMD npm start
