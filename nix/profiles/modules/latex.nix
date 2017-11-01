{ texlive }:

{
  packages = [
    (texlive.combine {
      inherit (texlive) scheme-medium collection-langgerman algorithms cm-super;
    })
  ];
}
