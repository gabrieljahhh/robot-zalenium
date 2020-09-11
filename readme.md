# Robot framework running with Docker and Zalenium

Example of automation execution with robot framework running inside docker and zalenium container

### Installation

You must first run the Dockerfile in the docker folder:

```sh
$ docker build -t robot-run .
```
Building Selenium and Zalenium containers:
```sh
$ docker run --rm -ti -d --name zalenium -p 4444:4444 -e PULL_SELENIUM_IMAGE=true -v /var/run/docker.sock:/var/run/docker.sock -v your-path/videos:/home/seluser/videos --privileged dosel/zalenium start

```

Running the docker container with robot framework automation

```sh
$ docker run -v /your-path\demo\tests:/robot/tests -v /your-path/demo/results:/robot/results -v /your-path/demo/resources:/robot/resources robot-run robot -d ./results ./tests/TestDemo.robot
.
```

### Important

1 - You must change the paths currently for your project

2- In the resources.robot file - You must change the your ip for the project to run correctly inside Zalenium: (not working with localhost or 127.0.0.1)
```sh
Open Browser    about:blank    ${BROWSER}   remote_url=http://IP:4444/wd/hub
```
 
Thank You 
----
