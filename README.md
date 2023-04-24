# recipes
Recipes for building software and submitting jobs on [CHTC](chtc.cs.wisc.edu).

## Software
CHTC is moving towards using containers for most software installations.
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
The [software](/software/) directory hosts container build files for Apptainer (f.k.a. Singularity) and Docker.

## Workflows
The HTC system is best used for running *many* independent calculations, but organizing and submitting these calculations can be difficult.
Thankfully, HTCondor has several builtin methods for submitting *many* jobs at a time, but it is still up to the user to organize the requisite files in order to leverage these tools.
The [workflows](/workflows/) directory hosts example file structures for organizing large workflows that can take advantage of HTCondor's built in methods.

> Note: Always test new workflows for a small (2-5) number of jobs before attempting to use the new workflow at full scale.

