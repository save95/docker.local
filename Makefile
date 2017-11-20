init:
	@printf "1. make init dir... \n" ;\
	  mkdir -p container/php/download ;\
	  mkdir -p /home/docker/log/nginx/log \
	           /home/docker/.conf/nginx/conf.d \
	           /home/docker/log/php/log \
	           /home/docker/.conf/percona/conf.d \
	           /home/docker/.database/percona \
	           /home/docker/webroot ;\
	  chcon -Rt svirt_sandbox_file_t /home/docker/log /home/docker/webroot \
	            /home/docker/.conf /home/docker/.database
	make pull

pull:
	docker pull twang2218/blog.lab99.org
	docker pull nginx:1.12-alpine
	docker pull php:5.6-fpm-alpine
	docker pull percona:5.6
	docker pull redis:3.2-alpine
	docker pull memcached:1.5-alpine

download:
	wget https://pecl.php.net/get/gearman-1.1.2.tgz -O container/php/download/gearman.tgz
	#wget https://pecl.php.net/get/redis-2.2.7.tgz -O container/php/download/redis.tgz
	wget https://pecl.php.net/get/redis-3.1.4.tgz -O container/php/download/redis.tgz
	wget https://pecl.php.net/get/memcached-2.2.0.tgz -O container/php/download/memcached.tgz
	wget https://pecl.php.net/get/xdebug-2.3.2.tgz -O container/php/download/xdebug.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O container/php/download/msgpack.tgz
	wget https://pecl.php.net/get/memcache-2.2.7.tgz -O container/php/download/memcache.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O container/php/download/xhprof.tgz
	#wget https://getcomposer.org/composer.phar -O container/php/download/composer.phar
	wget https://getcomposer.org/download/1.4.2/composer.phar -O container/php/download/composer.phar

learn:
	docker run -d -p 8000:80 twang2218/blog.lab99.org
	@echo 'open site http://127.0.0.1:8000'

up:
	$(shell shell/make/docker-compose.sh "$@")
#	docker-compose up

clean:
	@printf "1. clear tmp files ... \n"
	@printf "2. clear none docker images ... \n" ;\
	  for i in `docker images | grep "<none>" | awk "{print \\$$3}"` ;\
	  do \
	    docker rmi -f $$i ;\
	  done
	@printf "3. clear docker volume ... \n" ;\
	docker volume rm $(docker volume ls -qf dangling=true)
