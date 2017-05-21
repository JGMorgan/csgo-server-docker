FROM ubuntu
MAINTAINER "Jose Morgan"

RUN apt-get update && apt-get install -y \
    lib32gcc1 \
    curl
    && mkdir ~/Steam \
    && cd ~/Steam \
    && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_osx.tar.gz" | tar zxvf -

RUN cd ~/Steam \
    && ./steamcmd.sh +login anonymous +force_install_dir ./cs_go +app_update 740 validate +quit

COPY server.cfg /root/Steam/cs_go/csgo/cfg

EXPOSE 27015 27020 27005 51840
