{ nixpkgs }:

with nixpkgs;

let

  php55 = pkgs.lib.overrideDerivation pkgs.php56 (old: rec {
    version = "5.5.38";
    name = "php-${version}";
    src = fetchurl {
      url = "http://www.php.net/distributions/php-${version}.tar.bz2";
      sha256 = "473c81ebb2e48ca468caee031762266651843d7227c18a824add9b07b9393e38";
    };
  });

in

php55
