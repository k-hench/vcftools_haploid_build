FROM docker.io/debian:11.3
LABEL authors="Kosmas Hench" \
      description="Haploid capable vcftools"

# setting up conda
RUN apt update && apt install -y wget procps
RUN apt install -y git gcc g++ make libz-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libgsl-dev autoconf automake libtool pkg-config build-essential vcftools gawk perl zlib1g-dev

RUN mkdir -p /manual_install/bin && \
    cd /manual_install && \
    git clone https://github.com/jydu/vcftools/ && \
    mv vcftools vcftools_haploid && \
    cd vcftools_haploid/ && \
    ./autogen.sh && \
    ./configure && \
    make && \
    cd ../bin && \
    ln -s ../vcftools_haploid/src/cpp/vcftools ./vcftools_haploid

ENV PATH ${PATH}:manual_install/bin