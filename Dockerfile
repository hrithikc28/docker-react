FROM node:alpine as builder
#As AWS will fail to use a named builder as above we use below
#FROM node:alpine

WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 

RUN npm run build

#/app/build <-- all the stuff
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#In reference to above we have to use below
#COPY --from=0 /app/build /usr/share/nginx/html