FROM afranioce/deployer

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_PK_BASE64 ''
ENV DEPLOY_CONNECTION $DEPLOY_PUBLIC_USER@$DEPLOY_PUBLIC_HOST:$DEPLOY_PUBLIC_DIR

RUN apk update \
  && apk add --no-cache openssh-client rsync

RUN mkdir -p ~/.ssh \
  && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
  && echo -e "\n- .git/\n- .git*\n- *.patch\n- *.diff\n- composer.*" >> .rsync-filter \
  && dos2unix .rsync-filter

RUN chmod +x deploy.sh
COPY deploy.sh /usr/local/bin/deploy
