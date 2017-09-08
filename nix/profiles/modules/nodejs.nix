{ lib, nodejs-6_x, nodejs-8_x, version ? 6 }:

{
  packages =
    (lib.optional (version == 6) nodejs-6_x)
    ++ (lib.optional (version == 8) nodejs-8_x);
}
