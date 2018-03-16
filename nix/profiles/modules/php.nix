{ callPackage, extensions ? [], php, phpPackages }:

callPackage util/php.nix {
  inherit extensions php phpPackages;
}
