#!/bin/bash
set -e

if [ "$1" == 'exec' ]; then
    eval $(ssh-agent -s);
    ssh-add <(echo "$DEPLOY_PK_BASE64" | base64 -d);
    rsync -avuzpg --delete --delete-excluded --filter='dir-merge .rsync-filter' $DEPLOY_PROJECT_DIR/. $DEPLOY_CONNECTION/$DEPLOY_PROJECT_PATH;
fi

exec "$@"
