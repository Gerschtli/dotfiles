# originally taken from https://gist.github.com/3noch/79255f8c5ec3c287b91b7484265a89a8

{ lib
, writeTextDir
, phpPackage
, phpPackages
, opCache        ? false
, showErrors     ? true
, extensions     ? []
}:

let

  inherit (builtins) readFile;
  inherit (lib) concatMapStringsSep optionalString;

  includePackage = directive: packageName: "${directive} = ${phpPackages.${packageName}}/lib/php/extensions/${packageName}.so";

  defaultPhpIni = readFile "${phpPackage}/etc/php.ini";

  phpIni = ''
    ${defaultPhpIni}

    ${optionalString opCache ''
      ; WARNING: Be sure to load opcache *before* xdebug (http://us3.php.net/manual/en/opcache.installation.php).
      zend_extension = "${phpPackage}/lib/php/extensions/opcache.so"
    ''}

    ${concatMapStringsSep "\n" (includePackage "extension") (extensions)}

    ${optionalString showErrors ''
      error_reporting = E_ALL
      display_errors  = On
    ''}
  '';

in

writeTextDir "php.ini" phpIni
