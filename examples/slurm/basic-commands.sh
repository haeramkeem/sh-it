#!/bin/bash

# Run job w/ interaction:
srun ${JOB_FILE_PATH}
# Run job w/ batch mode
sbatch ${JOB_FILE_PATH}
# Show cluster info
sinfo
# Show job info
scontrol
# Show running jobs
squeue
