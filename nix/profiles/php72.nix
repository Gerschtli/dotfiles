# virtualbox must be installed globally by the default package manager

with import <nixpkgs> { };

let
  extensions = [
    "apcu" # needs to be before apcu_bc
    "apcu_bc"
    "igbinary" # needs to be before couchbase
    "couchbase"
  ];
in

stdenv.mkDerivation {
  name = "php72";

  buildInputs = [
    ant
    gitAndTools.overcommit
    jdk
    nodejs-8_x
    php72
    php72Packages.composer
    ruby
    vagrant
  ] ++ (map (ext: php72Packages.${ext}) extensions);

  PHPRC = import ./util/phpIni.nix {
    inherit extensions lib writeTextDir;
    phpPackage  = php72;
    phpPackages = php72Packages;
  };
}
