FROM ubuntu:18.04
RUN apt-get update

# to download flash player
RUN apt-get install -y curl

# flash dependencies
RUN apt-get install -y libglu1 libxcursor1 libnss3 libgtk2.0-0

# download and extract flash player
WORKDIR /usr/local/flash
RUN curl -O https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux.x86_64.tar.gz
RUN tar zxvf flash_player_sa_linux.x86_64.tar.gz

# copy over a sample swf file for testing
COPY ./wheel.swf wheel.swf 

# start 
CMD /usr/local/flash/flashplayer wheel.swf