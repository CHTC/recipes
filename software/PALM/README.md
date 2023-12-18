# PALM

Container definition files for the PALM program.

Program overview: [https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/PALM](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/PALM)

> PALM — Permutation Analysis of Linear Models — is a tool that allows inference using permutation methods,
> offering a number of features not available in other analysis software.

Requires either [GNU Octave](https://octave.org/) or Matlab.

## [palm-alpha119-octave-440.def](palm-alpha119-octave-440.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **gnuoctave/octave:4.4.0** | *DockerHub* |
| *Updated* | December 18, 2023 | *Andrew Owen* |
| *Last tested on HTC* | December 15, 2023 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

```
wget https://github.com/CHTC/recipes/raw/main/software/PALM/palm-alpha119-octave-440.def
```

### Build Notes

This specific instance was created for processing neural imaging. 
Should also work for Octave 6.4.9 as well. 

Quite a few files in PALM have to be recompiled for the specific version of Octave being used.
This is not well documented in the PALM website. 
Compiling commands were adapted from [https://www.jiscmail.ac.uk/cgi-bin/webadmin?A2=fsl;f141e60f.1903](https://www.jiscmail.ac.uk/cgi-bin/webadmin?A2=fsl;f141e60f.1903).

> One file in particular was unable to be compiled using Octave 4.4.0: `/palm-alpha119/fileio/\@gifti/private/miniz.c`.
> The importance of this file is not known.
