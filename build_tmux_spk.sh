#!/bin/sh
mkdir -p /outspk
cd /toolkit/pkgscripts-ng
./EnvDeploy -v 6.2 -p apollolake
cd /toolkit
mkdir source
cd source
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar -zxvf tmux-${TMUX_VERSION}.tar.gz
mv tmux-${TMUX_VERSION} tmux
unzip /synology-tmux.zip -d /toolkit/source/tmux
sed -i -e "s/TMUX_VERSION/${TMUX_VERSION}/g" /INFO.sh
cp -f /INFO.sh /toolkit/source/tmux/synology/
cd /toolkit/pkgscripts-ng
./PkgCreate.py -v 6.2 -p apollolake tmux
cp /toolkit/build_env/ds.apollolake-6.2/image/packages/*.spk /outspk/