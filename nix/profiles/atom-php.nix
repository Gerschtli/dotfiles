with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "atom-php";

  buildInputs = [
    php
    phpPackages.composer
  ];
}
