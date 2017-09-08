import util/mkDerivation.nix {
  name = "work-php";

  configuration = {
    ant     = { };
    nodejs  = { version = 6; };
    php55   = {
      extensions = [
        "apcu"
        "couchbase"
        "memcache"
        "memcached"
      ];
    };
    vagrant = { };
  };
}
