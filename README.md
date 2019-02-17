# Wordpress Docker-Compose

> A simple docker-compose Wordpress with Nginx, PHP-FPM, MariaDB, and Redis stack 

## What is Wordpress
WordPress is an online, open source website creation tool written in PHP. But in non-geek speak, it’s probably the easiest and most powerful blogging and website content management system (or CMS) in existence today.

## Explanation: docker-compose.xml

* Create persistant volume mount to match directories on host for wordpress containers
* mysql: The database files for MariaDB 
* nginx: The Nginx configuration files
* wordpress: The WordPress root folder
* logs/nginx: The Nginx log files (error.log, access.log)
* ssl: certificate folder for HTTPS configuration

## Pre-Installation
Please change "password" to something more secure in ".env"

# WORDPRESS
WORDPRESS_DB_NAME=wordpress
WORDPRESS_TABLE_PREFIX=wp_
WORDPRESS_DB_HOST=mysql
WORDPRESS_DB_USER=root
WORDPRESS_DB_PASSWORD=password

# MARIADB
MYSQL_ROOT_PASSWORD=password
MYSQL_USER=root
MYSQL_PASSWORD=password
MYSQL_DATABASE=wordpress

# REDIS SERVER
REDIS_MAXMEMORY=128m
REDIS_PASSWORD=password

## Installation

1. Clone Git with

    ```$ git clone https://github.com/sysopsguy/docker-wordpress.git```

2. Copy Nginx and Wordpress configuration files

    ```$ cd docker-wordpress```

    ```$ cp nginx.conf nginx/nginx.conf```

3. Start up docker-compose

    ```$ docker-compose up -d```

## Post-Installation
Now access your favourite web browser 

1. Go to http://localhost to set up wordpress 
2. Create admin user
3. Go to Plugins > Add New > Search Plugins
4. Type "redis object cache"
5. Click Install now and active
6. Go to plugins setting > Enable Object Cache

if you cannot find the plugins simply go to https://wordpress.org/plugins/redis-cache/ download and install it manually

## Clean Up

Stop docker-compose:

  ```$ cd docker-wordpress```

  ```$ docker-compose stop```

Remove Docker Containers:

  ```$ docker-compose rm -f```

Removing all related directories:

 ```$ rm -rf logs/ mysql/ wordpress/ nginx/ cache/```

**Optional**: Removing all Docker images:

 ```$ docker rmi $(docker images -a -q)```

## Release History

* 0.1.0
    * The first release

## Meta

Sasit Udomwattawee – sasit.u@outlook.com

Distributed under the **GNU GPLv3** license. See ``LICENSE`` for more information.

[https://github.com/sysopsguy/docker-wordpress](https://github.com/sysopsguy/docker-wordpress)

## Contributing

1. Fork it (<https://github.com/sysopsguy/docker-wordpress/fork>)
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes (`git commit -am 'Add some new-feature'`)
4. Push to the branch (`git push origin new-feature`)
5. Create a new Pull Request