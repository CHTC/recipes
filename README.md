# recipes
Recipes for building software and submitting jobs on [CHTC](chtc.cs.wisc.edu).

## Software
CHTC is moving towards using containers for most software installations.
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
The [software](software/) directory hosts container build files for Apptainer (f.k.a. Singularity) and Docker.

The [software](software/) directory is organized by the top level software program, that is, the main program that the container is intended for.
For example, the container for SUMO also has Python installed, but Python is a required dependency of SUMO.
Therefore SUMO is the top level program, and so the container for SUMO is hosted in [software/SUMO](software/SUMO/) and not in [software/Python](softare/Python/).

