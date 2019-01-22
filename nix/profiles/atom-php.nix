with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "atom-php";

  buildInputs = [
    nodejs-11_x
    php
    phpPackages.composer
  ];

  PHPRC = import ./util/phpIni.nix {
    inherit lib writeTextDir;
    phpPackage   = php;
    phpPackages  = phpPackages;
    enableXdebug = true;
  };
}
