# Matlab

Definition files for installing Matlab and Matlab Toolboxes in a container environment.

* [Base Matlab container](./base-matlab)
* [Matlab with Symbolic Math Toolbox](./symbolic-math)

The definition files will also setup Matlab to connect to the CHTC license server.
**By using these definition files, you are agreeing to the terms and conditions for the use of Matlab as licensed by CHTC, for use at CHTC.**

> When submitting HTC jobs using this container, you MUST add 
> 
> ```
> concurrency_limits = MATLAB:1
> ```
> 
> to your submit file. Failure to do so may cause your or others' jobs to fail to obtain a license from the license server.

For more information on using the Matlab container on the HTC system, see the [Matlab guide](https://chtc.cs.wisc.edu/uw-research-computing/software-overview-htc#matlab-quickstart) on our website.

## Choosing the version of Matlab

These container recipes are compatible with Matlab version `R2019b` and onwards.
Our examples use `R2022b`.
There are two things you need to edit in the definition file to choose the version you want to use:

1. Choose the base container

   The `From` line specifies the base container to use.
   The syntax is `mathworks/matlab-deps:<Matlab version>` where you need to replace `<Matlab version>` with the version you want to use.

2. Set `MATLAB_RELEASE` in the "Quick Settings" section

   In the "Quick Settings" section of the definition file, change the value of `MATLAB_RELEASE` to the version that you are using.
   The syntax is `export MATLAB_RELEASE=<Matlab version>` where you need to replace `<Matlab version>` with the one you are using. 
   This version needs to match the version specified in the `From` line, but does not include the operating system.

## Installing Toolboxes

The toolboxes/features to install are defined using the variable `MATLAB_PRODUCT_LIST` in the "Quick Settings" section of the definition file.
The syntax for defining the product list is `"MATLAB Toolbox1 Toolbox2"` and so on, where you must include `MATLAB` and where the toolboxes are taken from [chtc_licensed_toolboxes.txt](./chtc_licensed_toolboxes.txt).