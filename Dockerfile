FROM ubuntu
RUN apt-get update \
    && apt-get install -y wget xz-utils python3 git unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /toolkit \
    && cd /toolkit \
    && git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git
ARG tmux_ver=3.2a
ENV TMUX_VERSION=${tmux_ver}
COPY build_tmux_spk.sh /
COPY INFO.sh /
COPY synology-tmux.zip /
CMD exec /build_tmux_spk.sh
