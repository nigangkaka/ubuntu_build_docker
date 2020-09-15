FROM ubuntu:18.04

LABEL maintainer="Kaka Ni nigang@huaqin.com" version="1.0" \
	Description="This the base image to build various platform" 

COPY sources.list /etc/apt/sources.list

RUN dpkg --add-architecture i386 && \
	apt-get update	&& \
	DEBIAN_FRONTEND=noninteractive apt -y install tzdata && \
	apt-get -y install openssl xz-utils git kmod vim file apt-utils android-tools-fsutils \
	gnupg flex bison gperf build-essential zip curl libssl-dev uuid uuid-dev openjdk-8-jdk \
	zlib1g-dev wget fakeroot genext2fs gawk subversion git-gui gitk	zlib1g-dev device-tree-compiler \
	unixodbc texinfo gcc-multilib g++-multilib cppcheck libxml2-dev	liblz-dev gdisk m4 libz-dev \
	doxygen graphviz perl ghostscript bc libncurses5-dev libx11-dev	liblzo2-2 bc rsync \
	x11proto-core-dev libgtk2.0-0 zlib1g python-crypto python3-crypto liblzo2-dev \
	mtd-utils util-linux libc6-dev-i386 lib32ncurses5 lib32ncurses5-dev	lzop u-boot-tools \
	lib32readline6-dev lib32z1 lib32z1-dev libc6:i386 libstdc++6:i386 python3 mtd-utils \
	libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig python-networkx && \
	ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime	&& \
	dpkg-reconfigure --frontend noninteractive tzdata


RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu -p "$(openssl passwd -1 ubuntu)"
USER ubuntu
WORKDIR /home/ubuntu
