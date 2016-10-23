# Dotfiles

## Installation

### Create .localrc (optional)

```bash
$ cp local.dist ~/.localrc
```

Change options if needed.

List of all modules, that can be enabled:

```bash
MODULES=(bash git liquidprompt nodejs php rsync shell ssh sublime tmux vagrant zsh)
```

### Clone ssh repo (optional)

```bash
$ git clone "git@bitbucket.org:Gerschtli/ssh.git" ssh
```

### Initialize submodule

```bash
$ git submodule update --init
```

### Execute bootstrap.sh

```bash
$ ./bootstrap.sh
```

### Change shell to zsh (optional)

```bash
$ chsh -s /bin/zsh
```

## Update

```zsh
$ dotupdate
$ # or
$ dotfiles-update && shell-reload
```