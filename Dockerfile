FROM jupyter/tensorflow-notebook
# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first

USER root

RUN apt-get update -y
RUN apt-get upgrade -y

## install dependencies
RUN sudo apt-get install -y gcc build-essential mono-mcs && \
    sudo apt-get install -y g++ && \
    sudo apt-get install -y python-dev python3-dev python3-pip python3-virtualenv && \
    sudo apt-get clean

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

## set working directory
WORKDIR /home/jovyan

## add and install requirements
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt