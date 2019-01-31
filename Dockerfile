FROM ubuntu
RUN apt update && apt install -y git python gcc python-pip cmake

## Copy local data into container
COPY . /code

## Start installing stuff
WORKDIR /code
RUN pip install -r requirements.txt

## Install elastix
RUN apt install -y libinsighttoolkit4-dev zlib-devel
RUN git clone https://github.com/SuperElastix/elastix.git
WORKDIR /code/elastix
RUN cmake . && make -j4 && make install

## Install niftyreg
WORKDIR /code
RUN git clone https://github.com/KCL-BMEIS/niftyreg.git
WORKDIR /code/niftyreg
RUN cmake . && make && make install


EXPOSE 6006

CMD ["sh"]
