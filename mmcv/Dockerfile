FROM pytorch/pytorch:latest
SHELL ["/bin/bash", "-c"]
MAINTAINER csamplawski@cs.umass.edu

RUN apt-get update 
RUN apt-get -y install gcc

#libs for opencv
RUN apt-get -y install libgl1 libglib2.0-0 

#RUN apt-get -y install python3
#RUN apt-get -y install python3-pip


#RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN pip install opencv-python
RUN pip install scipy
RUN pip install sklearn
RUN pip install ipython ipdb
RUN pip install jupyterlab
RUN pip install pycocotools
RUN pip install terminaltables
RUN pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.10.0/index.html

#WORKDIR /root
#RUN git clone https://github.com/open-mmlab/mmclassification.git
#WORKDIR /root/mmclassification
#RUN pip install .

#WORKDIR /root
#RUN git clone https://github.com/open-mmlab/mmdetection.git
#WORKDIR /root/mmdetection
#RUN pip install .

WORKDIR /root

#RUN pip install numpy

#RUN DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata
#RUN pip install opencv-python

#RUN pip install sklearn

#ENV TF_CPP_MIN_LOG_LEVEL 2
#RUN pip install tensorflow

#RUN pip install torch torchvision
#RUN pip install mmcv -f https://download.openmmlab.com/mmcv/dist/cpu/torch1.10.0/index.html


