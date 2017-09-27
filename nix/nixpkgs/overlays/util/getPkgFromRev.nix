{ package, rev, sha256, overlays ? true }:

self: super:

let
  nixpkgs = import (super.fetchFromGitHub {
    inherit rev sha256;
    owner = "NixOS";
    repo  = "nixpkgs";
  })
  (if overlays then { overlays = []; } else {});
in

{ ${package} = nixpkgs.${package}; }
