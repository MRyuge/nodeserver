FROM oraclelinux:7-slim


# Create app directory by ryuge
WORKDIR /usr/src/app

RUN  yum -y install oracle-release-el7 oracle-nodejs-release-el7 && \
     yum-config-manager --disable ol7_developer_EPEL && \
     yum -y install oracle-instantclient19.3-basiclite nodejs && \
     rm -rf /var/cache/yum

WORKDIR /myapp

ADD package.json /myapp/
ADD server.js /myapp/
RUN npm install

CMD exec node server.js

EXPOSE 8080
CMD [ "node", "server.js" ]