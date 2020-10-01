# Rego Cheat Sheet Examples

## Pre-requisites

1. Understanding of open policy agent
2. Basic understanding of rego and rego playground
3. Opa version : 0.13.5 (minimum)


## Steps To Install Opa

1. Download OPA

1.1. Download using OPA binary for your platform from GitHub Releases.

```
For macOS (64-bit) and Linux (64-bit) : 
  curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_darwin_amd64
  For Windows download using the link here: Link
```
1.2. Download and run OPA via docker
   
   Docker Link for OPA image: [DockerImage](https://hub.docker.com/r/openpolicyagent/opa)

2. Set permissions on the OPA executable

```
chmod 755 ./opa
```

3. Run OPA as a server

```
./opa run --server 
```
(By default OPA listens for HTTP connections on 0.0.0.0:8181)

4.Curls to Push policy files, data files, and post a request

  Push data file to the server
  ```
curl -X PUT http://localhost:8181/v1/data/{myData} --data-binary @{myData}.json
  ```
  Push rego file to the server
  ```
curl -X PUT http://localhost:8181/v1/policies/{mypolicy} --data-binary @{mypolicy}.rego
  ```

  Execute the rules

  ```
curl --location --request POST 'http://localhost:8181/v1/data/$policyPath$/{ruleName}' \
--header 'Content-Type: text/plain' \
--data-raw '{Input_Json}'

  ```
5. Run test on OPA 

   From the root directory containing rego files and data files(JSON), run  the following command:
  ```
   opa test . -v
   ```
For details refer: [OPA Documentation Testing](https://www.openpolicyagent.org/docs/latest/policy-testing/)


