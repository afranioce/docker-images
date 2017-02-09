#!/bin/bash
set -e

if [ "$1" = 'deployer' ]; then
  lftp -u $DEPLOY_USER,$DEPLOY_PASSWORD -e "set ssl:verify-certificate no; mirror -n -R -vvv --exclude-glob-from '.syncignore' $DEPLOY_PROJECT_DIR/. $DEPLOY_PUBLIC_DIR/$DEPLOY_PROJECT_PATH" $DEPLOY_HOST;
fi
