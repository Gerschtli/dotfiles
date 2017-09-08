import util/mkDerivation.nix {
  name = "home-php";

  configuration = {
    nodejs  = { version = 6; };
    php71   = { };
    vagrant = { };
  };
}
