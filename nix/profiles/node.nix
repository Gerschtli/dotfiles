import util/mkDerivation.nix {
  name = "node";

  configuration = {
    nodejs = { version = 8; };
  };
}
