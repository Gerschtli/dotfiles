import util/mkDerivation.nix {
  name = "work-php";

  configuration = {
    ant     = { };
    nodejs  = { };
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
