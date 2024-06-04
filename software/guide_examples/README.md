<!--
   Copyright 2024, Center for High Throughput Computing, University of Wisconsin - Madison

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->

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

