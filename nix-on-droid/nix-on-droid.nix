{ pkgs, config, lib, ... }:

let
  homeDir = builtins.getEnv "HOME";
  homeFile = "${homeDir}/.config/nixpkgs/home.nix";
in

{
  environment.etcBackupExtension = ".nod-bak";

  environment.packages = with pkgs; [
    gnutar
    gzip
  ];

  home-manager = lib.mkMerge [
    {
      backupFileExtension = "hm-bak";
      config = import homeFile;
      useUserPackages = true;
    }
    {
      config.nixpkgs = {
        inherit (config.nixpkgs) overlays;
      };
    }
  ];

  system.stateVersion = "19.09";

  time.timeZone = "Europe/Berlin";
}
