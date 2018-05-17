# originally taken from https://gist.github.com/3noch/79255f8c5ec3c287b91b7484265a89a8

{ lib, writeTextDir, phpPackage, phpPackages, extensions ? [] }:

let

  inherit (builtins) readFile;
  inherit (lib) concatMapStringsSep optionalString;
  inherit (lib.versions) majorMinor;

  includePackage = directive: packageName:
    "${directive} = ${phpPackages.${packageName}}/lib/php/extensions/${packageName}.so";

  defaultPhpIni = readFile "${phpPackage}/etc/php.ini";

  phpIni = ''
    ${defaultPhpIni}

    ${optionalString (majorMinor phpPackage.version == "5.5") ''
      ; WARNING: Be sure to load opcache *before* xdebug (http://us3.php.net/manual/en/opcache.installation.php).
      zend_extension = "${phpPackage}/lib/php/extensions/opcache.so"
    ''}

    ${concatMapStringsSep "\n" (includePackage "extension") (extensions)}

    error_reporting = E_ALL
    display_errors  = On
  '';

in

writeTextDir "php.ini" phpIni