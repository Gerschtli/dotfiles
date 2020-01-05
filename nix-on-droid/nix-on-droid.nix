{ pkgs, ... }:

{
  environment.etcBackupExtension = ".nod-bak";

  home-manager = {
    config = import "${builtins.getEnv "HOME"}/.config/nixpkgs/home.nix";

    useUserPackages = true;
  };

  system.stateVersion = "19.09";
}
