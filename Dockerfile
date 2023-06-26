FROM node:lts-alpine AS build
RUN apk update
RUN apk add git
RUN cd home && git clone https://github.com/walter-bd/king
WORKDIR /home/king
RUN npm install
RUN npm run build


FROM nginx:stable-alpine
RUN apk update
RUN apk add apache2-utils
COPY --from=build /home/king/dist/king /usr/share/nginx/html
EXPOSE 80
