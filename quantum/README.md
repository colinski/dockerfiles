
## Python Environment

In order to have a consistent and portable Python enviroment, I use a containerized environment via Docker and Singularity. 
Containers let you define entire Linux enviroments progamatically via a Dockerfile. Dockerfiles and associated scripts are found in this repo.
At runtime, a container acts as an isolated Linux enviroment installed with whatever the Dockerfile defined. 
The enviroment is saved inside an image file which can be shared.
The Unity cluster does not support Docker, but rather uses Singularity, as it does not require root privileges like Docker. 
Container images are largely cross-compatible between the two runtimes. 

To use Singularity on Unity, make sure the following lines are in your .bashrc:
```
module load Singularity/X.Y.Z
module load cuda/11.3.1
export SCRATCH=/scratch/$USER/
```

This directory contains the enviroment I've been using lately.
First, build the image using Docker via the Dockerfile (build.sh). 
```
sudo docker build -t colinski/python -f Dockerfile .
```
This image sources from an official NVIDIA image which has CUDA==11.3.0 installed in Ubuntu 20.04. 
Most of the Dockerfile just installs python modules via pip.
The build can be done on most x86 Linux computers with root access. 
However this step can be a slow and resource instensive process.

I then push it to dockerhub (push.sh).
```
sudo docker push colinski/python
```

Finally pull the image as a Singularity SIF file 
```
singularity pull -F $SCRATCH/sif/python.sif docker://colinski/python
```
Note that the resulting SIF file is often large (5+ GB). 
Furthermore, the downloading process can take up to an hour.
There is an obvious ineffiecny in pushing and pulling the image.
In theory it should be possible to build the images directly using Singularity.
I am currently more comfortable with Docker and so far everything has worked fine.

Running the image looks something like:
```
singularity run --nv $SCRATCH/sif/python.sif python
```
This will drop you into a python interpreter with the installed packages. 
Note that the --nv option is necessary for any GPUs to be visible inside the container.
So far I haven't had any trouble using the GPUs inside the container on both Unity and my local GPU.

## OpenMMLab
I train most models using the OpenMMLab collection of libraries (mmclassification, mmdetection, etc.). 
The container discussed above has MMCV installed which is the backbone shared across all the libraries.
These libraries change quickly as new architectures are added regularly.
For this reason, most people use the libraries from source, rather than installing from pip.
I keep my own personal forks so I can push changes seperate from the main library.
They can be downloaded via:
```
git clone https://github.com/colinski/mmclassification.git
git clone https://github.com/colinski/mmdetection.git
git clone https://github.com/colinski/mmtracking.git
```
I try to keep them update to with the upstream master branch so that I can use any new models that get added.
For that reason I try to only add new files and not modify any code from the main library.
This helps avoid merge conflicts when fetching the upstream.

### Example
Lets consider training and testing a model on COCO using mmdetection.
First make sure that the COCO data is stored in the following way:
```
├── data
│   ├── coco
│   │   ├── annotations
│   │   ├── train2017
│   │   ├── val2017
│   │   ├── test2017
```
I personally put data/ in /scratch/$USER/ on Unity as it is much faster than /home/.
To train and test a model I use dist_train.sh and dist_test.sh found in mmdetection/tools/.


I personally put all my code in /scratch/$USER/src on Unity, so to test a model I can run the following:
```
singularity run --nv $SCRATCH/sif/python.sif bash \
  $SCRATCH/src/mmdetection/tools/dist_test.sh \
  $SCRATCH/src/mmdetection/configs/detr/detr_r50_8x2_150e_coco.py \
  detr_r50_8x2_150e_coco_20201130_194835-2c4b8974.pth \
  $NUM_GPUS \
  --eval bbox
```
The checkpoint file is downloaded from mmdetection (see configs/detr for link).
NUM_GPUS is the number of GPUs you'd like to use.
Similarly to train a model:
```
singularity run --nv $SCRATCH/sif/python.sif bash \
  $SCRATCH/src/mmdetection/tools/dist_train.sh \
  $SCRATCH/src/mmdetection/configs/detr/detr_r50_8x2_150e_coco.py \
  $NUM_GPUS \
  --work_dir /path/to/dir
```
