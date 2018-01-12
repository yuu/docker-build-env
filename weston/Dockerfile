FROM yuu3/docker-dev-env-base:latest
MAINTAINER yuu

RUN GIT_SSL_NO_VERIFY=1 git clone https://gist.github.com/f2b01dded82ad14ac57d.git $HOME/scripts
RUN sudo -E apt update
RUN MESA_BACKEND=docker $HOME/scripts/weston-install.sh
