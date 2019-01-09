with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "atom-php";

  buildInputs = [
    nodejs-11_x
    php
    phpPackages.composer
  ];
}
