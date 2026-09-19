From node:24-alpine

WORKDIR /user/src/app/client
COPY /client/package.json ./
RUN npm install
COPY client/ ./
RUN npm run build

WORKDIR /user/src/app/server
COPY /server/package*.json ./
RUN npm install --omit=dev
COPY server/ ./

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /usr/src/app

USER appuser

Expose 9000
CMD ["npm", "start"]




