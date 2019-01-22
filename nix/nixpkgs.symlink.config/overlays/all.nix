self: super:

{
  all-ubuntu = super.buildEnv {
    name = "all-ubuntu";

    paths = with self; [
      avocode
      docker-compose
      dwm-status
      fzf
      gitAndTools.overcommit
      httpie
      jq
      playerctl
      qpdfview
      ripgrep
      rxvt_unicode-with-plugins
      soapui
    ];
  };

  all-wsl = super.buildEnv {
    name = "all-wsl";

    paths = with self; [
      fzf
      gitAndTools.gitFull
      htop
      openssh
      ripgrep
      tig
      tmux
      tree
      zsh
    ];
  };
}
