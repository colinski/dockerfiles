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
RUN pip install pycocotools
RUN pip install terminaltables

#onnx
RUN pip install onnx==1.11.0
RUN pip install onnxruntime==1.10.0
RUN pip install onnx-simplifier

#install torch and mmcv
RUN pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
RUN pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.10.0/index.html

#install mmclassification
WORKDIR /root
RUN git clone https://github.com/open-mmlab/mmclassification.git
WORKDIR /root/mmclassification
RUN git checkout 2037260 #version 0.21.0
RUN pip install .

#install mmdetection
WORKDIR /root
RUN git clone https://github.com/open-mmlab/mmdetection.git
WORKDIR /root/mmdetection
RUN git checkout 52a3276 #version 2.22.0
RUN pip install .

#install mmtracking
WORKDIR /root
RUN git clone https://github.com/open-mmlab/mmtracking.git
WORKDIR /root/mmtracking
RUN git checkout 3b7acb7 #version 0.11.0
RUN pip install .

WORKDIR /root

#RUN pip install numpy
#RUN pip install opencv-python
#RUN pip install sklearn
#ENV TF_CPP_MIN_LOG_LEVEL 2
#RUN pip install tensorflow
#RUN pip install torch torchvision
#RUN pip install mmcv -f https://download.openmmlab.com/mmcv/dist/cpu/torch1.10.0/index.html
