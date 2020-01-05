{ pkgs, ... }:

{
  environment.etcBackupExtension = ".bak";

  home-manager.config = import "${builtins.getEnv "HOME"}/.config/nixpkgs/home.nix";

  system.stateVersion = "19.09";
}
