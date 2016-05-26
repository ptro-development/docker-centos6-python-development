# docker-centos6-python-development
Build of docker image for a basic python development by using Ansible-2 based on CentOs6. Finall built of python docker image is friendly to Vim developers. User *developer* is created as part of build. Also, things like
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
