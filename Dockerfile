FROM nickblah/lua:5-alpine
ENV file fib
COPY files/*.json /var/rinha/
COPY . /
CMD lua main.lua $file
