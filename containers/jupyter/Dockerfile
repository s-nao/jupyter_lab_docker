FROM jupyter/datascience-notebook

# ライブラリのインストール
RUN pip install --upgrade pip
RUN pip install jupyterlab
RUN pip install PyMySQL

USER root
RUN apt-get update && apt-get install -y ruby-ffi \
                                        libzmq3-dev \ 
                                        libtool \
                                        libtool-bin \
                                        pkg-config \
                                        build-essential \
                                        autoconf \
                                        automake \
                                        uuid-dev \
                                        cmake

RUN apt-get update && apt install -y  ruby\
                                      ruby-dev

RUN gem install iruby pry cztop
RUN git clone https://github.com/zeromq/czmq
RUN cd czmq && ./autogen.sh && ./configure && make && make install

USER jovyan

RUN iruby register --force
RUN jupyter serverextension enable --py jupyterlab

CMD ['iruby']