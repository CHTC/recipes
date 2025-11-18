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

# PyTorch

Container definition files for using the PyTorch program with NVIDIA CUDA libraries. 

Our recipes are based off of [NVIDIA's Pytorch containers](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch), which come prepackaged with many common python libraries, such as `scipy`, `numpy`, and `matplotlib`, and system packages like `git`, `wget`, `cmake`, and `vim`/`nano`.

To install Pytorch with conda, see our [conda-pytorch recipes](../Conda/conda-pytorch/).

If you do not need to add any other packages, you can directly use NVIDIA's PyTorch containers in your jobs by adding the following line:

```
container_image = docker://nvcr.io/nvidia/pytorch:25.10-py3
```

## Installing packages

**If you are installing additional packages using Apptainer on CHTC, request 25 GB or more of disk space in your submit file for your build. The build process is disk-heavy!**

```
request_disk = 25 GB
```

To install packages, add/modify the `python3 -m pip install` command in the provided files.

> We encourage you to use the `python3 -m pip install` command instead of `pip install`, 
> as this will ensure that you are always installing the packages into the version of python that you are using.

If installing multiple packages, it is generally best to place all packages within the same
`python3 -m pip install` command in case they share dependencies. For example,

```
python3 -m pip install package1 package2 package3
```

To specify specific package versions, you can use the built-in `pip` syntax `packagename==version`.
For example,

```
python3 -m pip install package1==1.0 package2==3.2.1 package3
```