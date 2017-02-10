FROM afranioce/deployer

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_SSH_PUBLIC_KEY_BASE64 ''
ENV DEPLOY_CONNECTION $DEPLOY_PUBLIC_USER@$DEPLOY_PUBLIC_HOST:$DEPLOY_PUBLIC_DIR

RUN apk add --no-cache openssh-client rsync

RUN eval $(ssh-agent -s) \
  && mkdir -p ~/.ssh \
  && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
  && echo -e "\n- .rsync-filter\n- .git/\n- .git*\n- *.old\n- *.bak\n- *.patch\n- *.diff\n- composer.*" >> .rsync-filter \
  && dos2unix .rsync-filter

COPY deploy.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/deploy.sh \
  && alias dpl = 'deploy.sh'