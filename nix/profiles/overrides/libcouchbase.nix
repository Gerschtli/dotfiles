{ fetchFromGitHub, lib, libcouchbase }:

let

  inherit (lib) overrideDerivation;

  new-libcouchbase = overrideDerivation libcouchbase (old: rec {
    name    = "libcouchbase-${version}";
    version = "2.7.6";

    src = fetchFromGitHub {
      owner  = "couchbase";
      repo   = "libcouchbase";
      rev    = version;
      sha256 = "13g7r0mcmrj37mihj6g1x1ckpaps659c4qwnw3ixrg7p5mb3p41f";
    };
  });

in

new-libcouchbase
