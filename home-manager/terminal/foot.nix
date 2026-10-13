{
  config,
  pkgs,
  ...
}:

{

  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Hurmit Nerd Font:size=10";
      };

    };
  };
}
