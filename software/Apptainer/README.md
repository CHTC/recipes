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

# Apptainer

Container definition files for installing Apptainer.
**This is intended for "nested" containers.**

> [!IMPORTANT]
> You do not need to do this for the "normal" use of Apptainer containers on CHTC.
> This is explicitly for the case where you need to be able to launch an Apptainer container ***from inside another container***!

## About nested containers

Normal execution of a container on CHTC has the correct permissions set automatically for everything to work as expected.
But those permissions do not extend into launching a container from inside of an already running container.
The result is usually some form of "permission denied" error.

