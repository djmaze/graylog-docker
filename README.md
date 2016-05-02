# Graylog 2 on Docker

This is an opiniated setup for running Graylog using Docker Compose. Data and configuration are stored beneath the current directory.

## Getting started

### Setup and configuration

    ./setup
    cp .graylog.env.example .graylog.env

Make sure to fill in the password variables in `.graylog.env`.

### Running

    docker-compose up -d

The Graylog web interface will be available at [http://0.0.0.0:9000](http://0.0.0.0:9000).
