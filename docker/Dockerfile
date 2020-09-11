FROM        python:3.6-slim-buster

VOLUME      /robot/results
VOLUME      /robot/tests
VOLUME      /robot/resources

WORKDIR /robot
COPY       . .
RUN         pip install --upgrade pip
RUN         pip install -r install.txt
