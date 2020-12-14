FROM python:3.8-slim-buster
ARG nitrome
# To build with additional Nitrome server-block build with
#   docker build . --rm --tag=slippers --build-arg nitrome=1

# To debug the image use
#   docker run -it --entrypoint=/bin/bash slippers
# To debug a container commit it and debug the new image
#   docker commit $CONTAINER_ID slippers_debug

### -----------------------------
### Make sure that the Client07/ directory and client/favicon.png exist ###
### -----------------------------

# Set the working directory inside the container
WORKDIR /home/slippers

# Copy over all files from the current directory to the
# docker image excluding those listed in the .dockerignore
COPY . .

##### PYTHON #####
ENV VIRTUAL_ENV=/home/slippers/venv
RUN python3 -m venv $VIRTUAL_ENV

# Update the PATH to effectivly `activate` the virtual enviroment by placing the python binary first 
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# `mysql-client`, `vim`, `curl` and `net-tools` are only installed for debug purposes
RUN apt-get update -y && apt-get upgrade -y && apt-get install vim curl default-mysql-client net-tools nginx php php-fpm php-mysql -y

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

#### (slippers) NGINX + PHP ####
# Enable the supplied default nginx config and copy all the client resources to the served directory
RUN cp config/clubpenguin.conf /etc/nginx/sites-available/clubpenguin.com
RUN ln -s /etc/nginx/sites-available/clubpenguin.com /etc/nginx/sites-enabled/clubpenguin.com

# Client files
RUN cp -r Client07/ /var/www/slippers

RUN mv client/login.php /var/www/slippers/php
RUN mv client/index.html /var/www/slippers/
RUN [ -f client/favicon.png ] && mv client/favicon.png /var/www/slippers/media

#### Nitrome ####
RUN if [ "$nitrome" = 1 ]; then ./Nitrome/setup.bash ; fi

EXPOSE 80
EXPOSE 843

# Wait forever (debug)
#CMD tail -f /dev/null