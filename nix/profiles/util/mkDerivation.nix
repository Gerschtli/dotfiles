{ stdenv
, name
, packages ? [ ]
, modules ? { }
, environmentVariables ? { }
}:

let

  options = {

    inherit name;

    buildInputs = with builtins;
      concatLists
        (map
          (module: modules.${module}.packages)
          (attrNames modules))
      ++ packages;

    NIX_SHELL = name;

  } // environmentVariables;

in

stdenv.mkDerivation options
