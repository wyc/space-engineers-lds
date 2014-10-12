FROM ubuntu:14.04
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-wine/ppa
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y winetricks wine1.7
ENV WINEARCH win32
RUN winetricks -q dotnet40
