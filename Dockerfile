FROM node:12.9.1-buster-slim

WORKDIR /myapp

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get install -y alien libaio1
RUN wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basiclite-19.3.0.0.0-1.x86_64.rpm
RUN alien -i --scripts oracle-instantclient*.rpm
RUN rm -f oracle-instantclient19.3*.rpm && apt-get -y autoremove && apt-get -y clean
ADD package.json /myapp/
ADD server.js /myapp/
RUN npm install

CMD exec node server.js

EXPOSE 8080
CMD [ "node", "server.js" ]