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

# [HTC Workflows](/workflows-htc/)

## Overview

The HTC system is best used for running *many* independent calculations, but organizing and submitting these calculations can be difficult.
Thankfully, [HTCondor](https://research.cs.wisc.edu/htcondor) has several builtin methods for submitting many jobs at a time, but it is still up to the user to organize the requisite files in order to leverage these tools.

> Note: Always test new workflows for a small (2-5) number of jobs before attempting to use the new workflow at full scale.

## CHTC workflow guides

- [Submitting Multiple Jobs Using HTCondor](https://chtc.cs.wisc.edu/uw-research-computing/multiple-jobs)
- [Submitting Multiple Jobs in Individual Directories](https://chtc.cs.wisc.edu/uw-research-computing/multiple-job-dirs)
- [Workflows with HTCondor's DAGMan](https://chtc.cs.wisc.edu/uw-research-computing/dagman-workflows)
