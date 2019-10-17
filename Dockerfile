FROM oraclelinux:7-slim

#ADD oracle-instantclient*.rpm /tmp/

RUN yum update -y && \
  yum install -y oracle-release-el7 && \
  yum install -y oracle-nodejs-release-el7 && \
  yum install -y --disablerepo=ol7_developer_EPEL nodejs && \
  yum install -y oracle-instantclient19.3-basic.x86_64 && \
  yum clean all && \
  node --version && \
  npm --version && \
  npm install oracledb && \
  echo Installed


FROM node:10

#WORKDIR /myapp

ADD package.json 
ADD server.js 
RUN npm install

EXPOSE 8080
CMD [ "node", "server.js" ]
