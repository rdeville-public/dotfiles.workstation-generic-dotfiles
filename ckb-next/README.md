<div align="center" style="text-align: center;">
  <!-- Project Title -->
  <a href="https://framagit.org/rdeville.public/my_dotfiles/ckb_next">
    <img src="docs/assets/img/logo.png" width="100px">
    <h1>CKB-Next Configuration</h1>
  </a>

  <a href="https://opensource.org/licenses/MIT">
    <img alt="License" src="https://img.shields.io/badge/Licence-MIT-informational?style=flat-square&logo=appveyor">
  </a>
  <a href="https://framagit.org/rdeville.public/my_dotfiles/ckb_next/commits/master">
    <img alt="Build Status" src="https://framagit.org/rdeville.public/my_dotfiles/ckb_next/badges/master/pipeline.svg?style=flat-square&logo=appveyor">
  </a>
</div>

--------------------------------------------------------------------------------

<div align="center" style="text-align: center;">
<b>My <a href="https://github.com/ckb-next/ckb-next">CKB-Next</a>
configuration.</b>
</div>

--------------------------------------------------------------------------------

Main repo is on [ Framagit][repo_url]. On another online git platforms,
their are just mirror of the main repo. Any issues, pull/merge requests, etc,
might not be considered on those other platforms.

--------------------------------------------------------------------------------


# Table of Content

* [Description](#description)
* [Usage](#usage)
* [Documentation](#documentation)
  * [Software Requirements](#software-requirements)
  * [Local Documentation Rendering](#local-documentation-rendering)

# Description

This is simply my [CKB-Next][ckb-next] configuration. It has only one profile
called **Heat Map** which apply a gradient color (from green to red) each time I
press a key on my keyboard.

As I don't really look at my keyboard, I do not need a fancy configuration like
waves, etc. I just want to know which key I press most of the time.

Below is a gif showing you such behaviour:

![Demo Gif][demo.gif]

This repo comes with a systemd user service files to automatically start
[ckb-next][ckb-next] at startup.

# Usage

This repos is structured to be cloned with [`vcsh`][vcsh], , to used it, you
will need to clone the repo with the following command:

```bash
# Clone with HTTPS
vcsh clone https://framagit.org/rdeville.public/my_dotfiles/ckb-next.git ckb-next
# Clone with SSH
vcsh clone git@framagit.org:rdeville.public/my_dotfiles/ckb-next.git ckb-next
```

Then, you will need to enable the user service provided with the repo:

```bash
# From anywhere
# Enable user service
systemcl --user enable ckb-next.service
# Activate user service
systemcl --user start ckb-next.service
```

And that is all.

# Documentation

A more details documentation, is available at [Online
Documentation][repo_online_documentation].

**IMPORTANT !!**

If, for any reason, the link to the [Online
Documentation][repo_online_documentation] is broken, you can generate the
documention locally on your computer (since the documentation is jointly stored
within the repository).

## Software Requirements

In this section we will only describe external requirements, i.e. the
requirements that are not indirectly described through requirements files
(e.g.  files `requirements.txt` and `requirements.dev.txt` for python
dependencies) required to render the documentation.

External software requirements are:

  - python3 >= 3.8
  - pip3 (using python >= 3.8)
  - python3-venv (using python >= 3.8, or directly `python3.8-venv` for debian
    based distros)

## Local Documentation Rendering

Assuming you have already installed requirements described above:

```bash
# Go to the documentation location
cd ~/.config/ckb-next
```

Then, setup a temporary python virtual environment and activate it:

```bash
# Create the temporary virtual environment
python3 -m venv .temporary_venv
# Activate it
source .temporary_venv/bin/activate
```
Now, install required dependencies to render the documentation in the python
virtual environment:

```bash
# Assuming you are in ~/.config/ckb-next
pip3 install -r requirements.txt
```

Now you can easily render the documentation by using [mkdocs][mkdocs] through
the usage of the following command (some logs will be outputed to stdout):

```bash
# Assuming you are in ~/.config/ckb-next/
mkdocs serve -f mkdocs.local.yaml
```

You can now browse the full documentation by visiting
[http://localhost:8000][localhost].


[repo_url]: https://framagit.org/rdeville.public/my_dotfiles/ckb_next
[repo_online_documentation]: https://docs.romaindeville.fr/my_dotfiles/ckb_next
[vcsh]: https://github.com/RichiH/vcsh
[mkdocs]: https://www.mkdocs.org/
[localhost]: http://localhost:8000
[ckb-next]: https://github.com/ckb-next/ckb-next
[demo.gif]: docs/assets/img/demo.gif
