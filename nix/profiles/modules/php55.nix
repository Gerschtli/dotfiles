{ php55, php55Packages, extensions }:

let

  PHPRC = import ../util/phpIni.nix {
    phpPackage  = php55;
    phpPackages = php55Packages;
    opCache     = true;
    showErrors  = true;
    extensions  = extensions;
  };

  packages = [
    php55
  ] ++ (map (ext: php55Packages.${ext}) extensions);

in

{ inherit packages PHPRC; }
