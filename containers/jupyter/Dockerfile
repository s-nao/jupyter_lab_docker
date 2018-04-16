FROM jupyter/datascience-notebook

RUN pip install --upgrade pip

USER root
RUN apt-get update && apt-get install -y libffi-dev \
                                        libzmq3-dev \ 
                                        libtool \
                                        libtool-bin \
                                        pkg-config \
                                        build-essential \
                                        autoconf \
                                        automake \
                                        uuid-dev \
                                        cmake \
                                        git

RUN apt-get update && apt-get install -y libssl-dev \
                                        libreadline-dev \
                                        zlib1g-dev

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.profile
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN ~/.rbenv/bin/rbenv install 2.4.1
RUN ~/.rbenv/bin/rbenv global 2.4.1
RUN ~/.rbenv/bin/rbenv rehash
RUN ~/.rbenv/shims/gem install bundler

RUN git clone https://github.com/zeromq/czmq
RUN cd czmq && ./autogen.sh && ./configure && make && make install

USER jovyan

ADD ./init/python/libraries.txt ./libraries.txt
RUN pip install -r libraries.txt

ADD ./init/ruby/Gemfile ./Gemfile
ADD ./init/ruby/Gemfile.lock ./Gemfile.lock

RUN ~/.rbenv/shims/bundle install --path=vendor/bundle

RUN ~/.rbenv/shims/bundle exec iruby register --force
RUN jupyter serverextension enable --py jupyterlab

CMD ['~/.rbenv/shims/bundle','exec','iruby']