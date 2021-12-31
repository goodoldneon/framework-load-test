# Python Server Load Test

Simple (and probably reductive) repo for load testing Python server frameworks.

## Installation

Run `docker build . -t load-test-server` to build the Python server Docker image.

## Testing

1. Start the server you want to load test.
   - Flask: `docker run -i -p=0.0.0.0:8080:8080 --cpus=1 load-test-server python flask_server.py`
   - Tornado: `docker run -i -p=0.0.0.0:8080:8080 --cpus=1 load-test-server python tornado_server.py`
1. Run `load-tester/main.ts` in a `loadimpact/k6` Docker container. Some example usage:

```sh
# 1000 requests
docker run -i loadimpact/k6 run - <load-tester/main.ts -i 1000

# 1000 requests split between 2 users
docker run -i loadimpact/k6 run - <load-tester/main.ts -i 1000 -u 2

# View K6 help
docker run -i loadimpact/k6 run -h
```
