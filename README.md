# Laravel-Docker-App
## Laravel, PHP7.3, Nginx, MySQL 5.7, Redis Docker Container
A complete Laravel, PHP Development environment that is very similar to production environment.

Docker Compose based **Laravel development environment** with individual **App** _(Laravel app)_, **Nginx**, **Database** _(MySQL)_, **Queue**, **Scheduler**, **Redis**  services.

### Installation
Clone the repo at your development machine. Go to your *Laravel Docker* directory. Then Run this
```
sh install
```
A bash script will download latest Laravel zip and then unzip the Laravel project into the `app` directory.

### Docker Container management

#### Build
Run this to build your docker containers for each services (*app, database, queue, scheduler, redis*).
  ```
  docker-compose build
  ```

#### Run the containers
  ```
  docker-compose up
  ```
  To run the services at background
  ```
  docker-compose up
  ```
#### SSH into your app console
To **install Laravel**, _generate app key_ and _run migrations_, you need to ssh to your app container service. To ssh to your app container, run this.
```
docker-compose exec app sh
```
This will take you to `/var/www/app` path inside your `app` service container. Now you can run your `composer install` and other Laravel or PHP specific commands there.


#### Stop running containers
```
docker-compose stop
```

#### Browse your site locally
You can find your site running at http://localhost

### Environment Variables
#### PHP
If you want to change, enable/disable any PHP settings, you can change them in `./docker/config/php/php-ini-development.ini` file and then `build` and `up` the container again.
#### MySQL
MySQL username, password can be changed from `docker-compose.yml` file. Fin the `environment` section under `mysql`. Change the value and build the mysql image again with `docker-compose build mysql`.
```
  environment:
    MYSQL_DATABASE: app
    MYSQL_ROOT_PASSWORD: root
    MYSQL_USER: admin
    MYSQL_PASSWORD: secret
```
After you change the value and build, you need to restart the mysql service `docker-compose up mysql` to make it affective. 
#### Nginx
If you want to change Nginx web host configurations, you can find the file at `./docker/images/web/sites/default.dev.conf`
## Storage and Logs
This Laravel-docker-app leverage the power of `docker volume` and store some the docker container data at your host machine. Here is the details of folder structure and what data it contain:
- `./docker/data/mysql` contain mysql database files
- `./docker/data/redis` contain redis database file
- `./docker/data/web` contain nginx webserver logs
## Why of Laravel-docker-app
At the moment, there are many other Laravel Docker github repo or packages available, so why this new package again? Here I'll list few of my points:
1. This docker app images is based on `alpine` based PHP image, which makes it very light weight.
2. This is built on service based architecture. Usually for Laravel application, there should be `Queue` and `cron` running on behind. In this system, you can run `Queue`, `Scheduler` container separately and Queue will listen to a separate `Redis` database. 
3. It's the most compatible with production environment. Very easily this can be converted to a production grade, scalable service.
## TODO
Future development plan:
- [ ] Docker Swarm for testing and production environment
- [ ] Kubernetes scripts for testing and production environment

## Contribution
If you find any security hole or improvement opportunity, feel free to fork and PR your updates. I'll be happy to merge any reasonable PR.

### Contact
Email: `arifulhb@gmail.com`

### Disclaimer
This docker environment is for development only and NOT optimized for production.
