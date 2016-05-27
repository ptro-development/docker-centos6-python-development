# docker-centos6-python-development
Build of docker image for a basic python development by using Ansible-2 based on CentOs6. Finall built of python docker image is friendly to Vim developers. User *developer (with password bausebuild)* is created as part of build. Also, things like
- python-pip
- python-setuptools
- python-nose
- python-mock
- nose-cov
- flake8
- Vim Pathogen
- Vim Syntastic
- etc ...

are available. Look for more details at relevant ansible module triggered from *dockerfile*.

# To build python docker image run (this will take a while so get some tee / coffee)
```
git clone git@github.com:ptro-development/docker-centos6-python-development.git
cd docker-centos6-python-developmen
docker build -t "centos6:python_developer" .
```

# After image was built you can run it
```
docker run -i -t "centos6:python_developer" /bin/bash
```
You can connect to the running docker by using ssh as this service is stared at stratup of docker container. Developer user has password *basebuild*
```
ssh developer@docker_ip_address_here
```
then if you need to become root run
```
sudo su -
```

# How to extend build ?
Apart from forking this repository and adding your extra stuff you can add additional scripts under *end_scripts* directory. These are going to be executed at the end of build process in alphabetical order inside container under root user.
