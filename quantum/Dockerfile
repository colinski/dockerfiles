FROM nvidia/cuda:11.3.0-runtime-ubuntu20.04
SHELL ["/bin/bash", "-c"]
MAINTAINER csamplawski@cs.umass.edu

#some libs needed for future pkgs
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata
RUN apt-get install -y build-essential
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install libgl1 libglib2.0-0 

#install python3.9 and pip
RUN apt-get -y install python3.9
RUN apt-get install -y python3.9-distutils
RUN apt-get install -y python3.9-dev
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 10

#basic numerical computation stuff
RUN pip install numpy==1.22.2
RUN pip install opencv-python==4.5.5.62
RUN pip install pillow==9.0.1
RUN pip install typing-extensions==4.1.1
RUN pip install matplotlib==3.5.1
RUN pip install scipy==1.8.0
RUN pip install scikit-learn==1.0.2
RUN pip install ipython==8.1.1
RUN pip install ipdb==0.13.9
RUN pip install jupyterlab==3.3.0
RUN pip install ipywidgets #for jupyterlab
RUN pip install seaborn
RUN pip install qiskit
RUN pip install pylatexenc
