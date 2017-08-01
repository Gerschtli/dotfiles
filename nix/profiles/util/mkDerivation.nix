{ stdenv, name, packages }:

stdenv.mkDerivation {

  inherit name;

  buildInputs = packages;

  NIX_SHELL = name;

}
