# kuksa-databroker-ghz
Kuksa Databroker gRPC performance tests

## Native setup

- Install [ghz](https://github.com/bojand/ghz)
- Clone Eclipse Kuksa Databroker
    ```
    git clone https://github.com/eclipse-kuksa/kuksa-databroker.git
    ```
- Run tests:
    ```
    ghz --config=testcase1.json
    ```

## Docker Setup

```
docker network create kuksa
docker run -d --rm --name databroker --network kuksa ghcr.io/eclipse-kuksa/kuksa-databroker:0.4 --insecure
git clone https://github.com/eclipse-kuksa/kuksa-databroker.git
docker run \
    --network kuksa \
    --volume "${PWD}/kuksa-databroker/protos:/ghz/protos" \
    --volume "${PWD}/testcase1.json:/ghz/config.json" \
    obvionaoe/ghz \
    --config=/ghz/config.json \
    databroker:55555
```