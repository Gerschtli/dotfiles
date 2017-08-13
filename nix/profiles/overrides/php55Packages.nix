{ nixpkgs, php55 }:

with nixpkgs;

let

  php55Packages = (callPackage "${path}/pkgs/top-level/php-packages.nix" {
    php = php55;
  }) // { recurseForDerivations = true; };

  memcache = pkgs.lib.overrideDerivation php55Packages.memcache (old: {
    makeFlags = old.makeFlags ++ [ "CFLAGS=-fgnu89-inline" ];
  });

in

php55Packages // { inherit memcache; }
