# originally taken from https://gist.github.com/3noch/79255f8c5ec3c287b91b7484265a89a8

{ pkgs           ? import <nixpkgs> {}
, phpPackage     ? pkgs.php
, phpPackages    ? pkgs.phpPackages
, opCache        ? false
, showErrors     ? false
, extensions     ? []
, zendExtensions ? []
, extraConfig    ? ""
}:
let
  includePackage = directive: packageName: "${directive} = ${phpPackages.${packageName}}/lib/php/extensions/${packageName}.so";

  defaultPhpIni = builtins.readFile "${phpPackage}/etc/php.ini";

  phpIni = ''
    ${defaultPhpIni}

    ${pkgs.lib.optionalString opCache ''
      ; WARNING: Be sure to load opcache *before* xdebug (http://us3.php.net/manual/en/opcache.installation.php).
      zend_extension = "${phpPackage}/lib/php/extensions/opcache.so"
    ''}

    ${pkgs.lib.concatMapStringsSep "\n" (includePackage "extension")      (extensions)}
    ${pkgs.lib.concatMapStringsSep "\n" (includePackage "zend_extension") (zendExtensions)}

    ${pkgs.lib.optionalString showErrors ''
      error_reporting = E_ALL
      display_errors  = On
    ''}

    ${extraConfig}
  '';
in
pkgs.writeTextDir "php.ini" phpIni
