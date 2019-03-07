FROM arm32v7/node:10
MAINTAINER sencom1028@gmail.com

#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

#explicit set work dir
WORKDIR /home/node/app

#copy package.json && package-lock.json
COPY package*.json ./

#switch user to node
USER root

#install udhcpd, hostapd, dnsmasq
RUN apt-get update -y && apt-get install -y hostapd dnsmasq udhcpd net-tools sudo

RUN wget http://tmrh20.github.io/RF24Installer/RPi/install.sh 
RUN chmod +x install.sh 
RUN yes Y | ./install.sh
#RUN cd rf24libs/RF24/examples_linux

RUN npm install

#ADD init.sh /home/node/app/init.sh

#RUN chmod +x /home/node/app/init.sh

#RUN /home/node/app/init.sh

#application code to the application dir on the container
#COPY --chown=node:node . .

EXPOSE 3000
#ENTRYPOINT [ "/home/node/app/init.sh" ]
CMD ["npm","start"]
