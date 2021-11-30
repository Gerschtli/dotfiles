# !DEPRECATED! See [nix-config](https://github.com/Gerschtli/nix-config) and [atom-config](https://github.com/Gerschtli/atom-config)

I am transitioning to a flakes-only setup within a mono-repo containing all configs. My atom-config will remain in a
separate repository.

# Dotfiles

The main part of my dotfiles and user environment setup is configured in my
[home-manager-configurations](https://github.com/Gerschtli/home-manager-configurations) project, mounted in
`home-manager/home-manager-configurations`.

## Modules

| Name         | Description                      |
| ------------ | -------------------------------- |
| atom         | Configuration for atom           |
| home-manager | Configuration for home manager   |
| nix-on-droid | Configuration for nix-on-droid   |
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
