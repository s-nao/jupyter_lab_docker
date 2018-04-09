FROM jupyter/datascience-notebook

RUN pip install --upgrade pip


ADD ./init/python/libraries.txt ./libraries.txt
RUN pip install -r libraries.txt

ADD ./init/ruby/Gemfile ./Gemfile
ADD ./init/ruby/Gemfile.lock ./Gemfile.lock

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
RUN gem install bundler

RUN git clone https://github.com/zeromq/czmq
RUN cd czmq && ./autogen.sh && ./configure && make && make install

RUN bundle install

USER jovyan

RUN iruby register --force
RUN jupyter serverextension enable --py jupyterlab

CMD ['iruby']