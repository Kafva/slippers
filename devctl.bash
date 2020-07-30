#!/bin/bash
# Docker ports [localhost:container]
# Don't forget to update /var/www/slippers and firewall rules (if applicable)

LOCALHOST_PORT=80
CONTAINER_PORT=80
TAG=slippers
REMOTE_HOST=debmon

if [ "$1" = build ]; then
    docker stop $(docker ps -q) 2> /dev/null
    docker container prune -f && 
    docker build --rm -t $TAG .
    #docker run -p $LOCALHOST_PORT:$CONTAINER_PORT -d $TAG

elif [ "$1" = upload ]; then
    # RELOAD: sudo service nginx reload && sudo service php7.3-fpm reload && sudo service php7.3-fpm restart && sudo service nginx restart && sudo service mysql restart
    rsync --delete --exclude='.git' --exclude='venv'  --exclude='2005/games' --exclude='2005/music' --exclude='2005/artwork' --exclude='2007/games' --exclude='2007/media' -r . $REMOTE_HOST:/home/jonas/$TAG

elif [ "$1" = restart ]; then
   
   sudo service nginx reload && sudo service php7.3-fpm reload

   [ -d /run/php ] || sudo mkdir /run/php

   sudo service php7.3-fpm restart && sudo service nginx restart && 
   sudo service mysql restart

   # Port forwarding
   # sudo socat -v tcp-l:843,fork,reuseaddr tcp:192.168.0.103:6114 
   
   # Allow all bindings to lower ports for python
   # sudo setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/python3.7

   # FLASM
   # flasm -a chat506.flm  && sudo cp chat506.swf /var/www/slippers
fi

