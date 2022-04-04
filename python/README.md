
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


As an example, consider the open-mmlab directionary in this repo. 
It contains the enviroment I've been using lately.
The environment is built using Docker via the Dockerfile (build.sh). 
```
sudo docker build -t colinski/open-mmlab:1.0 -f Dockerfile .
```
This image sources from an official NVIDIA image which has CUDA==11.3.0 installed in Ubuntu 20.04. 
Most of the Dockerfile just installs python modules via pip.
The build can be done on most x86 Linux computers with root access. 
However this step can be a slow and resource instensive process.

I then push it to dockerhub (push.sh).
```
sudo docker push colinski/open-mmlab:1.0
```

Finally pull the image as a Singularity SIF file 
```
singularity pull -F $SCRATCH/sif/open-mmlab:1.0.sif docker://colinski/open-mmlab:1.0
```
Note that the resulting SIF file is often large (5+ GB). 
Furthermore, the downloading process can take up to an hour.
There is an obvious ineffiecny in pushing and pulling the image.
In theory it should be possible to build the images directly using Singularity.
I am currently more comfortable with Docker and so far everything has worked fine.

Running the image looks something like:
```
singularity run --nv $SCRATCH/sif/open-mmlab:1.0.sif python
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
