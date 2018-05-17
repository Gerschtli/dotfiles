with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "atom-python";

  buildInputs = [
    python3
  ];
}
