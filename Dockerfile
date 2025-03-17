FROM ubuntu:22.04
LABEL Name=markdowncv Version=0.0.1

# Set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive 

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-xetex \
    lmodern \
    # Install the required LaTeX packages from apt instead of tlmgr
    texlive-latex-recommended \
    texlive-plain-generic \
    && rm -rf /var/lib/apt/lists/*

# Install pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.12.1/pandoc-3.1.12.1-1-arm64.deb \
    && dpkg -i pandoc-3.1.12.1-1-arm64.deb \
    && rm pandoc-3.1.12.1-1-arm64.deb

# Set the working directory
WORKDIR /data

# Set the entrypoint to pandoc
ENTRYPOINT ["pandoc"]

# Default command (can be overridden)
CMD ["--help"]

