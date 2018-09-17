# virtualbox must be installed globally by the default package manager

with import <nixpkgs> { };

let
  extensions = [
    "apcu"
    "igbinary" # needs to be before couchbase
    "couchbase"
  ];
in

stdenv.mkDerivation {
  name = "work-php7";

  buildInputs = [
    ant
    jdk
    nodejs-6_x
    php72
    php72Packages.composer
    vagrant
  ] ++ (map (ext: php72Packages.${ext}) extensions);

  PHPRC = import ./util/phpIni.nix {
    inherit extensions lib writeTextDir;
    phpPackage  = php72;
    phpPackages = php72Packages;
  };
}
