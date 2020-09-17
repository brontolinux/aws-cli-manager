# aws-cli-manager

## What it is

This is a Makefile to manage the installation of the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html) in a user's home directory on Linux, and to ease the update and removal processes.

There are no official native packages for the AWS CLI. Installing the latest version on a fresh machine is easy, 
but updating an older version to the latest or uninstalling it is a bit tedious, in that it requires you to remeber/find out
where you did install the software last time and where you linked it. This Makefile takes care of it, so that you don't have to.

This Makefile was tested on Debian Linux 10 "Buster". I expect it to work on mostly any Linux distribution but I haven't
tested that. **Pull requests** to make it work on a wider range of Linux distributions **are welcome!** Pull requests to **support other OSs** are also welcome!**

## Prerequisites

This Makefile requires `curl` and `unzip` to be installed on the system in `/usr/bin`. Just edit the variable definitions
at the top of the Makefile if they don't match your system (`CURL` and `UNZIP` respectively).

## Defaults

These are the defaults defined in the Makefile. You can edit it to suite your taste and needs:

### Installation directory

AKA `--install-dir` in the installer command line. By default it's `$HOME/.local/lib/aws-cli`, where `$HOME` is the home directory of the user running `make`. To change it, edit the `INSTALLDIR` definition in the Makefile. You can also modify it on `make`'s command line, but it's not recommended.

### Binary directory

AKA `--bin-dir` in the installer command line. By default it's `$HOME/bin`, where `$HOME` is the home directory of the user running `make`. To change it, edit the `BINDIR` definition in the Makefile. You can also modify it on `make`'s command line, but it's not recommended.

## Usage

### `make` or `make usage`

Will tell you how to use the makefile. Or you can read on.

### `make install`

Will install the AWS CLI

### `make update`

Will update an existing installation of the AWS CLI.

### `make uninstall`

Will wipe the installation.

### `make clean`

Useful in case `make` left some temporary directories around, for any reason.