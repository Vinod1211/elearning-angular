FROM node:18-alpine3.18 as angular
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=angular /usr/src/app/dist/my-shopping-app /usr/share/nginx/html