let

  nixpkgs = import ./overrides { nixpkgs = import <nixpkgs> { }; };

  self = rec {
    name = "latex";

    callPackage = nixpkgs.lib.callPackageWith (nixpkgs // self);

    modules = {
      latex = callPackage modules/latex.nix { };
    };

    drv = callPackage util/mkDerivation.nix { };
  };

in

self.drv
