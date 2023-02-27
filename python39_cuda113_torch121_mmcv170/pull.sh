

#export SINGULARITY_TMPDIR=/tmp/singularity 
#sudo singularity pull -F $SCRATCH/sif/python.sif docker://colinski/python
#SINGULARITY_TMPDIR=/tmp/singularity SINGULARITY_CACHEDIR=/tmp/singularity sudo -E singularity pull -F $SCRATCH/sif/python.sif docker://colinski/python
SINGULARITY_CACHEDIR=/home/csamplawski/.singularity singularity pull -F $SCRATCH/sif/python39_cuda113_torch121_mmcv170.sif docker://colinski/python39_cuda113_torch121_mmcv170 
