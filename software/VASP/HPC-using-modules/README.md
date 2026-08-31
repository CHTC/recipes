# Instructions for Installing VASP v6.2.0 on CHTC's Spark cluster

Follow the process below to install VASP to your /home directory on the Spark cluster.

This assumes that you have 

1. a CHTC account that has been activated for use on the Spark cluster
2. a copy of the `vasp.6.2.0.tgz` source code

## Log in

```
ssh yourNetID@spark-login.chtc.wisc.edu
```

You will have to be on the campus internet or VPN to login.
You may find it useful to login a second time in a separate window.

## Create parent directory

Software should always be compiled in the /home directory.

If compiling the software for only your use, that is the /home/yourNetID directory.

If compiling the software for group use, that should be /home/groups/yourGroupName.
If you do not know your group directory, or if it does not exist, contact the facilitation team for assistance.

For good organization, recommend that you create a parent `vasp` directory to work out of:

```
cd /home/yourNetID
mkdir vasp
cd vasp
pwd
# /home/yourNetID/vasp/
```

or

```
cd /home/groups/yourGroupName
mkdir vasp
cd vasp
pwd
# /home/groups/yourGroupName/vasp
```

The following instructions will be using the individual `/home/yourNetID/vasp` directory as the parent directory.
If your installation directory is different, simply replace that path with your desired path.

## Upload source code

VASP requires that you have a license in order to obtain the source code.
These instructions assume you have a copy of the `vasp.6.2.0.tgz` source code onto your computer.

Upload this source code to the `vasp` parent directory you created in the previous step.
If you are not sure how to upload the source code, see the CHTC guide [here](https://chtc.cs.wisc.edu/uw-research-computing/transfer-files-computer).

You are ready to proceed if you can see the file as so:

```
cd /home/yourNetID/vasp
ls
# vasp.6.2.0.tgz
```

## Extract source code

Assuming you are in the right directory, you can run

```
tar -xzf vasp.6.2.0.tgz
```

This should only take a couple of seconds to execute.
Afterwards, you should see that a new directory has been created:

```
ls -F
# vasp.6.2.0/ vasp.6.2.0.tgz
```

Inside of that directory is the VASP source code. 
You should see this:

```
cd vasp.6.2.0/
ls -F
# README.md  arch/  bin/  build/  makefile  src/  testsuite/  tools/
```

## Obtain the include file

The VASP program needs to be instructed about the software available for use on CHTC.

We've uploaded a custom version of this file for use on the Spark cluster to
our [Recipes GitHub repository](https://github.com/CHTC/recipes). 

You can obtain this file by running the following command:

```
wget https://github.com/CHTC/recipes/raw/refs/heads/main/software/VASP/makefile.include
```

## Start an interactive session

```
srun --mpi=pmix -n4 -N1 -t 240 -p int --pty bash
```

Compiling software can be a computationally intensive task. 
This command starts an interactive session to use one of the worker machines for the compilation.

Interactive sessions on the Spark cluster have a 4 hour time limit.
For more information, see the CHTC guide [here](https://chtc.cs.wisc.edu/uw-research-computing/hpc-job-submission#c-requesting-an-interactive-job-int-and-pre-partitions).

## Load necessary modules

```
module load openmpi gcc intel-oneapi-mkl hdf5
```

The custom `makefile.include` that we have provided will only work if the right "modules" are loaded.
For more information, see the CHTC guide [here](https://chtc.cs.wisc.edu/uw-research-computing/hpc-software#2-using-pre-installed-software-in-modules).

## Compile the program

Before proceeding, make sure you are in the source code directory and have the `makefile.include` file:

```
pwd
# /home/yourNetID/vasp/vasp.6.2.0
ls -F
# README.md  arch/  bin/  build/  makefile  makefile.include  src/  testsuite/  tools/
```

Now run

```
make DEPS=1 -j4 all 2>&1 | tee make.log
```

> Technically, the second half (`2>&1 | tee make.log`) is not required, 
> but it makes troubleshooting easier if something goes wrong.

This will take a while to run.

The final couple of output lines should look like the following, if the compilation is successful:

```
make[2]: Leaving directory '/home/aowen4/vasp/vasp.6.2.0/build/std'
make[1]: Leaving directory '/home/aowen4/vasp/vasp.6.2.0/build/std'
```

You should also see the program files in the bin folder:

```
ls -F /home/yourNetID/vasp/vasp.6.2.0/bin/
vasp_gam*  vasp_ncl*  vasp_std*
```

## Using VASP in future jobs

To run calculations on the Spark cluster, you need to create an "sbatch" script for submitting the job using Slurm.
The general structure is discussed in the CHTC guide [here](https://chtc.cs.wisc.edu/uw-research-computing/hpc-job-submission#a-submitting-a-job).

For using VASP in particular, you'll need to include a version of the following lines:

```
# Load required modules
module load openmpi gcc intel-oneapi-mkl hdf5
# Add VASP commands to the PATH
export PATH="/home/yourNetID/vasp/vasp.6.2.0/bin:${PATH}"
# Execute the VASP command using Slurm, MPI
srun --mpi=pmix yourVASPcommandHere
```

where you need to make sure the path to the `bin` folder is correct, and you need to replace `yourVASPcommandHere` with the command you want to run.

Other commands can be included in the script as desired.

## Troubleshoot a compilation problem

If the compilation runs into an error and fails, there's a couple of steps to take.

If there is a problem with the compilation, it will likely end with the following messages:

```
cp: cannot stat 'vasp': No such file or directory
make[1]: *** [makefile:146:all] Error 1
make[1]: Leaving directory '/home/yourNetID/vasp/vasp.6.2.0/build/ncl'
make: *** [makefile:9: ncl] Error 2
```

### Identify the problem

First, try to identify the error by looking at the compilation messages.
Make sure to find the first occurence of an error in the compilation;
oftentimes a problem in an earlier step causes other errors later on.

The error message may not be clear as to what the root problem is. 
In that case, please [contact the facilitation team for assistance](https://chtc.cs.wisc.edu/uw-research-computing/get-help.html).
If you are not sure what the error message is, please provide the location of the `make.log` file that was created.

### Reset the source code

You need to reset the code by running

```
make clean
```

This removes the files generated during the previous compilation attempt, which could interfere with your next attempt.

### Exit and start a new interactive job

If you are still in the interactive job, you should exit it by entering the word `exit`.
This should return your command prompt prefix to something like `[yourNetID@spark-login ]$` (the important part is the `spark-login` part).

Then restart the installation process starting at [Start an interactive session](#start-an-interactive-session), making changes as needed to address the underlying problem.
That may involve loading different modules, or modifying the `makefile.include` file.


