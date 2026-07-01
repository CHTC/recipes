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

# Stata

Definition file and supporting files for installing Stata in a container environment.

**By using these definition files, you are agreeing to the terms and conditions for the use of Matlab as licensed by the University of Wisconsin-Madison, for use at CHTC.**

## [stata19.def](stata19.def)
| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 24.04 | |
| *Base image* | **ubuntu:24.04** | *DockerHub* |
| *Updated* | 2026-07-01 | *Amber Lim* |
| *Last tested on HTC* | 2026-06-30 | *Amber Lim* |
| *Last tested on HPC* | - | - |

## Prerequisites

* An account on CHTC systems
* [Stata 19 - Linux Installer](https://apps.software.wisc.edu/Vendor/View/79)
* License info (available at the link above)
   - Serial number
   - Code
   - Authorization

## Add license info to the definition file

> [!IMPORTANT]
> Before you can use Stata 19 on CHTC systems, you must edit `stata19.def` to include license info. Replace these lines to the university-provided license info on the Campus Software page. *Do not include the brackets (`< >`)
> 
> ```
> <REPLACE WITH SERIAL NUMBER>
> <REPLACE WITH CODE>
> <REPLACE WITH AUTHORIZATION>
> ```

## Build an Apptainer image on CHTC's HTC system

We recommend following [our guide](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc) on building Apptainer containers.

Make sure you have the following uploaded on CHTC:
* `stata19.def`
* `installv2`
* `StataNow19Linux64.tar.gz` (The Stata 19 - Linux Installer)

Then in your submit file for your interactive build job be sure to include:

```
transfer_input_files = installv2,stata.def,StataNow19Linux64.tar.gz
```

Follow the rest of the guide to build your Stata Apptainer image.

## Get help

If you have questions about building or using the Stata Apptainer image, reach out to [chtc@cs.wisc.edu](mailto:chtc@cs.wisc.edu).