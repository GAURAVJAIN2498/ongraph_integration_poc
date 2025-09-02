    docker exec -it php-app bash
            
               apt-get update -y &&
               apt-get install -y default-mysql-client &&
               docker-php-ext-install mysqli pdo pdo_mysql &&
               docker-php-ext-enable mysqli pdo_mysql
     docker restart php-app
