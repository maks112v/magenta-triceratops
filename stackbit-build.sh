#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb58b99465ccf001b1e83cf/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb58b99465ccf001b1e83cf
curl -s -X POST https://api.stackbit.com/project/5eb58b99465ccf001b1e83cf/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb58b99465ccf001b1e83cf/webhook/build/publish > /dev/null
