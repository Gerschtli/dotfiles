{ package, rev, sha256 }:

{ callPackage, fetchFromGitHub }:

let

  # use 8u144
  customNixpkgs = callPackage (fetchFromGitHub {
    inherit rev sha256;
    owner = "NixOS";
    repo  = "nixpkgs";
  }) { };

in

customNixpkgs.${package}
