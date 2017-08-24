{ callPackage, extensions ? [], php71, php71Packages }:

import util/php.nix {
  inherit callPackage extensions;

  php         = php71;
  phpPackages = php71Packages;
}
