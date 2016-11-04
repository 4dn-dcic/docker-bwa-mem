# Docker-bwa-mem


Alignment module for Hi-C data, based on bwa-mem.
* Input : a pair of Hi-C fastq files
* Output : a bam file (Lossless, not sorted by coordinate)

This repo contains the source files for a docker image stored in duplexa/bwa-mem:v1. (we will change the docker hub account soon)


## Cloning the repo
```
git clone https://github.com/4dn-dcic/docker-bwa-mem
cd docker-bwa-mem
```

## Resources tools
Major software tools used inside the docker container are downloaded by the script `downloads.sh`. This script also creates a symlink to a version-independent folder for each software tool. In order to build an updated docker image with a new version of the tools, Dockerfile doesn't need to be modified, unless the new tool requires a specific APT tool that need to be downloaded. 
The `downloads.sh` file also contains comment lines that specifies the name and version of individual software tools.


## Building docker image
You need docker daemon to rebuild the docker image. If you want to push it to a different docker repo, replace duplexa/bwa-mem:v1 with your desired docker repo name. You need permission to push to duplexa/bwa-mem:v1.
```
docker build -t duplexa/bwa-mem:v1 .
docker push duplexa/bwa-mem:v1
```

## Usage
Run the following in the container.
```
run.sh <fastq1> <fastq2> <bwaIndex> <output_prefix> <nThreads>
# fastq1, fastq2 : input fastq files, either gzipped or not
# bwaIndex : tarball for bwa index, .tgz.
# output_prefix : prefix of the output bam file.
# nThreads : number of threads 
```
