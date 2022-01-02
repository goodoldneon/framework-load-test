# Server Load Test

Simple (and probably reductive) repo for load testing HTTP server frameworks.

## Installation

Run `docker build . -t server-load-test` to build the server Docker image.

## Testing

1. Start the server you want to load test.

   ```bash
   # Express
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test node server/express_server.js

   # Flask
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test python server/flask_server.py

   # Flask with Waitress
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test python server/flask_waitress_server.py

   # Tornado
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test python tornado_server.py
   ```

1. Run `load-tester/main.ts` in a `loadimpact/k6` Docker container. Some example usage:

```sh
# 1000 requests
docker run -i loadimpact/k6 run - <load-tester/main.ts -i 1000

# 1000 requests split between 2 users
docker run -i loadimpact/k6 run - <load-tester/main.ts -i 1000 -u 2

# View K6 help
docker run -i loadimpact/k6 run -h
```
