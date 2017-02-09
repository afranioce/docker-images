FROM afranioce:deployer:latest

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_SSH_PUBLIC_KEY_BASE64 ''
ENV DEPLOY_CONNECTION $DEPLOY_PUBLIC_USER@$DEPLOY_PUBLIC_HOST:$DEPLOY_PUBLIC_DIR

RUN apk add --no-cache openssh-client rsync

RUN eval $(ssh-agent -s) \
  && mkdir -p ~/.ssh \
  && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
  && echo -e "\n- .rsync-filter\n- .git/\n- .git*\n- *.old\n- *.bak\n- *.patch\n- *.diff\n- composer.*" >> .rsync-filter \
  && touch .rsync-filter && dos2unix .rsync-filter

RUN deployer-exec() { \
  ssh-add <(echo "$DEPLOY_SSH_PUBLIC_KEY_BASE64" | base64 -d) \
  && rsync -avuzpg --delete --delete-excluded --filter='dir-merge .rsync-filter' $DEPLOY_PROJECT_DIR/. $DEPLOY_CONNECTION/$DEPLOY_PROJECT_PATH \
  ; }
