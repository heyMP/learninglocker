FROM node:6
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install curl -y
RUN apt-get install vim -y

RUN npm install -g yarn
RUN npm install -g pm2
RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:compress true

COPY . .
COPY /learninglocker/UnicodeData.txt /usr/share/unicode/UnicodeData.txt
RUN chmod 644 /usr/share/unicode/UnicodeData.txt

WORKDIR /learninglocker/
RUN yarn install

# RUN yarn build-all