FROM node:22-alpine

RUN apk update && apk add --no-cache \
  build-base gcc autoconf automake \
  zlib-dev libpng-dev vips-dev git bash

WORKDIR /opt/app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "develop"]
