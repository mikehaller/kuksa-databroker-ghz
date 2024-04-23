# kuksa-databroker-ghz
Kuksa Databroker gRPC performance tests

## Native setup

- Install [ghz](https://github.com/bojand/ghz)
    ```
    wget https://github.com/bojand/ghz/releases/download/v0.117.0/ghz-linux-x86_64.tar.gz
    tar xzf ghz-linux-x86_64.tar.gz
    ```
- Clone Eclipse Kuksa Databroker
    ```
    git clone https://github.com/eclipse-kuksa/kuksa-databroker.git
    ```
- Run tests:
    ```
    ./ghz --config=testcase1_kuksa_get.json --import-paths=kuksa-databroker/proto/ localhost:55555
    ./ghz --config=testcase2_sdv_getdatapoints.json --import-paths=kuksa-databroker/proto/ localhost:55555
    ./ghz --config=testcase3_sdv_streamdatapoints.json --import-paths=kuksa-databroker/proto/ localhost:55555
    ```

## Docker Setup

```
docker network create kuksa
docker run -d --rm --name databroker --network host ghcr.io/eclipse-kuksa/kuksa-databroker:0.4 --insecure
git clone https://github.com/eclipse-kuksa/kuksa-databroker.git
docker run \
    --network kuksa \
    --volume "${PWD}/kuksa-databroker/protos:/ghz/protos" \
    --volume "${PWD}/testcase1.json:/ghz/config.json" \
    obvionaoe/ghz \
    --config=/ghz/config.json \
    databroker:55555
```