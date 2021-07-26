FROM python:3

RUN apt-get update
RUN apt-get upgrade -y
RUN mkdir server

WORKDIR server

# set cairo lang
RUN apt-get install -y libgmp-dev
RUN pip3 install ecdsa fastecdsa sympy
ADD src/cairo-lang-0.3.0.zip .
RUN pip3 install cairo-lang-0.3.0.zip
RUN pip3 install contextvars

CMD ../bin/bash 
