# guide\_examples

The [CHTC website](https://chtc.cs.wisc.edu/uw-research-computing/guides) has several guides on using containers on the HTC system.
This folder contains the build files discussed in those guides.

## Apptainer

The [Apptainer guide](https://chtc.cs.wisc.edu/uw-research-computing/singularity-htc) discusses a simple example and an advanced example. 
The `.sif` file required for running the container can be recreated from the corresponding `.def` file using the command

```
apptainer build example.sif example.def
```

### Simple example

The simple Apptainer container example installs the `R` package `cowsay` on top of the `rocker` curated `geospatial` container.

- [simple\_apptainer.def](simple_apptainer.def)

### Advanced example

The advanced Apptainer container example installs the program [SUMO](https://sumo.dlr.de/docs/index.html) along with the programs and libraries that it requires.

- [advanced\_apptainer.def](advanced_apptainer.def)

