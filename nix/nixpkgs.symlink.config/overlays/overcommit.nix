# FIXME: remove when https://github.com/NixOS/nixpkgs/pull/54263 got merged

self: super:

let
  # PR branch to add overcommit
  pkgs = let
    pinnedPkgs = super.fetchFromGitHub {
      owner = "Gerschtli";
      repo = "nixpkgs";
      rev = "95f95bf8e7b2f1f6398b58a57ae5907e65f0723f";
      sha256 = "0n2azx7jpz9b9lvm5fmhiyqlx4a6zs382n4fywqr2fmk4k30jsv1";
    };
  in import pinnedPkgs { overlays = []; };
in

{
  gitAndTools = (super.gitAndTools or {}) // {
    inherit (pkgs.gitAndTools) overcommit;
  };
}
