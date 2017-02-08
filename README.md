# Dotfiles

## Modules

| Name         | Description                                                       |
|--------------|-------------------------------------------------------------------|
| bash         | Configuration for bash                                            |
| git          | Configuration for git with git hooks                              |
| git-minimal  | Minimal gitconfig                                                 |
| liquidprompt | Configuration for liquidprompt                                    |
| nodejs       | Completion for npm, adds nvm-init function                        |
| nvim         | Configuration for nvim                                            |
| php          | Aliases and completion for composer                               |
| rsync        | Adds rsc function                                                 |
| ruby         | Adds ruby gem bin directory to PATH                               |
| shell        | General configuration for shells (aliases, environment variables) |
| sublime      | Configuration for sublime text 3                                  |
| tmux         | Configuration for tmux, adds tmux profiles                        |
| vagrant      | Aliases for vagrant                                               |
| zsh          | Configuration for zsh                                             |

### Options

| Name              | Description                     |
|-------------------|---------------------------------|
| nvim:enable-vim   | Enables configuration for vim   |
| nvim:disable-nvim | Disables configuration for nvim |

## Installation

### Clone repo

```bash
$ git clone --recursive "https://github.com/Gerschtli/dotfiles.git" ~/.dotfiles
```

### Create .localrc (optional)

```bash
$ cp local.dist ~/.localrc
```

Change options if needed.

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
