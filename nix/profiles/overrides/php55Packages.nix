{ callPackage, lib, php55 }:

let

  php55Packages = (callPackage <nixpkgs/pkgs/top-level/php-packages.nix> {
    php = php55;
  }) // { recurseForDerivations = true; };

  memcache = lib.overrideDerivation php55Packages.memcache (old: {
    makeFlags = old.makeFlags ++ [ "CFLAGS=-fgnu89-inline" ];
  });

in

php55Packages // { inherit memcache; }
