# Server Load Test

Simple (and probably reductive) repo for load testing HTTP server frameworks.

## Installation

Run `docker build . -t server-load-test` to build the server Docker image.

## Usage

1. Start the server you want to load test:

   ```bash
   # Express
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test node server/express_server.js

   # Flask
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test python server/flask_server.py

   # Flask with Waitress
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test python server/flask_waitress_server.py

   # Gin
   $ docker run -i -p=0.0.0.0:8080:8080 --cpus=1 server-load-test server/gin_server

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

## Results

The following table shows requests/second for 10k requests. The tests were run on a 2.6 Ghz i7 MacBook Pro.

| Framework         | 1 User | 5 Users | 10 Users |
| ----------------- | ------ | ------- | -------- |
| Express           | 620    | 1970    | 2520     |
| Flask             | 270    | Failed  | Failed   |
| Flask w/ Waitress | 500    | 1070    | 1090     |
| Gin               | 590    | 1620    | 2230     |
| Tornado           | 560    | 1570    | 1790     |
