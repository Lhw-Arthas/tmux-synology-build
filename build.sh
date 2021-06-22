#!/bin/sh
chmod a+x *.sh
docker build --build-arg tmux_ver=3.2a -t tmux-spk .
mkdir artifacts
docker run --rm --privileged -v $(pwd)/artifacts:/outspk tmux-spk
docker rmi tmux-spk