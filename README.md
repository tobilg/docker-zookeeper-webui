# ZooKeeper Web UI (zk-web) as Docker image
This images contains the latest release of [zk-web][zk] on a minimal Alpine Linux base image with Java 8.

## Configuration options

The following non-mandatory options can be passed to the Docker image:

- `HTTP_PORT`: The container porton which the `zk-web` application should run. Default 8080.
- `USER`: The user name for accessing the frontend
- `PASSWORD`: The password for accessing the frontend
- `ZK_DEFAULT_NODE`: The default node address, i.e. `192.168.0.100:2181/`

## Running
The image can be run either via Mesos Marathon, or directly on the Docker host.

### Via Marathon

The following sets a `ZK_DEFAULT_NODE` and starts the `zk-web` application on a Marathon-defined port:

```
curl -XPOST 'http://192.168.0.100:8080/v2/apps' -d '{
    "id": "zookeeper-web-ui",
    "env": {
        "ZK_DEFAULT_NODE": "192.168.0.100:2181/"
    },
    "container": {
        "docker": {
            "image": "tobilg/zookeeper-webui",
            "network": "BRIDGE",
            "portMappings": [
                { "containerPort": 8080, "protocol": "tcp" }
            ]
        },
        "type": "DOCKER"
    },
    "cpus": 0.5,
    "mem": 1024,
    "instances": 1
}'
```

### Via command line
The following will expose `zk-web` on the host port `8080`:

```
docker run -d \
  -p 8080:8080 \
  -e ZK_DEFAULT_NODE=192.168.0.100:2181/ \
  --name zk-web \
  -t tobilg/zookeeper-webui
```

[zk]: <https://github.com/qiuxiafei/zk-web>