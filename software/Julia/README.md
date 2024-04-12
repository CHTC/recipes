# Julia

Container definition files for using the `Julia` programming langauge.

- [Adding packages to base Julia](base-julia)

These containers use the official Julia containers provided on [DockerHub](https://hub.docker.com/_/julia).

## How to install packages

There are two ways that you can pass `Julia` commands in the `%post` section of the definition file.

### 1. Single line command

You can pass a command directly to Julia for execution using the syntax

```
    julia -e 'command to execute'
```

For example, 

```
    jullia -e 'using Pkg; Pkg.add("Cowsay"); Pkg.instantiate(); Pkg.precompile()'
```

installs the `Cowsay` package.
This approach is useful for simple commands.

### 2. Create an install script

You can create a short install script written in `Julia` that you can execute when building the container.

For example,

```
    cat << EOF > /opt/install.jl
using Pkg
Pkg.add("Cowsay")
Pkg.instantiate()
Pkg.precompile()

EOF

    julia /opt/install.jl
```

The lines between `cat << EOF` and `EOF` will be written to `/opt/install.jl`, which you can execute using `julia`.

> Note that the second `EOF` must be at the beginning of the line.

## Choosing the version of Julia

These recipes are based on the official Julia container images on DockerHub: https://hub.docker.com/_/julia.
Generally, you can edit the `From:` line of the definition file to specifiy the version you want to use.
For example, using

```
# Apptainer .def file
From: julia:1.8
# Dockerfile
FROM julia:1.8
```

will build a container with Julia version 1.8.

## Choosing the base operating system

You can also specify the base operating system for the containr.
For example, to install packages for Julia 1.8 in an Alpine Linux container, you would use

```
# Apptainer .def file
From: julia:1.10-alpine
# Dockerfile
FROM julia:1.10-alpine
```

For a list of the available operating systems, see the overview at https://hub.docker.com/_/julia. 