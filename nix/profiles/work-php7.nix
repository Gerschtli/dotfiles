# virtualbox must be installed globally by the default package manager

with import <nixpkgs> { };

let
  apcu = php72Packages.buildPecl {
    name = "apcu-5.1.11";
    sha256 = "0nz9m3fbxgyc2ij63yqmxm06a1f51g8rkxk85f85ziqdin66q2f1";
    buildInputs = [ pcre ];
    doCheck = true;
    checkTarget = "test";
    checkFlagsArray = ["REPORT_EXIT_STATUS=1" "NO_INTERACTION=1"];

    makeFlags = [ "phpincludedir=$(dev)/include" ];

    outputs = [ "out" "dev" ];
  };

  apcu_bc = php72Packages.buildPecl {
    name = "apcu_bc-1.0.4";
    sha256 = "1raww7alwayg9nk0akly1mdrjypxlwg8safnmaczl773cwpw5cbw";
    buildInputs = [ apcu pcre ];
  };

  php72Packages_ = php72Packages // { inherit apcu apcu_bc; };

  extensions = [
    "apcu" # needs to be before apcu_bc
    "apcu_bc"
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
    php72Packages_.composer
    vagrant
  ] ++ (map (ext: php72Packages_.${ext}) extensions);

  PHPRC = import ./util/phpIni.nix {
    inherit extensions lib writeTextDir;
    phpPackage  = php72;
    phpPackages = php72Packages_;
  };
}
