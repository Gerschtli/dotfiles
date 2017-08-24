{ callPackage, extensions, php, phpPackages }:

let

  environmentVariables = {
    PHPRC = callPackage ../../util/phpIni.nix {
      phpPackage  = php;
      phpPackages = phpPackages;
      extensions  = extensions;
    };
  };

  packages = [
    php
  ] ++ (map (ext: phpPackages.${ext}) extensions);

in

{ inherit packages environmentVariables; }
