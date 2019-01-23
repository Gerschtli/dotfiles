with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "integration-test";

  buildInputs = [
    nodejs-11_x
  ];
}
