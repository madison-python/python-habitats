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

(madpy) $ which pip
/Users/work/.venvs/madpy/bin/pip
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

# Demo

Installing `google_survey` in a virtualenv.

```bash
# Create and activate new python3 virtualenv named madpy2
$ python -m venv ~/.venvs/madpy2
$ source ~/.venvs/madpy2/bin/activate

# Install google_survey from github
(madpy2) $ pip install git+git://github.com/madison-python/google-survey.git#egg=google_survey

# Test out google_survey
(madpy2) $ python -m google_survey madpy-habits-survey.yaml > results.csv

# Deactivate
(madpy2) $ deactivate
$
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

```bash
$ python3 -m venv ~/.venvs/project-a
$ source ~/.venvs/project-a/bin/activate
(project-a) $ pip install -r requirements.txt
(project-a) $
```

```bash
$ mkvirtualenv project-a -r requirements.txt
(project-a) $
```

# Other features of virtualenvwrapper

```bash
ls $VIRTUALENVWRAPPER_HOOK_DIR  # list of hooks
virtualenvwrapper                 # list of commands
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
2. `vim ~/.bash_profile` ← export WORKON_HOME and source virtualenvwrapper.sh
3. `source ~/.bash_profile`
4. `mkvirtualenv project-a`
5. `workon project-a`

# Other approaches to environment management

- pyenv
- Canopy by Enthought
- Anaconda by Continuum
