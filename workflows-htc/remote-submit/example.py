#!/usr/bin/env python3

# Before running this script, you need to run the following in your terminal!!!
#
#     mkdir -p ./token
#     ssh yourNetID@yourAccessPoint.chtc.wisc.edu condor_token_fetch > ./token/yourAccessPoint
#     chmod 600 ./token/*
#
# where `yourNetID` is replaced with **your** NetID, and `yourAccessPoint` is replaced with the name of **your** access point.
# You will prompted as normal for logging in to the access point, but once successful the command `condor_token_fetch` will run and the output will be saved to the file in the `token` directory.

import htcondor2 as htcondor

# If you run into issues, you can enable additional debugging information with
# htcondor.enable_debug()

# CONNECT TO THE REMOTE POOL

# Whenever you want to interact with the remote pool, you will need to run this code first.

htcondor.param["SEC_TOKEN_DIRECTORY"] = "./token/"
collector = htcondor.Collector("cm.chtc.wisc.edu")
ap = htcondor.classad.quote("ap2002.chtc.wisc.edu")
schedd_ads = collector.query(htcondor.AdTypes.Schedd, constraint=f"Name=?={ap}", projection=["Name", "MyAddress", "DaemonCoreDutyCycle", "CondorVersion"])[0]
schedd = htcondor.Schedd(schedd_ads)

# GENERATE CREDENTIALS

# This step is currently necessary in order for any jobs you submit from you local machine to run.
# Normally this is automatically run on submission when you use `condor_submit` on the access point.
# You should only need to do this once per session.

cred_ad = collector.query(htcondor.AdTypes.Credd, constraint=f"Name == {ap}")[0]
credd = htcondor.Credd(cred_ad)
for service in ["rdrive", "scitokens"]:
    credd.add_user_service_cred(htcondor.CredType.OAuth, b"", service)

# DESCRIBE THE TEST JOB

# This is normally added automatically when you submit jobs on the access point.
# But that doesn't happen with remote submit.
default_submit_requirements = '(TARGET.PoolName == "CHTC") && ((((Target.OpSysMajorVer == 9) && (Target.OpSysName =!= "Debian") &&  !(Target.OSPool ?: false))) || (((Target.OSPool ?: false) && ((Target.OSGVO_OS_STRING ?: "") == "RHEL 9")))) && (TARGET.Arch == "X86_64") && (TARGET.OpSys == "LINUX") && (TARGET.Disk >= RequestDisk) && (TARGET.Memory >= RequestMemory) && ((TARGET.FileSystemDomain == MY.FileSystemDomain) || (TARGET.HasFileTransfer))'

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
    # special options due to remote submit:
    "FileSystemDomain": "ap2002.chtc.wisc.edu",
    "Requirements": default_submit_requirements,
    # no queue statement in this dict; use the submit method!
}

# This creates the job description, but **does not** submit the job!
# Your queue statement is defined in this step, as an option to the Submit method.
test_job = htcondor.Submit(test_job_dict)

# Create files for test job:
# As you may have noticed, the test job described above requires `test.txt` and `test.sh`.
test_sh = '''#!/bin/bash

echo "Running on $(hostname) in directory $(pwd)."
echo "Arguments are '${1}' and '${2}'."

echo "This is an error message" >&2

grep -i "badger" test.txt > result.txt
'''

with open('test.sh', 'w') as f:
    f.write(test_sh)

test_txt = '''Bucky Badger says hi!
This line contains a "badger" and will be in the output.
This line does not and so will not be in the output.
'''

with open('test.txt', 'w') as f:
    f.write(test_txt)

# SUBMIT THE TEST JOB

# Send the job description
submit_object = schedd.submit(test_job, spool=True)

# Send the local input files (DO NOT SEND LARGE FILES THIS WAY!!)
schedd.spool(submit_object)

# CONFIRM JOB SUBMISSION

print('Checking that job was submitted')
schedd.query(f"ClusterID == {submit_object.cluster()}", projection = ["ProcID", "JobStatus"])

# MONITOR JOB COMPLETION

import time

done = False
print("Waiting for job completion...")
while not done:
    ads = schedd.query(f"ClusterID == {submit_object.cluster()}", projection = ["ProcID", "JobStatus"])
    done = all(i['JobStatus'] == 4 for i in ads)
    time.sleep(60)
    print('.', end='', flush=True)
print("\nJob(s) have completed!")

# Do not query the schedd in loops faster than 30 seconds per loop!!
# There are more elaborate ways of setting up the monitoring, especially in combination with the next step (transferring output files).
# And if you are going to submit lots of jobs, there are other recommended ways to monitor the progress.

# FETCH RESULTS

# Because you remotely submitted the job, the job will remain in the queue marked as "completed" until you fetch the results or remove the job.

# To get the results, use the `retrieve` method on your **completed** jobs.
schedd.retrieve(f"ClusterID == {submit_object.cluster()}")

# REMOVE THE JOB

schedd.act(htcondor.JobAction.Remove, f"ClusterID == {submit_object.cluster()}")
