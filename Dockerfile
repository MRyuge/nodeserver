FROM oraclelinux:7-slim

ADD oracle-instantclient*.rpm /tmp/

RUN  yum -y install /tmp/oracle-instantclient*.rpm && \
     rm -rf /var/cache/yum && \
     rm -f /tmp/oracle-instantclient*.rpm && \
     echo /usr/lib/oracle/12.2/client64/lib > /etc/ld.so.conf.d/oracle-instantclient12.2.conf && \
     ldconfig

ENV PATH=$PATH:/usr/lib/oracle/12.2/client64/bin


FROM node:10

WORKDIR /myapp

ADD package.json /myapp/
ADD server.js /myapp/
RUN npm install

EXPOSE 8080
CMD [ "node", "server.js" ]