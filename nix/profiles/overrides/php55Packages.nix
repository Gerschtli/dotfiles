{ callPackage, lib, php55 }:

let

  inherit (lib) overrideDerivation;

  php55Packages = (callPackage <nixpkgs/pkgs/top-level/php-packages.nix> {
    php = php55;
  }) // { recurseForDerivations = true; };

  memcache = overrideDerivation php55Packages.memcache (old: {
    makeFlags = old.makeFlags ++ [ "CFLAGS=-fgnu89-inline" ];
  });

in

php55Packages // { inherit memcache; }
