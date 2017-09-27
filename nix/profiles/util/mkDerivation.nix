{ name, configuration ? { } }:

let

  nixpkgs = import <nixpkgs> { };

  inherit (builtins) attrNames concatLists foldl' listToAttrs;
  inherit (nixpkgs.lib) callPackageWith concatMap nameValuePair;
  inherit (nixpkgs.stdenv) mkDerivation;

  callPackage = callPackageWith (nixpkgs // { inherit callPackage; });

  modules = listToAttrs
    (concatMap
      (module:
        [
          (nameValuePair
            module
            (callPackage (../modules + "/${module}.nix") (configuration.${module}))
          )
        ]
      )
      (attrNames configuration));

  buildInputs = concatMap
    (module: modules.${module}.packages)
    (attrNames modules);

  environmentVariables = foldl'
    (last: module:
      if   modules.${module} ? environmentVariables
      then last // modules.${module}.environmentVariables
      else last)
    { NIX_SHELL = name; }
    (attrNames modules);

in

mkDerivation (
  { inherit name buildInputs; } // environmentVariables
)
