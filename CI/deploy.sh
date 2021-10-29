#!/bin/bash

set -e


SITE_NAME="$1"
DEPLOY_ENV="$2"

if [[ -z ${SITE_NAME} ]] || [[ -z ${DEPLOY_ENV} ]]; then
    echo "usage: deploy.sh SITE_NAME <staging|production>" >&2
    exit 1
fi
if [[ -z ${CI_COMMIT_SHA} ]]; then
    echo "missing CI_COMMIT_SHA, run this from gitlab CI only"
    exit 1
fi

set -x

BUILDS_DIR="/home/hexme/${DEPLOY_ENV}/builds/${SITE_NAME}"
BUILD_DIR="${BUILDS_DIR}/${CI_COMMIT_SHA}" # on remote machine
PUB_SYMLINK_DIR="/home/hexme/${DEPLOY_ENV}" # on remote machine, shall point to current BUILD_DIR
PUB_SYMLINK="${PUB_SYMLINK_DIR}/${SITE_NAME}"
PUB_SYMLINK_NEW="${PUB_SYMLINK}-new"

ssh $SSH_REMOTE "mkdir -p \"${PUB_SYMLINK_DIR}\""
ssh $SSH_REMOTE "mkdir -p \"${BUILDS_DIR}\""

rsync -a --recursive --delete --stats --progress  figs report meshes meta index.html hexme.zip "$SSH_REMOTE:$BUILD_DIR"

# atomic update, cf https://austinjadams.com/blog/using-git-to-deploy-a-hugo-blog-atomically/
ssh $SSH_REMOTE /bin/bash << EOF
    set -e
    set -x
    ln -s --no-dereference --relative --force "$BUILD_DIR" "$PUB_SYMLINK_NEW"
    OLD_DEST=\$(readlink -e "$PUB_SYMLINK" || true)
    mv --no-target-directory -v "$PUB_SYMLINK_NEW" "$PUB_SYMLINK"
    if [[ ! -z "\${OLD_DEST}"  && "\${OLD_DEST}" != \$(readlink -e "$PUB_SYMLINK") ]]; then
        rm -rf "\${OLD_DEST}"
    fi
EOF
