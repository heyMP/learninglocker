FROM node:6

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install python
RUN apt-get -y install build-essential
RUN apt-get -y install xvfb
RUN apt-get -y install apt-transport-https

RUN npm install -g yarn
RUN npm install -g pm2

RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:compress true

# XAPI-service
WORKDIR /xapi-service
COPY ./xapi-service/package-lock.json .
COPY ./xapi-service/package.json .
RUN npm install

COPY ./xapi-service .
RUN npm run build

CMD [ "pm2", "start", "/xapi-service/pm2/xapi.json" ]

EXPOSE 3000
EXPOSE 8080
# RUN apt-get -y install curl git python build-essential xvfb apt-transport-https