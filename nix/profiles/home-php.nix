let

  nixpkgs = import <nixpkgs> {};

in

with nixpkgs; let

  modules = {
    vagrant = import modules/vagrant.nix { inherit nixpkgs; };
  };


  name = "home-php";

  packages = with modules; [
    php71
  ] ++ vagrant.packages;

in

import util/mkDerivation.nix { inherit stdenv name packages; }
