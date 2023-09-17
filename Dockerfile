FROM nickblah/lua:5-alpine
ENV file combination
COPY . /
CMD lua main.lua $file