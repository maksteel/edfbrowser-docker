FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"] 

RUN apt-get update \
    && apt-get install -y \
        g++ \
        make \
        git-core \
        qtbase5-dev-tools \
        qtbase5-dev \
        qt5-default \
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download the source code
RUN git clone -b master https://gitlab.com/Teuniz/EDFbrowser EDFbrowser 

# Compile and install
RUN cd EDFbrowser && qmake . && make && make install

CMD ["/usr/bin/edfbrowser"]