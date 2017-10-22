{ callPackage, extensions ? [], php71, php71Packages }:

callPackage util/php.nix {
  inherit extensions;
  php         = php71;
  phpPackages = php71Packages;
}
