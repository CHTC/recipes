# [numpy](/software/Python/numpy)

Container definitions file that installs numpy in a Python3 environment.

If you are planning to use the scipy package, consider our recipe for [scipy](../scipy).

## [numpy.def](numpy.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian GNU/Linux 12 (bookworm) | |
| *Base image* | **python:3.11** | *DockerHub* |
| *Updated* | 2024-03-06 | *Andrew Owen* |
| *Last tested on HTC* | 2024-03-06 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

If including additional python packages, it is best to include them on the same 
line as numpy:

```
python3 -m pip install numpy package2 package3
```

See the [python DockerHub page](https://hub.docker.com/_/python/tags) to see 
which versions of Python and operating systems are available and adjust the 
`From:` line of the definition file accordingly.
