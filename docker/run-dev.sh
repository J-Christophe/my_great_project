#!/bin/sh
set search
set ps

search=`docker images | grep dev/my_great_project | wc -l`
if [ $search = 0 ];
then
	# only the heaader - no image found
	echo "Please build the image by running 'make docker-container-dev'"
	exit 1
fi

ps=`docker ps -a | grep develop-my_great_project | wc -l`
if [ $ps = 0 ];
then
	echo "no container available, start one"
	docker run --name=develop-my_great_project \
		-v /dev:/dev \
		-v `echo ~`:/home/${USER} \
		-v `pwd`/data:/srv/my_great_project/data \
		-p 8082:8082 \
		-it dev/my_great_project /bin/bash
	exit $?
fi

ps=`docker ps | grep develop-my_great_project | wc -l`
if [ $ps = 0 ];
then
	echo "container available but not started, start and go inside"
	docker start develop-my_great_project
	docker exec -it develop-my_great_project /bin/bash
else
	echo "container started, go inside"
	docker exec -it develop-my_great_project /bin/bash
fi
