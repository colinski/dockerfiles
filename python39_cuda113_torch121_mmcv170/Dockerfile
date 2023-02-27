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

RUN pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113

RUN pip install mmcv-full==1.7.0 -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.12/index.html

RUN pip install wikipedia
RUN pip install transformers
RUN pip install huggingface_hub
RUN pip install diffusers
RUN pip install accelerate
RUN pip install ftfy

#RUN python -c 'from huggingface_hub import HfFolder; HfFolder.save_token("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")'

RUN pip install pillow
RUN pip install matplotlib seaborn
RUN pip install ipython jupyterlab ipdb ipywidgets
RUN pip install scipy
RUN pip install scikit-learn
RUN pip install pandas

RUN pip install onnx-simplifier
RUN pip install onnxruntime-gpu
RUN pip install onnx



#basic numerical computation stuff
#RUN pip install numpy==1.22.2
#RUN pip install opencv-python==4.5.5.62
#RUN pip install pillow==9.0.1
#RUN pip install typing-extensions==4.1.1
#RUN pip install matplotlib==3.6.0
#RUN pip install scipy==1.8.0
#RUN pip install scikit-learn==1.0.2
#RUN pip install ipython==8.1.1
#RUN pip install ipdb==0.13.9
#RUN pip install jupyterlab==3.3.0
#RUN pip install ipywidgets #for jupyterlab
#RUN pip install seaborn


#onnx

#detection  and tracking stuff
RUN pip install pycocotools
RUN pip install terminaltables
#RUN pip install filterpy #Kalman filters
RUN pip install lap
RUN pip install pyro-ppl
RUN pip install motmetrics

#install torch and mmcv
#RUN pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
#RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
#RUN pip install mmcv-full==1.7.0 -f https://download.openmmlab.com/mmcv/dist/cu116/torch1.13/index.html
#RUN pip install mmcv-full==1.4.2 -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.10.0/index.html

#RUN pip install scikit-image
#RUN pip install visdom
#RUN pip install sacred

#RUN pip install pydub
#RUN pip install bounding-box
RUN pip install h5py
RUN pip install tensorboard
RUN pip install beautifulsoup4
RUN pip install omegaconf
RUN pip install hydra-core
RUN pip install bitarray
RUN pip install sacrebleu
RUN pip install beartype
RUN pip install einops
RUN pip install local-attention>=1.6.0
RUN pip install Mega-pytorch
RUN pip install ema-pytorch
RUN pip install lion-pytorch
RUN pip install sentencepiece

RUN pip install pydub
