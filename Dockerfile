#FROM ubuntu:20.04 

FROM python

LABEL org.opencontainers.image.authors="Walt Howd <walthowd@gmail.com>, Franklyn Tackitt <git@frank.af>"

RUN mkdir -p /silabs

RUN apt-get update \
  && apt-get install -y \
        git wget python3-pip unzip jq curl \
        build-essential libssl-dev libffi-dev rustc \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade 'bellows>=0.32.0' 'pyserial' 'xmodem'

ADD . /silabs/
ADD https://github.com/Elelabs/elelabs-zigbee-ezsp-utility/raw/master/Elelabs_EzspFwUtility.py /silabs/
ADD https://github.com/grobasoz/zigbee-firmware/archive/refs/heads/master.zip /silabs/zigbee-firmware

WORKDIR /silabs
CMD /silabs/update-firmware.sh

