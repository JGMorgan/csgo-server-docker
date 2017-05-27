# CSGO dedicated server on Docker

To build the image, run
```
docker build -t csgo_server github.com/JGMorgan/csgo-server-docker
```

To start up a LAN only classic casual server container, run
```
docker run -d -p 27015:27015 -p 27015:27015/udp csgo_server
```

To start up a public classic competitive server container, replace GAME_SERVER_LOGIN_TOKEN with a valid token from [here](https://steamcommunity.com/dev/managegameservers) and run
```
docker run -d -p 27015:27015 -p 27015:27015/udp csgo_server -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_dust2 +sv_setsteamaccount GAME_SERVER_LOGIN_TOKEN
```
