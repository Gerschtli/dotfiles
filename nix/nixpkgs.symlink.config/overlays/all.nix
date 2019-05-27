self: super:

{
  all-ubuntu = super.buildEnv {
    name = "all-ubuntu";

    paths = with self; [
      atom
      # avocode
      direnv
      docker_compose
      dunst
      dwm-status
      # eclipses.eclipse-sdk
      fzf
      httpie
      jetbrains.idea-ultimate
      jq
      mysql-workbench
      playerctl
      postman
      qpdfview
      ripgrep
      rxvt_unicode-with-plugins
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
