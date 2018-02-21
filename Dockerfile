FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get -yq install --fix-missing -y \
    mate-core mate-desktop-environment-core openjdk-8-jre \
    openjdk-8-jdk libgconf-2-4 curl gnupg2 sudo git gettext \
    maven xrdp mc vim cron libxi6 net-tools awscli

# Install wget
RUN apt-get install -y wget

# Set the Chrome repo
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome
RUN apt-get update && apt-get -y install google-chrome-stable
