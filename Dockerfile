FROM debian:bullseye-slim

LABEL Name=markdowncv Version=0.0.1

# Set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive 

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-xetex \
    lmodern \
    texlive-latex-recommended \
    texlive-plain-generic \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.12.1/pandoc-3.1.12.1-1-arm64.deb && \
    dpkg -i pandoc-3.1.12.1-1-arm64.deb && \
    rm pandoc-3.1.12.1-1-arm64.deb

# Set the working directory
WORKDIR /data

# Set the entrypoint to pandoc
ENTRYPOINT ["pandoc"]

# Default command (can be overridden)
CMD ["--help"]

