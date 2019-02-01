FROM jupyterhub/jupyterhub
RUN apt update && apt install -y git gcc g++ cmake
RUN conda install notebook
## Copy local data into container
COPY . /code

## Start installing stuff
WORKDIR /code
RUN ls
RUN bash ./addUsersWithPasswords.sh
RUN rm usersAndPasswords.txt


# RUN pip install -r requirements.txt
# ## Install elastix
RUN apt install -y elastix


# ## Install niftyreg
WORKDIR /code
RUN git clone https://github.com/KCL-BMEIS/niftyreg.git && mkdir nifty-build
WORKDIR /code/nifty-build
RUN cmake ../niftyreg && make -j10 && make install

EXPOSE 8000

