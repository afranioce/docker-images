FROM afranioce/deployer

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_SSH_PUBLIC_KEY_BASE64 ''
ENV DEPLOY_CONNECTION $DEPLOY_PUBLIC_USER@$DEPLOY_PUBLIC_HOST:$DEPLOY_PUBLIC_DIR

RUN apk add --no-cache openssh-client rsync

VOLUME ~/.ssh

RUN eval $(ssh-agent -s) \
  && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
  && echo -e "\n- .rsync-filter\n- .git/\n- .git*\n- *.old\n- *.bak\n- *.patch\n- *.diff\n- composer.*" >> .rsync-filter \
  && dos2unix .rsync-filter

COPY rsync-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["rsync-entrypoint.sh"]
