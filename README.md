# github.com/lujimin/dotfiles

lujimin's dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Prerequisites

Before applying these dotfiles on macOS:

- Install [Homebrew](https://brew.sh/) and make sure `brew` is available in `PATH`.
- Install [Fish](https://fishshell.com/) and configure it as the default login shell. This repository does not install Fish or change the default shell.

## Install

If chezmoi is already installed:

```console
$ chezmoi init --apply lujimin
```

To install chezmoi and apply these dotfiles in one command:

```console
$ sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply lujimin
```
