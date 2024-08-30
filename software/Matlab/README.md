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

# Matlab

Definition files for installing Matlab and Matlab Toolboxes in a container environment.

* [Base Matlab container](./base-matlab)
* [Matlab with Compiler](./mcc-compiler)
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
   The syntax is `MATLAB_RELEASE=<Matlab version>` where you need to replace `<Matlab version>` with the one you are using. 
   This version needs to match the version specified in the `From` line, but does not include the operating system.

## Installing Toolboxes

The toolboxes/features to install are defined using the variable `MATLAB_PRODUCT_LIST` in the "Quick Settings" section of the definition file.
The syntax for defining the product list is `MATLAB_PRODUCT_LIST="MATLAB Toolbox1 Toolbox2"` and so on, where you must include `MATLAB` and where the toolboxes are taken from [chtc_licensed_toolboxes.txt](./chtc_licensed_toolboxes.txt). 
For a full list of toolboxes, go to a link like the following: [https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/mpm-input-files/R2022b/mpm_input_r2022b.txt](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/mpm-input-files/R2022b/mpm_input_r2022b.txt). 
(This specific link is for `R2022b`, but you can replace the version numbers in the link to get the list for other versions of Matlab.)

> The list of toolboxes in [chtc_licensed_toolboxes.txt](./chtc_licensed_toolboxes.txt) is not all-inclusive.
> That is, there may be toolboxes in the full list above available for use because they are included the base license of Matlab.
> For example, the `Parallel_Computing_Toolbox` is in the full list and not in the CHTC licensed list, but is still functional.
