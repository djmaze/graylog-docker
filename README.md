# Graylog 2 on Docker

This is an opiniated setup for running Graylog using Docker Compose. Data and configuration are stored beneath the current directory.

## Getting started

### Setup and configuration

    ./setup
    cp .env.template .env

Make sure to fill in the needed variables in the `.env` file:

* `VIRTUAL_HOST`: Site hostname
* `LETSENCRYPT_EMAIL`: Your email address at Let's Encrypt. Needed for registering an SSL certificate
* `GRAYLOG_PASSWORD_SECRET`: Pepper for passwords, at least 64 characters. Generate e.g. with `pwgen -N 1 -s 96`
* `GRAYLOG_ROOT_PASSWORD_SHA2`: Initial password the `admin` user. Generate with `echo -n yourpassword | shasum -a 256`
* `MYHOSTNAME`: Hostname to use for outgoing mails


### Running

    docker-compose up -d

The Graylog web interface will be available at [http://0.0.0.0:9000](http://0.0.0.0:9000).

## Notes

### Available ports

As the graylog user inside the container does not have root privileges, inputs in Graylog have to listen on non-provileged ports. The following ports will be forwarded from the host by default:

* 514 => 20514 TCP/UDP (for Syslog input)
* 12201 => 12201 TCP/UDP (for GELF input)

### Certificates ###

If you need to support TLS on your input plugins, you need to provide the certificates beforehand. The files inside the `.certs` directory will be available at `/var/opt/graylog/data/certs` from within Graylog.
