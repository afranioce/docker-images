FROM afranioce/deployer

MAINTAINER Afranio Martins <afranioce@gmail.com>

ENV DEPLOY_USER           ''
ENV DEPLOY_PASSWORD       ''
ENV DEPLOY_HOST           ''
ENV DEPLOY_PUBLIC_DIR     ''

RUN apk add --no-cache lftp

RUN echo -e "\n.syncignore\n.git/\n.git*\n*.old\n*.bak\n*.patch\n*.diff\ncomposer.*" >> .syncignore \
  && dos2unix .syncignore

COPY lftp-entrypoint.sh /

ENTRYPOINT ["lftp-entrypoint.sh"]