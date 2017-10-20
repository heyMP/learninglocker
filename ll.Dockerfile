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

# LearningLocker
WORKDIR /learninglocker
COPY ./learninglocker/package.json .
COPY ./learninglocker/yarn.lock .
RUN yarn install

COPY ./learninglocker .
RUN yarn build-all

RUN pm2 start pm2/all.json

EXPOSE 3000
EXPOSE 8080
# RUN apt-get -y install curl git python build-essential xvfb apt-transport-https