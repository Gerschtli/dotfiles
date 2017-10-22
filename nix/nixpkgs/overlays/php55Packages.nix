self: super:

let
  php55Packages = (super.callPackage <nixpkgs/pkgs/top-level/php-packages.nix> {
    pkgs = self;
    php  = self.php55;
  }) // { recurseForDerivations = true; };

  couchbase = php55Packages.couchbase.overrideAttrs (old: {
    buildInputs = old.buildInputs ++ [ self.zlib igbinary ];

    patches = [
      (super.writeText "php-couchbase.patch" ''
        --- a/config.m4
        +++ b/config.m4
        @@ -9,7 +9,7 @@ if test "$PHP_COUCHBASE" != "no"; then
             LIBCOUCHBASE_DIR=$PHP_COUCHBASE
           else
             AC_MSG_CHECKING(for libcouchbase in default path)
        -    for i in /usr/local /usr; do
        +    for i in ${self.libcouchbase}; do
               if test -r $i/include/libcouchbase/couchbase.h; then
                 LIBCOUCHBASE_DIR=$i
                 AC_MSG_RESULT(found in $i)
        @@ -154,6 +154,8 @@ COUCHBASE_FILES=" \
             igbinary_inc_path="$phpincludedir"
           elif test -f "$phpincludedir/ext/igbinary/igbinary.h"; then
             igbinary_inc_path="$phpincludedir"
        +  elif test -f "${igbinary.dev}/include/ext/igbinary/igbinary.h"; then
        +    igbinary_inc_path="${igbinary.dev}/include"
           fi
           if test "$igbinary_inc_path" = ""; then
             AC_MSG_WARN([Cannot find igbinary.h])
      '')
    ];
  });

  igbinary = php55Packages.buildPecl {
    name = "igbinary-2.0.4";

    configureFlags = [ "--enable-igbinary" ];

    makeFlags = [ "phpincludedir=$(dev)/include" ];

    outputs = [ "out" "dev" ];

    sha256 = "0a55l4f0bgbf3f6sh34njd14niwagg829gfkvb8n5fs69xqab67d";
  };
in

{
  php55Packages = php55Packages // {
    inherit couchbase igbinary;
  };
}
