FROM python:3

RUN apt-get update
RUN apt-get upgrade -y
RUN pip3 install contextvars flask flask_cors 

WORKDIR /local
ADD cairo-lang-0.4.0.zip /local

RUN pip3 install cairo-lang-0.4.0.zip

EXPOSE 4242

CMD python3 local.py  
