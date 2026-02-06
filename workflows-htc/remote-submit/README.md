# Remote Submission to CHTC

> [!Caution]
> You may not share your token with anyone. Sharing your token is akin to sharing your password, and is a violation of CHTC policy. Violations will result in account deactivation. Read our user expecations and policies here: https://chtc.cs.wisc.edu/uw-research-computing/user-expectations.html

## Software installation

You'll need to install the HTCondor Python bindings to your local device.
This can generally be done by running

```bash
python3 -m pip install htcondor
```

If you are on MacOS, the package is only available via [conda-forge](https://anaconda.org/channels/conda-forge/packages/htcondor/overview):

```bash
conda install conda-forge::htcondor
```

Once installed, you should be able to run the following command to return the condor version.

```bash
CONDOR_CONFIG=/dev/null python3 -c 'import htcondor2 as htcondor ; print(htcondor.version())'
```

## Setup

### Get access token

Before starting your Python session, you need to get an access token from the access point you want to submit to.
Run the following commands, 

```bash
mkdir -p ~/.condor/tokens.d
ssh yourNetID@yourAccessPoint.chtc.wisc.edu condor_token_fetch > ~/.condor/tokens.d/yourAccessPoint
chmod 600 ~/.condor/tokens.d/*
```

where `yourNetID` is replaced with **your** NetID, and `yourAccessPoint` is replaced with the name of **your** access point.
You will prompted as normal for logging in to the access point, but once successful the command `condor_token_fetch` will run and the output will be saved to the file in the `token` directory.

For example, if your NetID is `bbadger` and you are using `ap2002`, then the you would run

```bash
mkdir -p ~/.condor/tokens.d
ssh bbadger@ap2002.chtc.wisc.edu condor_token_fetch > ~/.condor/tokens.d/ap2002
chmod 600 ~/.condor/tokens.d/*
```

> [!CAUTION]
> If the permissions for the token file are not set correctly, you will get an error when you try to submit your job!

### Create user configuration

Create a `user_config` file in your `.condor` directory (i.e. `~/.condor/user_config`). In this file, add these lines:

```
SCHEDD_HOST = ap2002.chtc.wisc.edu
COLLECTOR_HOST = cm.chtc.wisc.edu
```

If you are using a different Access Point, replace `ap2002.chtc.wisc.edu` with the full address of the Access Point.

## Running python

The following commands can be run in the python console (launched by running `python3`) or in a python script.

We recommend that you test these commands in the console before you try to implement them in a script, so that you can troubleshoot issues.
At any time, you can turn on debugging with the python command

```python
import htcondor2 as htcondor

htcondor.enable_debug()
```

### Importing htcondor

To get the latest version of the Python bindings, you'll need to import `htcondor2`.
To support backwards compatibility on existing scripts, we recommend 

```python
import htcondor2 as htcondor
```

When you import `htcondor` (or `htcondor2`), it will automatically check for an HTCondor config file.
If one doesn't exist, it will throw a warning.
You can prevent this message by setting the environment variable `CONDOR_CONFIG=/dev/null`.
(If you have a local condor config file, you can set that path instead.)

To temporarily set the value when you launch Python, you can do

```bash
CONDOR_CONFIG=/dev/null python3
```

You can set the value for the current session with

```bash
export CONDOR_CONFIG=/dev/null
```

You can set it permanently by adding the above `export` command to your `~/.bashrc` file.

## Connect to the remote pool

The following Python code will instantiate a connection to your remote pool.
Whenever you want to interact with the remote pool, you will need to run this code first.

```python
import htcondor2 as htcondor

access_point = htcondor.Schedd()
```

The `access_point` object represents HTCondor on the access point.
Using this object, you can submit jobs, check the queue and history, and other things.

For example, the following command will list your jobs by their ID and status.

```python
access_point.query('User == "YOUR_USERNAME@chtc.wisc.edu"', projection = ["ClusterID", "ProcID", "JobStatus"])
```

or

```python
access_point.query(opts=htcondor.QueryOpt.DefaultMyJobsOnly, projection = ["ClusterID", "ProcID", "JobStatus"])
```

## Generate credentials

> [!IMPORTANT]
> Currently, we need to implement a workaround to have submission credentials for your job. This will eventually be phased out.

To workaround submission credential issues, we need to keep one job in the queue. Log into the AP and submit a job. You may use the example submit file:

```
batch_name = placeholder
shell = sleep 300
hold = true
request_cpus = 1
request_disk = 1 MB
request_memory = 1 MB
queue
```

Submit the job, then return to working in Python.

## Create files for a test job

We'll create a test job with the following Python code:

**test.sh**

```python
test_sh = '''#!/bin/bash

echo "Running on $(hostname) in directory $(pwd)."
echo "Arguments are '${1}' and '${2}'."

echo "This is an error message" >&2

grep -i "badger" test.txt > result.txt
'''


with open('test.sh', 'w') as f:
    f.write(test_sh)
```

**test.txt**

```python
test_txt = '''Bucky Badger says hi!
This line contains a "badger" and will be in the output.
This line does not and so will not be in the output.
'''


with open('test.txt', 'w') as f:
    f.write(test_txt)
```

## Describe the test job

Like with submitting a job on the access point, you'll need to tell HTCondor the parameters for managing your job.
On the access point, you would create a submit file.
You can do something similar using the Python bindings.

```python

test_job_dict = {
    "executable": "test.sh",
    "arguments": "rst 123",
    "log": "test.log",
    "output": "test.out",
    "error": "test.err",
    "transfer_executable": False,
    "transfer_input_files": "test.txt, test.sh",
    "request_cpus": "1",
    "request_memory": "1 GB",
    "request_disk": "1 GB",
}

# This creates the job description, but **does not** submit the job!
# Your queue statement is defined in this step, as an option to the Submit method.
test_job = htcondor.Submit(test_job_dict)

```

There are other ways of defining the job, including reading in a regular submit file.

## Submit the test job

Make sure that you have your local files ready for submission.

There are two steps to submitting the job:

1. Sending the job description
2. Sending the local input files

To send the job description, run the following in your python session:

```python
submit_object = access_point.submit(test_job, spool=True)
```

You then need to send the local input files by running

```python
access_point.spool(submit_object)
```

The `submit_object` contains information about your job submission.
The files are transferred to a temporary directory on the access point made especially for that job.

> [!WARNING]
> If you are working with large files, you should place those in your `/staging` directory in advance.
> As long as their transfer is declared using the `file://` or `osdf://` protocol in your `transfer_input_files` statement, you do not need to "spool" these files in advance.

## Confirm job submission

Confirm that your job was submitted with this query:

```python
access_point.query(f"ClusterID == {submit_object.cluster()}", projection = ["ProcID", "JobStatus"])
```

[Job Status Codes](https://htcondor.readthedocs.io/en/latest/classad-attributes/job-classad-attributes.html#JobStatus)

| Code | Status |
| --- | --- |
| 1 | Idle |
| 2 | Running |
| 3 | Removing | 
| 4 | Completed | 
| 5 | Held |
| 6 | Transferring Output | 
| 7 | Suspended |

## Optional: monitor the job

Because you remotely submitted the job, you will need to run the query command each time you want to see the status of the job.
This sort of monitoring is best implemented as a `while` loop with a moderate sleep delay to prevent overwhelming the access point with queries.

For example:

```python
import time

done = False
print("Waiting for job completion...")
while not done:
    ads = access_point.query(f"ClusterID == {submit_object.cluster()}", projection = ["ProcID", "JobStatus"])
    done = all(i['JobStatus'] == 4 for i in ads)
    time.sleep(60)
    print('.', end='', flush=True)
print("\nJob(s) have completed!")


```

> [!CAUTION]
> Do not query the access point in loops faster than 30 seconds per loop!!

There are more elaborate ways of setting up the monitoring, especially in combination with the next step (transferring output files).
And if you are going to submit lots of jobs, there are other recommended ways to monitor the progress.

## Fetch results

Because you remotely submitted the job, the job will remain in the queue marked as "completed" until you fetch the results or remove the job.

To get the results, use the `retrieve` method on your **completed** jobs.

For this example,

```python
access_point.retrieve(f"ClusterID == {submit_object.cluster()}")
```

This should return the output files from the corresponding job to your local directory.

> [!WARNING]
> If your job creates large output files, those should be redirected to your staging directory using the `transfer_output_remaps` command and the `file://` or `osdf://` protocols.

## Removing the job

Currently, you have to manually remove the job from the queue once you have retrieved the results.

```python
access_point.edit(submit_object.cluster(), "LeaveJobInQueue", False)
```

## Support

Please direct all questions to [chtc@cs.wisc.edu](mailto:chtc@cs.wisc.edu)