{ callPackage, extensions ? [], php55, php55Packages }:

import util/php.nix {
  inherit callPackage extensions;

  php         = php55;
  phpPackages = php55Packages;
}
