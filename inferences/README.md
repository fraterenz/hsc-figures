# README
Code to regenerate the figures for the [preprint](https://www.biorxiv.org/content/10.1101/2024.04.16.589764v1) *The dynamic fitness landscape of ageing haematopoiesis through clonal competition*.

Instructions to reproduce the ABC inference from the paper can be found in the folder `abc`.

TODO, what's `doublehit`?


## Requirements
This code needs Python greater or equal to 3.9.7 and the following requirements:
1. a Python jupyter kernel with `hscpy` installed
2. the processed data of [Mitchell et al.](https://www.nature.com/articles/s41586-022-04786-y) that can be downloaded from [here](https://www.dropbox.com/scl/fi/vsuebfgfcegdoqtuvcsan/mitchell-data.tar.gz?rlkey=favnmgl4ccd246bfnikazg513&st=jrpq5ldf&dl=0)
3. The output of the simulations that can be either downloaded from [here](https://www.dropbox.com/scl/fi/pjtvnbtk5euxwylsz8pob/data.tar.gz?rlkey=l96bsmfis00473epg78yae43m&st=yo8bxi55&dl=0) or regenerated with the Rust binary.

### 1. The Python kernel
A Python environment available as a jupyter kernel (preferably named as `hsc-draft`) with `hscpy` version `v0.4.11` installed.

One way to do it:
- create a directory for the environment `mkdir ~/venvs/`
- create an empty environment `python -m venv ~/venvs/hsc-draft`
- activate the environment `source ~/venvs/hsc-draft/bin/activate`
- install the `hscpy` package `pip install git+https://github.com/fraterenz/hscpy@v0.4.11`
- install ipykernel package `pip install ipykernel` 
- make the environment available as a jupypter kernel `python -m ipykernel install --user --name hsc-draft`
- run the notebooks to regenerate the images


### 2. The donor data
- Get the processed data of Mitchell et al. from [here](https://www.dropbox.com/scl/fi/vsuebfgfcegdoqtuvcsan/mitchell-data.tar.gz?rlkey=favnmgl4ccd246bfnikazg513&st=jrpq5ldf&dl=0) or with `wget "https://www.dropbox.com/scl/fi/vsuebfgfcegdoqtuvcsan/mitchell-data.tar.gz?rlkey=favnmgl4ccd246bfnikazg513&st=jrpq5ldf&dl=0" --output-document="mitchell-data.tar.gz"`
- create a directory `mkdir ./mitchell` 
- untar the data with with gzip: `tar xvf mitchell-data.tar.gz --directory=./mitchell`


### 3. The output of the simulations
The output of the simulations can either downloaded from [here](https://www.dropbox.com/scl/fi/pjtvnbtk5euxwylsz8pob/data.tar.gz?rlkey=l96bsmfis00473epg78yae43m&st=yo8bxi55&dl=0) or generated with the Rust binary `hsc` with a specific version for example `v4.3.13`, but in general the newer the better.

#### Download the simulations 
To download the simulations without regenerating them:
- Get them from [here](https://www.dropbox.com/scl/fi/pjtvnbtk5euxwylsz8pob/data.tar.gz?rlkey=l96bsmfis00473epg78yae43m&st=yo8bxi55&dl=0) or with `wget "https://www.dropbox.com/scl/fi/pjtvnbtk5euxwylsz8pob/data.tar.gz?rlkey=l96bsmfis00473epg78yae43m&st=yo8bxi55&dl=0" --output-document="data.tar.gz"`
- untar the data with with gzip: `tar xvf data.tar.gz`

#### Generate the simulations
The other option is to regenerate the data with the binary `hsc`, that can be either [downloaded](https://github.com/fraterenz/hsc/releases/) or compiled from the source code (requires [Rust](https://www.rust-lang.org) to be installed).
To compile from source, get the code from [here](https://github.com/fraterenz/hsc) and compile it with cargo `cargo b --release`.

Once the binary file has been downloaded or generated from source code, then run the simulations following the instructions in [here](https://github.com/fraterenz/hsc-figures/tree/master/inferences/abc/README.md). On the HPC cluster at QMUL, it takes a couple of days to create the database of simulations using array jobs.
