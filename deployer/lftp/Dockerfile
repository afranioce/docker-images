FROM afranioce/deployer:latest

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_USER           ''
ENV DEPLOY_PASSWORD       ''
ENV DEPLOY_HOST           ''
ENV DEPLOY_PUBLIC_DIR     ''

RUN apk update \
  && apk add --no-cache lftp

RUN echo -e "\n.git/\n.git*\n*.patch\n*.diff\ncomposer.*" >> .syncignore \
  && dos2unix .syncignore

RUN chmod +x deploy.sh
COPY deploy.sh /usr/local/bin/deploy
