FROM node:22-alpine
WORKDIR /
COPY package*.json ./
RUN npm install

COPY . .
ARG PORT

RUN npm run build
RUN npm prune --omit=dev
EXPOSE 5000
CMD ["node", "dist/index.js"]