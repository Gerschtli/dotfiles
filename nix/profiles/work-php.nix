let

  nixpkgs = import ./overrides { nixpkgs = import <nixpkgs> { }; };

  self = rec {
    name = "work-php";

    callPackage = nixpkgs.lib.callPackageWith (nixpkgs // self);

    modules = {
      ant     = callPackage modules/ant.nix { };
      nodejs  = callPackage modules/nodejs.nix { };
      php55   = callPackage modules/php55.nix { extensions = phpExtensions; };
      vagrant = callPackage modules/vagrant.nix { };
    };

    phpExtensions = [
      "apcu"
      "memcache"
      "memcached"
    ];

    drv = callPackage util/mkDerivation.nix {
      environmentVariables = { inherit (modules.php55) PHPRC; };
    };
  };

in

self.drv
