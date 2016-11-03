## source file for duplexa/bwa-mem:v1

FROM ubuntu:16.04
MAINTAINER Soo Lee (duplexa@gmail.com)

# 1. general updates & installing necessary Linux components
RUN apt-get update -y && apt-get install -y wget unzip less vim bzip2 make gcc zlib1g-dev libncurses-dev

WORKDIR /usr/local/bin

# bwa-0.7.13
COPY bwa-0.7.13.tar.bz2 .
RUN tar -xjf bwa-0.7.13.tar.bz2 && rm bwa-0.7.13.tar.bz2 && cd bwa-0.7.13 && make
ENV PATH=/usr/local/bin/bwa-0.7.13:$PATH

# samtools-1.2
COPY samtools-1.2.tar.bz2 . 
RUN tar -xjf samtools-1.2.tar.bz2 && rm samtools-1.2.tar.bz2 && cd samtools-1.2 && make
ENV PATH=/usr/local/bin/samtools-1.2:$PATH

# wrapper
COPY run.sh .
RUN chmod +x run.sh

# default command
CMD ["run.sh"]

