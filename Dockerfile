FROM nickblah/lua:5-alpine
ENV file /var/rinha/source.rinha.json
COPY files/*.json /var/rinha/
COPY . /
CMD lua main.lua $file
