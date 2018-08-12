FROM ubuntu:18.04

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  sudo \
  apt-utils \
  jupyter-core \
  jupyter-notebook \
  python3-matplotlib \
  python3-numpy \
  python3-pandas \
  python3-pip \
  python3-scipy \
  python3-seaborn \
  vim \
  git

RUN apt-get install -y \
  ruby2.5 \
  ruby2.5-dev \
  gnuplot-nox \
  libgsl0-dev \
  libtool \
  zlib1g-dev \
  libsqlite3-dev \
  libmagick++-dev \
  imagemagick \
  libatlas-base-dev \
  libzmq3-dev \
  libczmq-dev

RUN pip3 install \
  sklearn_crfsuite \
  slackclient \
  gtts\
  matplotlib \
  pandas \
  sklearn \
  gensim \
  tensorflow \
  tensorlayer \
  keras \
  textblob \
  stanfordcorenlp \
  scipy \
  chainer

RUN gem install cztop iruby sciruby

RUN gem install gruff nyaplot ruby_linear_regression tensorflow.py classifier-reborn kmeans-clusterer decisiontree adaboost red-datasets-daru red-datasets daru matplotlib red-chainer mxnet data_modeler rann simple_ga pycall machine_learning_workbench ai4r rblearn shogun ruby-fann rb-libsvm

RUN gem install google-protoc --pre

RUN useradd -ms /bin/bash codete
RUN adduser codete sudo
USER codete

RUN echo 'alias python=python3' >> /home/codete/.bashrc

ENV PYTHON=/usr/bin/python
ENV LIBPYTHON=/usr/lib/x86_64-linux-gnu/libpython3.6m.so.1

EXPOSE 8888
EXPOSE 9000

WORKDIR /home/codete/

RUN iruby register --force

RUN mkdir /home/codete/workshop/

CMD jupyter-notebook --ip=0.0.0.0 --port 9000 --no-browser --notebook-dir=/home/codete/
