{ nixpkgs, extensions }:

with nixpkgs;

let

  overrides = rec {
    php55 = import ../overrides/php55.nix { inherit nixpkgs; };
    php55Packages = import ../overrides/php55Packages.nix { inherit nixpkgs; inherit (overrides) php55; };
  };

  PHPRC = import ../util/phpIni.nix {
    phpPackage  = overrides.php55;
    phpPackages = overrides.php55Packages;
    opCache     = true;
    showErrors  = true;
    extensions  = extensions;
  };

  packages = [
    overrides.php55
  ] ++ (map (ext: overrides.php55Packages.${ext}) extensions);

in

{ inherit packages PHPRC; }
