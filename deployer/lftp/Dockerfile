FROM afranioce/deployer:latest

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_USER           ''
ENV DEPLOY_PASSWORD       ''
ENV DEPLOY_HOST           ''
ENV DEPLOY_PUBLIC_DIR     ''

RUN apk add --no-cache lftp

RUN echo -e "\n.syncignore\n.git/\n.git*\n*.old\n*.bak\n*.patch\n*.diff\ncomposer.*" >> .syncignore \
  && dos2unix .syncignore

COPY lftp-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/lftp-entrypoint.sh / # backwards compat

ENTRYPOINT ["lftp-entrypoint.sh"]