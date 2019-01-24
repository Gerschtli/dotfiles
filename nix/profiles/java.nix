with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "java";

  buildInputs = [
    gitAndTools.overcommit
    maven
    ruby
  ];
}
