FROM alpine:latest

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_PUBLIC_KEY_BASE64 ''
ENV DEPLOY_CONNECTION ''
ENV DEPLOY_PROJECT_PATH ''

RUN apk update \
  && apk add --no-cache git openssh-client rsync bash

RUN eval $(ssh-agent -s) \
  && mkdir -p ~/.ssh \
  && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
  && echo -e "\n- .rsync-filter\n- .git/\n- .git*\n- *.old\n- *.bak\n- *.patch\n- *.diff\n- composer.*" >> .rsync-filter \
  && touch .rsync-filter && dos2unix .rsync-filter

RUN deployer-exec() { ssh-add <(echo "$DEPLOY_PUBLIC_KEY_BASE64" | base64 -d) \
  && rsync -avuzpg --delete --delete-excluded --filter='dir-merge .rsync-filter' ./ $DEPLOY_CONNECTION/$DEPLOY_PROJECT_PATH; }
