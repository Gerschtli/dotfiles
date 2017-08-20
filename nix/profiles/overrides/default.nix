{ nixpkgs }:

let

  callPackage = nixpkgs.lib.callPackageWith (nixpkgs // overrides);

  overrides = {
    libcouchbase  = callPackage ./libcouchbase.nix { inherit (nixpkgs) libcouchbase; };
    oraclejdk8    = callPackage ./oraclejdk8.nix { };
    php55         = callPackage ./php55.nix { };
    php55Packages = callPackage ./php55Packages.nix { };
  };

in

nixpkgs // overrides
