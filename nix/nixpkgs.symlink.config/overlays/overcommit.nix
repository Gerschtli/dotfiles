# FIXME: remove when https://github.com/NixOS/nixpkgs/pull/54263 got merged

self: super:

let
  # PR branch to add overcommit
  pkgs = let
    pinnedPkgs = super.fetchFromGitHub {
      owner = "Gerschtli";
      repo = "nixpkgs";
      rev = "3c0ce76eea846dd2e03fd65ec10ba9181a19441b";
      sha256 = "0c8mmkalrkk5aaw75b8pzi0gn0zszpmilwznwfd139jvsb6jv3ii";
    };
  in import pinnedPkgs { overlays = []; };
in

{
  gitAndTools = (super.gitAndTools or {}) // {
    inherit (pkgs.gitAndTools) overcommit;
  };
}
