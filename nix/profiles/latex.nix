let

  nixpkgs = import <nixpkgs> {};

in

with nixpkgs; let

  name = "latex";

  packages = [
    texlive.combined.scheme-full
  ];

in

import util/mkDerivation.nix { inherit stdenv name packages; }
