{ callPackage, fetchFromGitHub, php55, pkgs }:

let

  path = fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs";
    rev    = "5aefcd22a5514400ccaedb50ddc664c0d13eee1e";
    sha256 = "060jjhfl33458nw60g6srgjb3pv3nd69lzi9g5xrcdkd8fcdi60x";
  };

  php55Packages = (callPackage "${path}/pkgs/top-level/php-packages.nix" {
    inherit pkgs;
    php = php55;
  }) // { recurseForDerivations = true; };

in

php55Packages
