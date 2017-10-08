self: super:

{
  php55Packages = (super.callPackage <nixpkgs/pkgs/top-level/php-packages.nix> {
    pkgs = self;
    php  = self.php55;
  }) // { recurseForDerivations = true; };
}
