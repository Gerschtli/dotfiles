import util/mkDerivation.nix {
  name = "work-php";

  configuration = {
    ant      = { };
    composer = { };
    nodejs   = { };
    php55    = {
      extensions = [
        "apcu"
        "couchbase"
        "memcache"
        "memcached"
      ];
    };
    vagrant  = { };
  };
}
