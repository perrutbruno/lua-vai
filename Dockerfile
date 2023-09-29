FROM nickblah/lua:5-alpine
ENV file source.rinha.json
COPY files/*.json /var/rinha/
COPY . /
CMD lua main.lua $file
