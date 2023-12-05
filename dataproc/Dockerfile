#FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
FROM stereolabs/zed:3.7-gl-devel-cuda11.4-ubuntu20.04
SHELL ["/bin/bash", "-c"]
MAINTAINER csamplawski@cs.umass.edu

RUN apt-key del "7fa2af80" \
    && export this_distro="$(cat /etc/os-release | grep '^ID=' | awk -F'=' '{print $2}')" \
    && export this_version="$(cat /etc/os-release | grep '^VERSION_ID=' | awk -F'=' '{print $2}' | sed 's/[^0-9]*//g')" \
    && apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/${this_distro}${this_version}/x86_64/3bf863cc.pub"


#some libs needed for future pkgs
#RUN rm /etc/apt/sources.list.d/cuda.list
#RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata
RUN apt-get install -y build-essential
RUN apt-get -y install curl 
RUN apt-get -y install git
RUN apt-get -y install libgl1 libglib2.0-0 

#install python3.9 and pip
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python3.9
#RUN apt-get install -y python3.10-distutils
#RUN apt-get install -y python3.10-dev
#RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#RUN python3 get-pip.py
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

#RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu114
#RUN pip install transformers
#RUN pip install huggingface_hub
#RUN pip install diffusers
#RUN pip install accelerate
#RUN pip install ftfy

RUN pip install pillow
RUN pip install matplotlib seaborn
RUN pip install ipython jupyterlab ipdb ipywidgets
RUN pip install scipy
RUN pip install scikit-learn
RUN pip install pandas

#RUN pip install onnx-simplifier
#RUN pip install onnxruntime-gpu
#RUN pip install onnx

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
#RUN pip install pycocotools
#RUN pip install terminaltables
#RUN pip install lap
#RUN pip install pyro-ppl
#RUN pip install motmetrics

#install torch and mmcv
#RUN pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
#RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
#RUN pip install mmcv-full==1.7.0 -f https://download.openmmlab.com/mmcv/dist/cu116/torch1.13/index.html
#RUN pip install mmcv-full==1.4.2 -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.10.0/index.html

#RUN pip install scikit-image
#RUN pip install visdom
#RUN pip install sacred

RUN pip install pydub
#RUN pip install bounding-box
RUN pip install h5py
#RUN pip install tensorboard
#RUN pip install beautifulsoup4
#RUN pip install invisible_watermark safetensors

#RUN pip install openmim
#RUN mim install mmengine
#RUN pip install arm-mango

#RUN pip install audiocraft
#RUN pip install bitarray
#RUN pip install sacrebleu
#RUN pip install beartype
#RUN pip install local-attention>=1.6.0
#RUN pip install Mega-pytorch
#RUN pip install ema-pytorch
#RUN pip install lion-pytorch

#RUN pip install pydub
RUN apt-get -y install ffmpeg
RUN pip install ffmpeg-python
#RUN pip install flask
#RUN pip install arm-mango
#RUN apt-get install -y python3-tk
#RUN pip install fire
#RUN pip install fairscale
#RUN pip install sentencepiece
#RUN pip install omegaconf
#RUN pip install hydra-core
#RUN pip install einops
RUN pip install googlemaps

RUN pip install bagpy
RUN pip install tqdm

RUN apt-get install -y vim

RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=38976490
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=33217273
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=34759322

#orin 1
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=32673323
#orin 2
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=38087103
#orin 3
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=34853661
#orin 4
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=32391016
#orin 5
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=35309867
#orin 6
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=35681265
#orin 7
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=39164952
#orin 8
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=36082130
#orin 10
RUN curl -O -J -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" http://calib.stereolabs.com/?SN=34001559

RUN mv *.conf ./settings

RUN pip install torch==2.0.0+cu117 torchvision==0.15.1+cu117 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu117
#RUN pip install setuptools
#RUN pip install openmim
#RUN mim install "mmengine>=0.6.0"
#RUN mim install "mmcv>=2.0.0rc4,<2.1.0"
#RUN mim install "mmdet>=3.0.0,<4.0.0"
#RUN git clone https://github.com/lilanxiao/Rotated_IoU.git
#ENV TORCH_CUDA_ARCH_LIST=Turing
#ENV LD_LIBRARY_PATH /usr/local/cuda/lib64/stubs/:$LD_LIBRARY_PATH
#RUN apt-get -y install nvidia-container-toolkit
#RUN cd Rotated_IoU/cuda_op && python setup.py install

