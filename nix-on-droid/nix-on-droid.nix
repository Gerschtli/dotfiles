{ pkgs, ... }:

{
  environment.etcBackupExtension = ".bak";

  home-manager.config = import ./home.nix;

  system.stateVersion = "19.09";
}
