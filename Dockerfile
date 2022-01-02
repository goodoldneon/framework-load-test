FROM python:3.9.9

RUN \
    apt update \
    && apt install -y vim

# Install Node
RUN \
    mkdir /usr/local/lib/node16 \
    && wget -c https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz -O - \
    | tar -xJvf - -C /usr/local/lib/node16 --strip-components 1

ENV NODEJS_HOME '/usr/local/lib/node16'
ENV PATH "$NODEJS_HOME/bin:$PATH"

WORKDIR /app

COPY package-lock.json package.json requirements.prod.txt ./

# Install deps
RUN pip install -r requirements.prod.txt && npm install --only=prod

COPY server ./server

EXPOSE 8080
