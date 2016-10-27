#!/usr/bin/env sh

echo "{" >> $CONFIG_FILE

# Check for HTTP_PORT parameter
if [ -z ${HTTP_PORT+x} ]; then
  HTTP_PORT="8080"
fi

echo " :server-port ${HTTP_PORT}" >> $CONFIG_FILE

# Check for USER/PASSWORD parameters
if [[ -n "$USER" && -n "$PASSWORD" ]]; then
  echo " :users {\"${USER}\" \"${PASSWORD}\"}" >> $CONFIG_FILE
fi

# Check for ZK_DEFAULT_NODE parameter
if [ -n "$ZK_DEFAULT_NODE" ]; then
  echo " :default-node \"${ZK_DEFAULT_NODE}\"" >> $CONFIG_FILE
fi

echo "}" >> $CONFIG_FILE

cat $CONFIG_FILE

cd $APP_PATH/zk-web && lein run
