{ callPackage, extensions, php55, php55Packages }:

let

  environmentVariables = {
    PHPRC = callPackage ../util/phpIni.nix {
      phpPackage  = php55;
      phpPackages = php55Packages;
      opCache     = true;
      extensions  = extensions;
    };
  };

  packages = [
    php55
  ] ++ (map (ext: php55Packages.${ext}) extensions);

in

{ inherit packages environmentVariables; }
