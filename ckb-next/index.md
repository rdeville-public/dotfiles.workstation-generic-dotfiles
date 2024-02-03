<div align="center" style="text-align: center;">
  <!-- Project Title -->
  <a href="https://framagit.org/rdeville.public/my_dotfiles/ckb_next">
    <img src="assets/img/logo.png" width="100px">
    <h1>CKB-Next Configuration</h1>
  </a>

</div>

--------------------------------------------------------------------------------

<div align="center" style="text-align: center;">
<b>My <a href="https://github.com/ckb-next/ckb-next">CKB-Next</a>
configuration.</b>
</div>

--------------------------------------------------------------------------------

## Description

This is simply my CKB-Next configuration. It has only one profile called **Heat
Map** which apply a gradient color (from green to red) each time I press a key
on my keyboard.

As I don't really look at my keyboard, I do not need a fancy configuration like
waves, etc. I just want to know which key I press most of the time.

Below is a gif showing you such behaviour:

![!Demo Gif][demo.gif]

This repo comes with a systemd user service files to automatically start
[ckb-next][ckb-next] at startup.

## Usage

This repos is structured to be cloned with [`vcsh`][vcsh], to used it, you will
need to clone the repo with the following command:

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


[vcsh]: https://github.com/RichiH/vcsh
[direnv]: https://direnv.net
[ckb-next]: https://github.com/ckb-next/ckb-next
[demo.gif]: assets/img/demo.gif
