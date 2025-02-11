FROM node:lts-alpine
WORKDIR "/app"
COPY ./package.json ./
RUN npm install -g npm@11.1.0
COPY . .
CMD ["npm", "run", "start"]