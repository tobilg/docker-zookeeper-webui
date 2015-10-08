#!/usr/bin/env sh

set -ex

apk upgrade
apk update
apk add wget git bash openssl

# Create app folder for zk-web
mkdir -p $APP_PATH

# Install Leiningen
cd /usr/local/bin && \
  wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
  chmod +x /usr/local/bin/lein

# Install zk-web
cd $APP_PATH && \
  git clone git://github.com/qiuxiafei/zk-web.git

# Install dependencies
cd $APP_PATH/zk-web && \
  lein deps
  
# Delete config file
rm $CONFIG_FILE
  
apk del wget git