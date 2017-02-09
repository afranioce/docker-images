FROM afranioce:deployer:latest

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_USER           ''
ENV DEPLOY_PASSWORD       ''
ENV DEPLOY_HOST           ''

RUN apk add --no-cache lftp

RUN deployer-exec() { \
  lftp -u $DEPLOY_USER,$DEPLOY_PASSWORD -e "set ssl:verify-certificate no; mirror -n -R -vvv --exclude-glob-from '.syncignore' $DEPLOY_PROJECT_DIR/. $DEPLOY_PUBLIC_DIR/$DEPLOY_PROJECT_PATH" $DEPLOY_HOST \
  ; }