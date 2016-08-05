#!/bin/sh
# Alpine doesn't have /bin/bash by default

set -e

git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

exec "$@"
