{ callPackage, fetchFromGitHub, lib, libcouchbase, php55, writeText }:

let

  inherit (lib) overrideDerivation;

  php55Packages = (callPackage <nixpkgs/pkgs/top-level/php-packages.nix> {
    php = php55;
  }) // { recurseForDerivations = true; };

  couchbase = php55Packages.buildPecl rec {
    name    = "couchbase-${version}";
    version = "2.3.4";

    buildInputs = [ libcouchbase pcs ];

    src = fetchFromGitHub {
      owner  = "couchbase";
      repo   = "php-couchbase";
      rev    = "v${version}";
      sha256 = "0rdlrl7vh4kbxxj9yxp54xpnnrxydpa9fab7dy4nas474j5vb2bp";
    };

    configureFlags = [ "--with-couchbase" ];

    patches = [
      (writeText "php5-couchbase.patch" ''
        --- a/config.m4
        +++ b/config.m4
        @@ -9,7 +9,7 @@ if test "$PHP_COUCHBASE" != "no"; then
             LIBCOUCHBASE_DIR=$PHP_COUCHBASE
           else
             AC_MSG_CHECKING(for libcouchbase in default path)
        -    for i in /usr/local /usr; do
        +    for i in ${libcouchbase}; do
               if test -r $i/include/libcouchbase/couchbase.h; then
                 LIBCOUCHBASE_DIR=$i
                 AC_MSG_RESULT(found in $i)
      '')
    ];
  };

  memcache = overrideDerivation php55Packages.memcache (old: {
    makeFlags = old.makeFlags ++ [ "CFLAGS=-fgnu89-inline" ];
  });

  pcs = php55Packages.buildPecl rec {
    name    = "pcs-${version}";
    version = "1.3.3";

    sha256 = "0d4p1gpl8gkzdiv860qzxfz250ryf0wmjgyc8qcaaqgkdyh5jy5p";
  };

in

php55Packages // { inherit couchbase memcache; }
