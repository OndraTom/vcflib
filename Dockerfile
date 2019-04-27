FROM ubuntu:18.04

RUN apt-get update --fix-missing -yq \
	&& apt-get install -q -y wget bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev curl unzip tabix libncurses5-dev libz-dev libbz2-dev liblzma-dev

WORKDIR /app

RUN git clone --recursive https://github.com/vcflib/vcflib.git \
	&& cd vcflib \
	&& make

ADD run.sh /app/run.sh

RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]