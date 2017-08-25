{ nixpkgs }:

let

  inherit (nixpkgs.lib) callPackageWith;

  pkgs = nixpkgs // overrides;

  callPackage = callPackageWith pkgs;

  overrides = {
    libcouchbase  = callPackage ./libcouchbase.nix { };
    oraclejdk8    = callPackage ./oraclejdk8.nix { };
    php55         = callPackage ./php55.nix { };
    php55Packages = callPackage ./php55Packages.nix { inherit pkgs; };
  };

in

pkgs
