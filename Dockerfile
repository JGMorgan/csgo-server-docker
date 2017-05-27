FROM ubuntu

MAINTAINER "Jose Morgan"

RUN apt-get update && apt-get install -y \
    lib32gcc1 \
    curl \
    && mkdir ~/Steam \
    && cd ~/Steam \
    && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

RUN cd ~/Steam \
    && ./steamcmd.sh +login anonymous +force_install_dir ./cs_go +app_update 740 validate +quit

COPY server.cfg /root/Steam/cs_go/csgo/cfg

EXPOSE 27015 27020 27005 51840

ENTRYPOINT ["/root/Steam/cs_go/srcds_run"]

CMD ["-game", "csgo", "-console", "-usercon", "+game_type", "0", "+game_mode", "0", "+mapgroup", "mg_active", "+map", "de_dust2"]
