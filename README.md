# Docker-bwa-mem

Alignment module for Hi-C data, based on bwa-mem.
* Input : a pair of Hi-C fastq files
* Output : a bam file (Lossless, not sorted by coordinate)

## Building docker image
The corresponding docker image can be rebuilt as follows:
```
git clone https://github.com/4dn-dcic/docker-bwa-mem
cd docker-bwa-mem
. download.sh
docker build -t duplexa/bwa-mem:v1 .
docker push duplexa/bwa-mem:v1 # you need permission to do this. (we will change the docker hub account soon)
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
