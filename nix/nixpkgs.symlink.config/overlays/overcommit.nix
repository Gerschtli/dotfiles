# FIXME: remove when https://github.com/NixOS/nixpkgs/pull/54263 got merged

self: super:

let
  # PR branch to add overcommit
  pkgs = let
    pinnedPkgs = super.fetchFromGitHub {
      owner = "Gerschtli";
      repo = "nixpkgs";
      rev = "25c9f97197b95b9e3fbb53164f2737f1001d1b75";
      sha256 = "14dri05rw1sb967hhl98y2yir78b4m2ijmnkbi4lmxv7rjvavdg2";
    };
  in import pinnedPkgs { overlays = []; };
in

{
  gitAndTools = (super.gitAndTools or {}) // {
    inherit (pkgs.gitAndTools) overcommit;
  };
}
