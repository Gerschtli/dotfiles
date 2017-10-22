{ callPackage, extensions ? [], php55, php55Packages }:

callPackage util/php.nix {
  inherit extensions;
  php         = php55;
  phpPackages = php55Packages;
}
