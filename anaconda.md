---
title: Anaconda
author: Pierce Edmiston
theme: metropolis
---

# What is Anaconda?

> Anaconda is a package manager, an environment manager, a Python distribution, and a collection of over 720 open source packages.

- CLI: `conda`
- GUI: `anaconda-navigator`

# Continuum Analytics

Other projects supported by Continuum:

- Blaze
- Bokeh
- dask
- Numba
- NumFOCUS
- PhosphorJS

# Why (I) use Anaconda?

> So you can install stuff and it just works.

```bash
$ conda install tough_to_install  # maintained by Continuum
$ conda install --channel=other_smart_people tough_to_install
```

# Anaconda products (that I don't use)

- Anaconda Accelerate
- Anaconda Adam
- Anaconda Repository
- Anaconda Scale
- Anaconda Enterprise Notebooks
- Anaconda Fusion

![Anaconda Fusion](img/fusion-data-analytics-compute.png)

# Anaconda

```bash
$ brew cask install anaconda
$ source ~/anaconda3/bin/activate
# might be: /usr/local/anaconda3/bin/activate
(root) $ conda help
```

# New conda environments

Create a new python3.4 conda environment, and install scipy in it.

```bash
(root) $ conda create -n madpy2 python=3.4 scipy
```

# Different source commands

```bash
# $ source ~/.venvs/project-a/bin/activate
$ source activate madpy2

# $ deactivate
$ source deactivate
```

# Activate root first, then virtualenv

```bash
$ source ~/anaconda3/bin/activate
(root) $ source activate madpy2
```

# Example

[Installing psychopy on Anaconda python](https://github.com/lupyanlab/lab-computer/wiki/Install-psychopy-on-Anaconda-python)

```bash
(root) $ conda create -n psychopy python=2
(root) $ source activate psychopy
(psychopy) $ conda install numpy scipy matplotlib pandas pyopengl pillow \
                           wxpython lxml openpyxl xlrd configobj pyyaml gevent \
                           greenlet msgpack-python psutil pytables requests \
                           seaborn
(psychopy) $ conda install --channel conda-forge pyglet
(psychopy) $ pip install moviepy pyosf python-bidi psychopy_ext psychopy
(psychopy) $ conda install --channel cogsci pygame
```

# conda env export

```bash
(my-project) $ conda env export > my-project-env.yaml
```

# Installing from an environment yaml

[Resulting environment file](https://github.com/lupyanlab/lab-computer/blob/master/anaconda-environments/psychopy-environment-macos.yml)

```bash
(root) $ conda env create -n psychopy2 -f psychopy-environment-macos.yml
```
