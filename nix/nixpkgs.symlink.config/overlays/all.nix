self: super:

{
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
