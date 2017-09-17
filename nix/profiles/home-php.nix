import util/mkDerivation.nix {
  name = "home-php";

  configuration = {
    nodejs  = { };
    php71   = { };
    vagrant = { };
  };
}
