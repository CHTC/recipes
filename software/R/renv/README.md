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

# Overview

**Who does this apply to?** Users familiar with running RStudio locally on their machine but wish to begin scaling their analyses on the HTC system will need to recreate a container containing the R dependencies for their code. 


**Overall steps**: To create a container that contains everything from your local RStudio instance, you will need to first create a snapshot of your packages using the `renv` package. 

Then you will transfer the files necessary (`activate.R`, `renv.lock` and `setting.json`) from your laptop to your CHTC home directory. 

Then, on CHTC, you will need to create an Apptainer container by submitting an interactive HTCondor job. This will result in a `.sif` file, which is the container file containing the software and its dependencies (in this case a specific version of R & the R packages needed to run your code). You will move this `.sif` file to your CHTC `/staging/netid` folder. 

After that you can use your container path in any HTCondor submit file.

Next time you want to use the same R/R package containers, you will not need to recreate the container (laptop renv snapshot, interactive build job), but rather only need to specify the path to the staging file.
![alt text](renv_workflow.png "renv conceptual workflow")


# Step-by-step

## 1. Obtain the necessary files using `renv`. 

There are several files (`renv.lock`, `activate.R` and `settings.json`) that you need to generate in order to duplicate your R environment.

On your computer, open RStudio, and install the `renv` package. There are two ways to set it up: by typing commands, or by using the Rstudio Interface. Use either of the two options, but not both.

1. **In your project, install the `renv` package** (skip if already installed)

   Run the following command in your R console:

   ```
   install.packages("renv")
   ```

> [!NOTE] 
> The console is the box where you can type commands interactively. This is not the same as typing this in the saved R file containing your code. More information [here](https://docs.posit.co/ide/user/ide/guide/code/console.html)

2. **Initialize version tracking.**
   **Make sure you run this command in the R project folder with the scripts that you want to use.**
   There should be a `.Rproj` file in the directory with your scripts; if not, go to "File" > "New project..." to create a one.

   This command will create a directory and several other files in your project folder, and automatically detect the packages you are loading in your Rscripts.

   For an existing project, you initialize the `renv` tracking by typing the following code in your R console:

   ```
   library(renv)
   renv::init()
   ```

   Then enter `y` to confirm you want to initialize the environment.

>[!WARNING] 
> If your R script contains a syntax error, `renv` won't be able to scan that file!
> If there are syntax errors, the `init` command should print warning messages before asking if you want to proceed.
> We recommend that you do *not* proceed.
> Instead, fix the specified syntax errors and try again.

Alternatively, you can click File > New Project > Check the box for initializing the renv project > Create Project.

![alt text](rstudio_project_renv.png "renv project setting")

3. **Continue working on project**

   If your project is still in development, continue as you normally would, including installing packages and writing code in a Rmd or R file.
   Once you are satisfied your code is ready, go to the next step to create a snapshot of your environment.

4. **Capture a "snapshot" of your project environment**

   Assuming that your environment is set up to your satisfaction, and that you have already initialized the `renv` environment (see step 2 above), then you can record the packages and versions your scripts need with the following command in the R console:

   ```
   library(renv)
   renv::snapshot()
   ```

   As mentioned in the warning in Step 2, this process cannot scan files with R syntax errors.

## Transfer the necessary files from your laptop to CHTC

5. **Copy necessary files**

   You local R project now have 3 files that need to be transferred to CHTC's access point.

   The command from the previous step updated several files.
   These files are required to replicate your environment:

   * `project_folder/renv.lock`
   * `project_folder/renv/activate.R`
   * `project_folder/renv/settings.json`

To transfer file to your CHTC folder, use the `scp` command:

For example, if you have a folder `/home/netid/project` on CHTC, and you want to move your files from your laptop to there, type:
e.g.
```
scp project_folder/renv.lock [netID]@[address]:/home/netid/project/
scp project_folder/renv/activate.R [netID]@[address]:/home/netid/project/
scp project_folder/renv/settings.json [netID]@[address]:/home/netid/project/
```

For more information on transferring files from your computer to CHTC, see [this guide](https://chtc.cs.wisc.edu/uw-research-computing/transfer-files-computer).

## Code and test the Rscript that you will eventually want to run on CHTC

6. **Create an executable .R script.**

If you wrote your script in a `.R` file, you will transfer this file to your `home` folder on the access point.

If you wrote your script in an Markdown `Rmd` file, convert it to an `R` file first. To do that, you can strip your `Rmd` file and turn it into a `R` file by typing this in your RConsole on your laptop:

```
knitr::purl("script.Rmd")
```

(Replace script.Rmd with the name of your choice)

This creates a file named `script.R`. Transfer this file onto CHTC as well.

Transfer the `script.R` file to the desired location in your CHTC `/home/netid/project` folder.

```
scp project_folder/script.R [netID]@[address]:/home/netid/project/
```

## Building the R container on CHTC

You can choose to build the container using Docker or Apptainer. The instructions below are for Apptainer. 

>[!NOTE]
> If you choose this route, you do not have to install Docker on your laptop at all.

### Instructions for Apptainer

These steps are done **logged in** to the CHTC access point.

>[!TIP]
> See [our guide](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc) for more information on building Apptainer containers on the HTC system.

Login to your CHTC access point, and navigate to the folder that contains the `.lock`, `.R` and `.json files`.

Get also a copy of the `.def` file from the [`chtc/recipes/software/R/renv/renv.def`](./renv.def) page.

Get a copy of a `build.sub` file and place it in the same folder. A `build.sub` example is found at the CHTC guide here: (https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc#start-an-interactive-build-job)

Edit the `build.sub` file to **match the R version** in your `renv.lock` file with the `From:` line from the `.def` file.

For example:
```
grep 'Version' renv.lock | head -n 1
#     "Version": "4.4.0",

grep 'From:' renv.def
# From: rocker/r-ver:4.4.0
```

>[!IMPORTANT]
> See the [rocker/r-ver tags page](https://hub.docker.com/r/rocker/r-ver/tags) to see which versions of R are available and adjust the `From` line of the recipe file accordingly.  **The version of R you choose must match the version of R you were using when you generated the `renv` files!**


This recipe assumes that the `renv.lock`, `activate.R`, and `settings.json` files are in the same directory as the definition file.

You can check that the files are in the right location with this command:

```
ls activate.R renv.def renv.lock settings.json
```

If correct, you will just see a printout of the file names.

If incorrect, you will see an error message like `ls: cannot access '<filename>': No such file or directory`. 

**Additionally**, ensure that your `build.sub` file contains the `.lock`, `.R` and the `.json` file in the line `transfer_input_files`:
```
grep 'transfer_input_files' build.sub
# If you have additional files in your /home directory that are required for your container, add them to the transfer_input_files line as a comma-separated list.
transfer_input_files = activate.R,renv.def,renv.lock,settings.json
```

To begin building your Apptainer container, start an interactive job (`condor_build -i build.sub`) and use the apptainer `build` and `shell` commands to build and test the container. Once the software installation has been tested, move the container to `staging` before exiting the interactive build job.

To use the path to your `renv.sif` file in a HTCondor job, please see: https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc#use-an-apptainer-container-in-htc-jobs

In summary, 

```
ssh netID@[address].chtc.wisc.edu
# Enter your password
# cd into the project folder where you transferred your .lock, .json and activate.R file
cd project 
# make a copy of the renv.def file
wget https://github.com/CHTC/recipes/raw/refs/heads/main/software/R/renv/renv.def
nano renv.def
# IMPORTANT! Edit the R version in your renv.def file to match the one in your renv.lock file. 
# save and exit (ctrl + x, yes, enter)
# get a copy the build template
# go to this website: https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc.html#start-an-interactive-build-job and copy the text in grey into a new file named build.sub
nano build.sub
# paste the build.sub text
# IMPORTANT!! Edit the transfer_input_files = line to say: 
# transfer_input_files = renv.def, activate.R, renv.def, renv.lock, settings.json
# save and exit (ctrl + x, yes, enter)
ls
# You should see activate.R, settings.json, renv.lock, build.sub, renv.def
```

Submit the job interactively:
```
condor_submit -i buid.sub
[enter the interactive job]
apptainer build renv.sif renv.def
apptainer shell -e renv.sif 
# test it
exit
# move the sif file to staging
mv renv.sif /staging/netid/
# Exit the interactive job
exit
```

# Common errors during the renv container build:

During the `apptainer build` step, you might encounter these errors.

## Linux libraries

Some R packages require specific Linux libraries that are not included in the base container by default.
When `renv` tries to install such an R package, the container build will fail with an error message that looks like this:

```
Error in dyn.load(file, DLLpath = DLLpath, ...) :
  unable to load shared object '/opt/renv/staging/______':
  LIBRARY.so.NUMBER: cannot open shared object file: No such file or directory
```

where `LIBRARY` and `NUMBER` will depend on what the missing library is.

To fix this, you will need to add instructions to the container definition file to install the corresponding `LIBRARY` Linux package (usually named `LIBRARY-dev`).

**Example**:

For example, if the error message during the build is `libfftw3.so.3`, then the LIBRARY name is `libfftw3` according to the syntax above.

> [!TIP]
> The `renv` package typically provides the explicit name of the package to install. 
> Look for the part of the message that specifies what to install on `Debian` or `Ubuntu`, and that is the name of the package that you should install.

Directly inside of the interactive job, you can use nano to edit the `renv.def` file and add these lines below the `%post` line:

```
%post
   chmod 777 /tmp
   apt-get update -y
   apt-get -y install libfftw3-dev
```

Rebuild your container image:
```
apptainer build renv.sif renv.def
```

>[!NOTE]
> You might need to cycle through the rebuilding steps a few times. Here, it's common to see a "library missing" message, edit the definition file, build the container, and see that another library is missing. Keep appending the missing library name to the end of the `apt-get -y install` line in the `%post` section and retry building the container until it succeeds.

## Use your new container in a job

Now that you have a custom-made R container for your project, you can use it in your HTCondor file.

To run an HTCondor job with this new container, the same principle applies as standard jobs: an executable `sh` script, a `submit` file with a `container_image` file path in linking to the `file://staging/netid/renv.sif` container you just created, and in this case an `.R` file that will be run on the remote machine. 

>[!TIP]
> This is a good time to ensure that your folder is set-up properly for the job to run, including all the files you need.

>[!TIP]
> If you are testing your container in a job for the first time, make sure the executable `.R` script written in your HTCondor submit file applies on 1 "instance" of the job your want to run. Recall that HTcondor can queue instances as part of the submit file `queue` statement. This likely means that you need to **modify** the original script that you used and tested on your laptop.


## References

These guides directly address topics mentioned in this README file. 

- How to transfer files: https://chtc.cs.wisc.edu/uw-research-computing/transfer-files-computer

- How to connect to CHTC: https://chtc.cs.wisc.edu/uw-research-computing/connecting

- Requesting a staging folder: https://chtc.cs.wisc.edu/uw-research-computing/file-avail-largedata 

- How to build your own container: https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc#build-your-own-container

- How to use your container in a job: https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc#use-an-apptainer-container-in-htc-jobs 

- How to scale your jobs: https://chtc.cs.wisc.edu/uw-research-computing/multiple-jobs#main


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
