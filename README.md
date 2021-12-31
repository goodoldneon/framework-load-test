## Installation

1. Run `pipenv install -d`
1. Run `npm install`

## Testing

1. Start the server you want to load test.
   - Flask: `pipenv run python server/flask_server.py`
   - Tornado: `pipenv run python server/tornado_server.py`
1. Run `load-tester/main.ts` in a `loadimpact/k6` Docker container. Some example usage:

```sh
# 1000 requests
docker run -i loadimpact/k6 run - <load-tester/main.ts -i 1000

# 1000 requests split between 2 users
docker run -i loadimpact/k6 run - <load-tester/main.ts -i 1000 -u 2

# View K6 help
docker run -i loadimpact/k6 run -h
```
