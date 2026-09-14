From node:24-alpine

WORKDIR /user/src/app/client
COPY /client/package.json ./
RUN npm install
COPY client/ ./
RUN npm run build

WORKDIR /user/src/app/server
COPY 
COPY server/ ./




