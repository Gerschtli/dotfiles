self: super:

{
  php55 = super.php56.overrideDerivation (old: rec {
    name = "php-${version}";
    version = "5.5.38";

    src = super.fetchurl {
      url = "http://www.php.net/distributions/php-${version}.tar.bz2";
      sha256 = "0f1y76whg6yx9a18mh97f8yq8lb64ri1f0zfr9la9374nbmq2g27";
    };
  });
}
