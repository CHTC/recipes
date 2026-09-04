# GEOS

<!--
   Copyright 2026, Center for High Throughput Computing, University of Wisconsin - Madison

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

# [GEOS](/software/GEOS)

Recipe for installing [GEOS](https://github.com/GEOS-DEV/GEOS/tree/develop) on CHTC's HPC system.

Please refer to the [general GEOS installation guide](https://geosx-geosx.readthedocs-hosted.com/en/latest/docs/sphinx/QuickStart.html) for customizing your own install.

## Prerequisites and availibility on HPC

> Versions listed here are accurate as of 2026-08-31.

| Prerequisite | Available via | Version on HPC |
| --- | --- | --- |
| Git LFS | [Official Git LFS releases](https://github.com/git-lfs/git-lfs/releases) | - |
| CMake | Modules | 3.27.9 |
| GNU make | Already installed | 4.3 |
| GCC | Modules | 13.2.0 |
| Python | Already installed | 3.9.23 |
| MPI | Modules | openmpi/5.0.3 |
| ZLIB | Already installed | - |
| BLAS | Already installed | - |
| LAPACK | Already installed | - |

> [!IMPORTANT]  
> These instructions assume you are creating an individual install of GEOS. If you are creating a group installation of GEOS, make sure you install/work in the `/home/groups/my_group` directory, and set you/your group members' `PATH` variables to point to the correct install locations.

### Install a local copy of Git LFS on the HPC system

If you don't already have Git LFS installed, follow these instructions to install it. These instructions install version 3.7.1, but you may use another version, as long as it is tagged with `linux-amd64`.

1. Download the git-lfs installation files to your `/home` directory.

    ```
    cd ~
	wget https://github.com/git-lfs/git-lfs/releases/download/v3.7.1/git-lfs-linux-amd64-v3.7.1.tar.gz
	tar -xzf git-lfs-linux-amd64-v3.7.1.tar.gz
	cd git-lfs-3.7.1
    ```

1. Using a text editor (i.e., `nano`, `vim`), edit `install.sh` and set `prefix="$HOME/.local` (line 4).

1. Install and test git-lfs.

    ```
    ./install.sh
    git lfs --version
    ```

## Installation instructions

GEOS can be a tricky install. Overview of our current procedure:

1. Clone GEOS and third-party libraries (hypre and hypredrive must be cloned separately).
1. Create a custom configuration for the HPC system.
1. Install most third-party libraries (may take a few hours).
1. Install hypre and hypredrive separately.
1. Install GEOS.

### Clone GEOS and third-party libraries

See [general GEOS installation guide](https://geosx-geosx.readthedocs-hosted.com/en/latest/docs/sphinx/QuickStart.html) for more details.

1. Set up the directory structure.

    ```
    export install_dir=$HOME/geos
    mkdir -p $install_dir
    ```

1. Clone GEOS repo into the directory and update submodules

    ```
    cd $install_dir
    git clone https://github.com/GEOS-DEV/GEOS.git
	cd GEOS
	git lfs install
	git submodule init
	git submodule update
    ```

1. Clone thirdPartyLibs into the geos directory.

	cd $install_dir
	git clone https://github.com/GEOS-DEV/thirdPartyLibs.git
	cd thirdPartyLibs
	git lfs install
	git pull
	git submodule init
	git submodule update
	cd ..

1. Clone [hypre](https://github.com/hypre-space/hypre) and [hypredrive](https://github.com/hypre-space/hypredrive).

    ```
    cd $install_dir
    git clone https://github.com/hypre-space/hypre.git
    git clone https://github.com/hypre-space/hypredrive.git
    ```

### Create a custom configuration

Upload `spark-login-tpl.cmake` into the `$install_dir/GEOS/host-configs` directory and copy it `spark-login.cmake`, which is the actual file we'll use. In this cmake file, hypre and hypredrive are turned off, because we will be installing them separately.

```
cd $install_dir/GEOS/host-configs
wget <insert url here>
cp spark-login-tpl.cmake spark-login.cmake
```

> [!IMPORTANT]  
> If the versions of the dependencies or libraries you are using change, you must edit `spark-login.cmake` to point to the correct paths.

### Install third-party libraries

Third-party libraries will take anywhere between 30 minutes to over an hour to install. You should run this as a job.

```
cd /scratch/$USER
mkdir build-geos
cd build-geos
wget <insert url here>
sbatch build-tpl.sh
```

### Install hypre and hypredrive

There are currently incompatibilities with using hypre/hypredrive as packaged within the third-party libraries, so we need to build these separately. These will also take 30 minutes to over an hour to install.

```
cd /scratch/$USER/build-geos
wget <script>
sbatch build-hypredrive.sh
```

## Install GEOS

Before we can install GEOS, we need to turn off the XML validation test, which is outdated.

```
mv $install_dir/GEOS/examples/functions/function_examples/function_examples.xml \
$install_dir/GEOS/examples/functions/function_examples/function_examples.xml.broken
```

Next, we need to replace the `spark-login.cmake` file with a new cmake file, with hypre and hypredrive turned on.

```
mv $install_dir/GEOS/host-configs
wget <link>
cp spark-login-geos.cmake spark-login.cmake
```

Then build GEOS.

```
cd /scratch/$USER/build-geos
wget <script>
sbatch build-geos.sh
```