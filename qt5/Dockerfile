FROM yuu3/docker-build-env:base_latest
MAINTAINER yuu

ENV DEBIAN_FRONTEND noninteractive
RUN sudo -E apt-get update
RUN sudo -E apt-get install -y libxcb1-dev libx11-dev gperf
RUN sudo -E apt-get clean
ENV DEBIAN_FRONTEND dialog

WORKDIR $HOME
RUN git clone git://github.com/qt/qt5.git -b 5.6.2 --single-branch
WORKDIR qt5
ADD git-shallow-submodule.sh $HOME/qt5
RUN ./git-shallow-submodule.sh
RUN sudo -E apt-get install -y python
RUN ./configure -opensource -confirm-license -nomake tests -nomake examples -qt-xcb
RUN make -j$(nproc) && sudo make install
