self: super:

let
  path = super.fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs";
    rev    = "5aefcd22a5514400ccaedb50ddc664c0d13eee1e";
    sha256 = "060jjhfl33458nw60g6srgjb3pv3nd69lzi9g5xrcdkd8fcdi60x";
  };

  libcouchbase = (import path { overlays = []; }).libcouchbase;

  php55Packages = (super.callPackage "${path}/pkgs/top-level/php-packages.nix" {
    pkgs = self;
    php  = self.php55;
  }) // { recurseForDerivations = true; };
in

{ inherit libcouchbase php55Packages; }
