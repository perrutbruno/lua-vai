FROM nickblah/lua:5-alpine
ENV file combination
COPY files/*.json /var/rinha/
COPY . /
CMD lua main.lua $file
