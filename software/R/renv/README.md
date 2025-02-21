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

# [renv](/software/R/renv)

Container definition files for reproducing an R environment using the [renv package](https://rstudio.github.io/renv/). 

## Obtain necessary files

There are several files that you need to generate in order to duplicate your R environment.
To do so,

1. Install the `renv` package (skip if already installed) 

   Run the following command in your R console:

   ```
   install.packages("renv")
   ```

2. Initialize version tracking

   For an existing project, you initialize the `renv` tracking with

   ```
   library(renv)
   renv::init()
   ```

   Then enter `y` to confirm you want to initialize the environment.

   **Make sure you run this command in the R project folder with the scripts that you want to use.**
   There should be a `.Rproj` file in the directory with your scripts; if not, go to "File" > "New project..." to create a one.

   This command will create a directory and several other files in your project folder, and automatically detect the packages you are loading in your Rscripts.

   > **WARNING**: If your R script contains a syntax error, `renv` won't be able to scan that file!
   > If there are syntax errors, the `init` command should print warning messages before asking if you want to proceed.
   > We recommend that you do *not* proceed.
   > Instead, fix the specified syntax errors and try again.

3. Continue working on project

   If your project is still in development, continue as you normally would, including installing packages.
   Once you are satisfied your code is ready, go to the next step.

4. Capture a "snapshot" of your project environment

   Assuming that your environment is set up to your satisfaction, and that you have already initialized the `renv` environment (see step 2 above), 
   then you can record the packages and versions your scripts need with the following command:

   ```
   library(renv)
   renv::snapshot()
   ```

   As mentioned in the warning in Step 2, this process cannot scan files with R syntax errors.

5. Copy necessary files

   The command from the previous step updated several files.
   These files are required to replicate your environment:

   * `project_folder/renv.lock`
   * `project_folder/renv/activate.R`
   * `project_folder/renv/settings.json`

## Build Notes

See the [rocker/r-ver tags 
page](https://hub.docker.com/r/rocker/r-ver/tags) 
to see which versions of R are available
and adjust the `From` line of the recipe file accordingly.  
***The version of R you choose must match the version of R you were using when you generated the `renv` files!***

This recipe assumes that the `renv.lock`, `activate.R`, and `settings.json` files are in the same directory as the definition file.
You can check that the files are in the right location with this command:

```
ls activate.R renv.def renv.lock settings.json
```

If correct, you will just see a printout of the file names.
If incorrect, you will see an error message like `ls: cannot access '<filename>': No such file or directory`. 

> If building an Apptainer container on the HTC system, make sure that you list those files in the `transfer_input_files` line of your submit file!
> See [our guide](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc) for more information on building Apptainer containers on the HTC system.

### Linux libraries

Some R packages require specific Linux libraries that are not included in the base container by default.
When `renv` tries to install such an R package, the container build will fail with an error message that looks like this:

```
Error in dyn.load(file, DLLpath = DLLpath, ...) :
  unable to load shared object '/opt/renv/staging/______':
  LIBRARY.so.NUMBER: cannot open shared object file: No such file or directory
```

where `LIBRARY` and `NUMBER` will depend on what the missing library is.

To fix this, you will need to add instructions to the container definition file to install the corresponding `LIBRARY` Linux package (usually named `LIBRARY-dev`).

[ Instructions TBD. For assistance, contact a facilitator ]

## [renv.def](renv.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/r-ver:4.4.2** | *DockerHub* |
| *Updated* | 2024-12-27 | *Andrew Owen* |
| *Last tested on HTC* | 2024-12-27 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/r-ver:4.4.2** | *DockerHub* |
| *Updated* | 2024-12-27 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |
