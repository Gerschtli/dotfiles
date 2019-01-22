# virtualbox must be installed globally by the default package manager

with import <nixpkgs> { };

let
  extensions = [
    "apcu"
    "igbinary" # needs to be before couchbase
    "couchbase"
    "memcache"
    "memcached"
  ];
in

stdenv.mkDerivation {
  name = "work-php";

  buildInputs = [
    ant
    gitAndTools.overcommit
    jdk
    nodejs-6_x
    php55
    php55Packages.composer
    ruby
    vagrant
  ] ++ (map (ext: php55Packages.${ext}) extensions);

  PHPRC = import ./util/phpIni.nix {
    inherit extensions lib writeTextDir;
    phpPackage  = php55;
    phpPackages = php55Packages;
  };
}
