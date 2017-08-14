{ callPackage, fetchFromGitHub }:

let

  # use 8u144
  customNixpkgs = callPackage (fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs";
    rev    = "529f8095646f5d51a3b444a5eaa40ebd726bf46c";
    sha256 = "12xwk5lmdbnprksfg9b0n49qbpl41h6bng236pxwsm3h247wlgrl";
  }) { };

in

customNixpkgs.oraclejdk8
