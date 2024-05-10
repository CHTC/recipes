# Python

Container definition files for installing Python packages in a Python environment.
Intended only for packages that can be `pip` installed using Python 3. 

* [Adding packages to base python container](./base-python)
* [Python container with numpy](./numpy)
* [Python container with scipy](./scipy)

If you need to install packages using Python 2, please contact the facilitators.
If you need to install packages using `conda`, see our [Conda recipes](/software/Conda).
If you are looking to install PyTorch, see our [PyTorch recipes](/software/PyTorch).

## Installing packages

To install packages, add/modify the `python3 -m pip install` command in the provided .def files.

> We encourage you to use the `python3 -m pip install` command instead of `pip install`, 
> as this will ensure that you are always installing the packages into the version of python that you are using.

If installing multiple packages, it is generally best to place all packages within the same
`python3 -m pip install` command in case they share dependencies. For example,

```
python3 -m pip install package1 package2 package3
```

To specify specific package versions, you can use the built-in `pip` syntax `packagename==version`.
For example,

```
python3 -m pip install package1==1.0 package2==3.2.1 package3
```

## Choosing the version of python

These recipes are based on the official Python container images on DockerHub: https://hub.docker.com/_/python. 
Generally, you can edit the "from" line of the definition file to specify the version you want to use.
For example, using

```
# Apptainer .def file
From: python:3.6
# Dockerfile
FROM python:3.6
```

will build a container with Python version 3.6. 

## Choosing the base operating system

You can also specify the base operating system for the container. 
For example, to install packages for Python 3.8 in an Alpine Linux container, you would use

```
# Apptainer .def file
From: python:3.8-alpine
# Dockerfile
FROM python:3.8-alpine
```

For more information, see the overview at https://hub.docker.com/_/python.
