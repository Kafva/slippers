FROM python:3.8-slim-buster

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

RUN apt-get update && apt-get upgrade && apt-get install nginx php php-fpm php-mysql -y

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

#### NGINX + PHP ####

# Enable the supplied default nginx config and copy all the client resources to the served directory
RUN cp config/nginxDefault.conf /etc/nginx/sites-available/default
RUN cp -r Client07/ /var/www/slippers
RUN mv client/login.php /var/www/slippers/php
RUN mv client/index.html /var/www/slippers/
RUN mv client/favicon.png /var/www/slippers/media

EXPOSE 80
EXPOSE 843

# Wait forever (debug)
# CMD tail -f /dev/null