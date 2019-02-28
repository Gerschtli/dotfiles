self: super:

{
  all-ubuntu = super.buildEnv {
    name = "all-ubuntu";

    paths = with self; [
      atom
      avocode
      docker-compose
      dunst
      dwm-status
      fzf
      httpie
      jq
      mysql-workbench
      playerctl
      qpdfview
      ripgrep
      rxvt_unicode-with-plugins
      skype
      slack
      soapui
      xss-lock
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
