{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;

let

  name = "work-php";

  modules = {
    php55 = import modules/php55.nix { inherit nixpkgs; extensions = phpExtensions; };
    vagrant = import modules/vagrant.nix { inherit nixpkgs; };
  };

  phpExtensions = [
    "apcu"
    "memcache"
    "memcached"
  ];

in

import util/mkDerivation.nix {
  inherit stdenv name modules;
  environmentVariables = { inherit (modules.php55) PHPRC; };
}
