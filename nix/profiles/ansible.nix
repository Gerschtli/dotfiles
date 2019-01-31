with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "ansible";

  buildInputs = [
    ansible
    gitAndTools.overcommit
    ruby
  ];
}
