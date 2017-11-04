{ callPackage, extensions, lib, php, phpPackages }:

let

  # igbinary must be loaded before couchbase
  extensions_ = lib.unique (
    if lib.elem "couchbase" extensions
    then [ "igbinary" ] ++ extensions
    else extensions
  );

  environmentVariables = {
    PHPRC = callPackage ./phpIni.nix {
      phpPackage  = php;
      phpPackages = phpPackages;
      extensions  = extensions_;
    };
  };

  packages = [ php ] ++ (map (ext: phpPackages.${ext}) extensions_);

in

{ inherit packages environmentVariables; }
