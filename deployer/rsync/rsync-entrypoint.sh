#!/bin/bash
set -e

if [ "$1" == 'deployer' ]; then
    ssh-add <(echo "$DEPLOY_SSH_PUBLIC_KEY_BASE64" | base64 -d);
    rsync -avuzpg --delete --delete-excluded --filter='dir-merge .rsync-filter' $DEPLOY_PROJECT_DIR/. $DEPLOY_CONNECTION/$DEPLOY_PROJECT_PATH;
fi

exec "$@"
