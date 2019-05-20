# Dotfiles

## Modules

| Name         | Description                                                       |
|--------------|-------------------------------------------------------------------|
| atom         | Configuration for atom                                            |
| bash         | Configuration for bash                                            |
| dunst        | Configuration for dunst (libnotiy daemon)                         |
| dwm          | Configuration for dwm sessions                                    |
| eclipse      | Configuration for eclipse                                         |
| git          | Configuration for git with git hooks                              |
| htop         | Configuration for htop                                            |
| i3           | Configuration for i3                                              |
| intellij     | Configuration for intellij                                        |
| liquidprompt | Configuration for liquidprompt                                    |
| nix          | Collection of nix-shell profiles, nshell function and completion  |
| nodejs       | Completion for npm, adds nvm-init function                        |
| nvim         | Configuration for nvim                                            |
| php          | Aliases for composer                                              |
| pure         | Configuration for pure                                            |
| shell        | General configuration for shells (aliases, environment variables) |
| sqlite       | Configuration for sqlite cli                                      |
| ssh          | General configuration for ssh, keychain and modules               |
| sublime      | Configuration for sublime text 3                                  |
| tmux         | Configuration for tmux and tmux profiles                          |
| vagrant      | Aliases for vagrant                                               |
| vscode       | Configuration for vscode                                          |
| wm           | Base configuration for uxrvt, xterm and window manager            |
| zsh          | Configuration for zsh and zsh-{autosuggestions,completions}       |

### Options

| Name              | Description                     |
|-------------------|---------------------------------|
| nix:source-nix-sh | Enables loading of nix.sh       |
| nvim:enable-vim   | Enables configuration for vim   |
| nvim:disable-nvim | Disables configuration for nvim |

### Optional binaries

List binaries from `util/opt-bin` in `.localrc` like
```sh
## optional binaries
OPT_BINS=(bin1 bin2)
```

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
