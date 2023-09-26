FROM nickblah/lua:5-alpine
ENV file /var/rinha/combination
COPY files/*.json /var/rinha/
CMD lua main.lua $file
