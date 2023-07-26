# [workflows](/workflows/)

(intro blurb)

| Workflow Example | Submit File | DAG | 
| :--- | :---: | :---: |
| Submitting one job per input file | X | - | 

## Overview

The HTC system is best used for running *many* independent calculations, but organizing and submitting these calculations can be difficult.
Thankfully, [HTCondor](https://research.cs.wisc.edu/htcondor) has several builtin methods for submitting many jobs at a time, but it is still up to the user to organize the requisite files in order to leverage these tools.
Each directory within [workflows](/workflows/) directory represents a particular use case and contains sample files and directory structure for submitting jobs with HTCondor in CHTC.

> Note: Always test new workflows for a small (2-5) number of jobs before attempting to use the new workflow at full scale.

## CHTC workflow guides

- [Submitting Multiple Jobs Using HTCondor](https://chtc.cs.wisc.edu/uw-research-computing/multiple-jobs)
- [Submitting Multiple Jobs in Individual Directories](https://chtc.cs.wisc.edu/uw-research-computing/multiple-job-dirs)
- [Workflows with HTCondor's DAGMan](https://chtc.cs.wisc.edu/uw-research-computing/dagman-workflows)