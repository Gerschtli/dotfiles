# Dotfiles

The main part of my dotfiles and user environment setup is configured in my
[home-manager-configurations](https://github.com/Gerschtli/home-manager-configurations) project, mounted in
`home-manager/home-manager-configurations`.

## Modules

| Name         | Description                      |
| ------------ | -------------------------------- |
| atom         | Configuration for atom           |
| eclipse      | Configuration for eclipse        |
| home-manager | Configuration for home manager   |
| i3           | Configuration for i3             |
| intellij     | Configuration for intellij       |
| nix-on-droid | Configuration for nix-on-droid   |
| sublime      | Configuration for sublime text 3 |
| vscode       | Configuration for vscode         |

## Installation

### Clone repo

```bash
$ git clone "https://github.com/Gerschtli/dotfiles.git" ~/.dotfiles
```

### Use of home-manager module

```bash
$ git clone "https://github.com/Gerschtli/home-manager-configurations.git" ~/.dotfiles/home-manager/home-manager-configurations
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
