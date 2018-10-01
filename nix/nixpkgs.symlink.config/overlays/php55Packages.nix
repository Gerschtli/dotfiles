self: super:

if super ? "php55"
then
  {
    php55Packages = (super.callPackage <nixpkgs/pkgs/top-level/php-packages.nix> {
      pkgs = self;
      php  = self.php55;
    }) // { recurseForDerivations = true; };
  }
else
  { }
