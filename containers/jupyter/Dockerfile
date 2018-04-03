FROM jupyter/datascience-notebook

# ライブラリのインストール
RUN pip install --upgrade pip
RUN pip install jupyterlab
RUN pip install PyMySQL

USER root
RUN apt-get update
RUN apt-get install -y libzmq3-dev \ 
                     libtool \
                     libtool-bin \
                     pkg-config \
                     build-essential \
                     autoconf \
                     automake \
                     uuid-dev 

RUN gem install rbczmq pry iruby
RUN iruby register

USER jovyan
RUN jupyter serverextension enable --py jupyterlab