# Dotfiles

## Modules

| Name         | Description                      |
| ------------ | -------------------------------- |
| atom         | Configuration for atom           |
| eclipse      | Configuration for eclipse        |
| home-manager | Configuration for home manager   |
| i3           | Configuration for i3             |
| intellij     | Configuration for intellij       |
| sublime      | Configuration for sublime text 3 |
| vscode       | Configuration for vscode         |

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

## Update

```bash
$ dotupdate
```
