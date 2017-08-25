{ package, rev, sha256 }:

{ callPackage, fetchFromGitHub }:

let

  customNixpkgs = callPackage (fetchFromGitHub {
    inherit rev sha256;
    owner = "NixOS";
    repo  = "nixpkgs";
  }) { };

in

customNixpkgs.${package}
