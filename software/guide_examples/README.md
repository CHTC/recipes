# guide\_examples

The [CHTC website](chtc.cs.wisc.edu/uw-research-computing/guides) has several guides on using containers on the HTC system.
This folder contains the build files discussed in those guides.

## Apptainer

The [Apptainer guide](chtc.cs.wisc.edu/uw-research-computing/singularity-htc) discusses a simple example and an advanced example. 
The `.sif` file can be recreated from the corresponding `.def` file using

```
apptainer build example.sif example.def
```

### Simple example

The simple Apptainer container example installs the `R` package `cowsay` on top of the `rocker` curated `geospatial` container.

- [simple\_apptainer.def](simple_apptainer.def)
- [simple\_apptainer.sif](simple_apptainer.sif)

### Advanced example

The advanced Apptainer container example installs 

