{ nixpkgs }:

let

  overrides = rec {
    oraclejdk8 = import ../overrides/oraclejdk8.nix { inherit nixpkgs; };
  };

  packages = [
    nixpkgs.ant
    overrides.oraclejdk8
  ];

in

{ inherit packages; }
