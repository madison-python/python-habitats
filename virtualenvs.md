---
title: Virtual environments
author: Pierce Edmiston
theme: metropolis
---

# What's a virtual environment (venv)?

```
$ which python
/usr/local/bin/python
$ source ~/.venvs/madpy/bin/activate
(madpy) $ which python
/Users/pierce/.venvs/madpy/bin/python
```

# Why use virtual environments (venvs)?

Different projects have different dependencies.

Project A needs `pandas==0.18.0`.  
Project B needs `pandas==0.16.0`.

# Deciding where to put them

1. Put all venvs in a common folder.

```
~/.venvs/project-a/
~/.venvs/project-b/
```

2. Put venvs in the project root.

```
project-a/venv/
project-b/venv/
```

# Creating virtual environments

1. Use `venv` module in the standard library.

```bash
$ python3 -m venv ~/.venvs/project-a
$ source ~/.venvs/project-a/bin/activate
(project-a) $
```

2. For python2, use `virtualenv`.

```bash
$ pip install virtualenv  # third party
$ virtualenv ~/.venvs/project-a
$ source ~/.venvs/project-a/bin/activate
(project-a) $
```

# virtualenvwrapper

```bash
$ mkvirtualenv project-a
$ workon project-a
(project-a) $
```

# Configuration for virtualenvwrapper

```
# contents of ~/.bash_profile
# ...
export WORKON_HOME=$HOME/.venvs
source /usr/local/bin/virtualenvwrapper.sh
```

# virtualenvwrapper saves you keystrokes

```
$ python3 -m venv ~/.venvs/project-a
$ source ~/.venvs/project-a/bin/activate
(project-a) $ pip install -r requirements.txt
(project-a) $
```

```
$ mkvirtualenv project-a -r requirements.txt
(project-a) $
```

# Installation and python2/python3 headaches

Install virtualenvwrapper with pip.

```
$ pip2 install virtualenvwrapper
$ mkvirtualenv project-a                   # python2
$ mkvirtualenv --python=python3 project-a  # python3
```

```
$ pip3 install virtualenvwrapper
$ mkvirtualenv project-a                   # python3
$ mkvirtualenv --python=python2 project-a  # python2
```

# virtualenvwrapper overview

1. `pip3 install virtualenvwrapper`
2. `vim ~/.bash_profile`
3. `source ~/.bash_profile`
4. `mkvirtualenv project-a`
5. `workon project-a`

# Separate python installs

- Canopy
- Anaconda
- pyenv

# Canopy

A GUI for Youi!

# Anaconda

```bash
$ brew install anaconda
$ source ~/anaconda3/bin/activate
(root) $
```

# New conda environments

Create an empty python3.4 conda environment, and install scipy in it.

```bash
(root) $ conda create -n project-a python=3.4
(root) $ source activate project-a
(project-a) $ conda install scipy
```

# conda for big and complicated environments

```bash
(root) $ conda env export >> my-env.yaml
```

# pyvenv

Wouldn't it be great if your computer knew which python you wanted to run based on which directory you were in?

- pyvenv looks for a `.python-version` file (or an environment variable) to determine which version of python to use.
- Great for multiple python installs (including conda!).
- But doesn't work for virtualenvs, so you still end up having to `activate` your project-specific environments to use them.
