# Dotfiles

## Installation

### Create .localrc (optional)

```bash
$ cp local.dist ~/.localrc
```

Change options if needed.

List of all modules, that can be enabled:

```bash
MODULES=(bash git liquidprompt nodejs nvim php rsync shell sublime sublime3 tmux vagrant zsh)
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

```bash
$ dotupdate
```
