# FIXME: remove when https://github.com/NixOS/nixpkgs/pull/52982 got merged

self: super:

let
  # PR branch to update dwm-status to 1.6.0
  pkgs = import ./util/pinned-pkgs.nix {
    inherit (super) fetchFromGitHub;

    owner = "Gerschtli";
    rev = "6621b92ad145568c57bfaf7b339bba6b65b1001b";
    sha256 = "1f507lvnik2n8naz6hchf8vbj6x5sc4nyhawi949bhw21b6ycd3v";
  };
in

{ inherit (pkgs) dwm-status; }
