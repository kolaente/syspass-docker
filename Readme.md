# Syspass Docker Image

Made with Alpine, NGINX and PHP 7.

This is an unofficial Dockerimage for the [http://www.syspass.org/](Syspass Dockerimage).

## Usage

Simply run 

```bash
docker run -p 80:80 -d kolaente/syspass
```

The Container needs another DB-Container which holds the database. You can use [https://hub.docker.com/_/mariadb/](MariaDB)/[https://hub.docker.com/_/mysql/](Mysql).

## Volumes

The container has three volumes:
* `/var/www/config`. Holds the configuration files.
* `/var/www/backup`. Holds automatically generated backups made by Syspass.
* `/var/session`. Holds PHP session data. Very useful when using a loadbalancer with mutliple instances of Syspass.

## Docker-Compose

Probably the easiest way to run the image is by using [https://docs.docker.com/compose/](docker-compose):

**Note:** You really should change `MYSQL_ROOT_PASSWORD` and `MYSQL_PASSWORD` when running in production!

```yaml
version: '2'
services:
  app:
    image: kolaente/syspass
    restart: always
    ports:
      - "8081:80"
    depends_on:
      - db
    volumes:
      - ./config:/var/www/config
      - ./backup:/var/www/backup
  db:
    restart: always
    image: mariadb
    environment:
      - MYSQL_ROOT_PASSWORD=changeme #CHANGE THIS!
      - MYSQL_USER=syspass
      - MYSQL_PASSWORD=changeme #CHANGE THIS!
      - MYSQL_DATABASE=syspass
    volumes:
      - ./db/:/var/lib/mysql
```

## Contributing

If you run into any issues with the image or discover a bug, feel free to [https://github.com/kolaente/syspass-docker/issues/new](create a new issue) on Github.

Or, if you have any improvements to the image, fork and create a pull request.

General help and feedback is below in the comments.
