FROM ubuntu:14.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-wine/ppa
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y winetricks wine1.7
ENV WINEARCH win32
RUN winetricks -q dotnet40

RUN apt-get install -y unzip
ADD DedicatedServer.zip /.wine/drive_c/users/root/DedicatedServer.zip
RUN unzip /.wine/drive_c/users/root/DedicatedServer.zip -d /.wine/drive_c/users/root/
RUN mkdir -p /.wine/drive_c/users/root/Application Data/SpaceEngineersDedicated/
ADD SpaceEngineers-Dedicated.cfg /.wine/drive_c/users/root/Application Data/SpaceEngineersDedicated/SpaceEngineers-Dedicated.cfg
CMD wine /.wine/drive_c/users/root/DedicatedServer/SpaceEngineersDedicated.exe -console
