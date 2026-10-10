{
  config,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./editor/hx

  ];

  home.username = "${username}";
  home.homeDirectory = "/home/s4yok";

  home.packages = with pkgs; [
    foot
    cmatrix
    quickshell
    siyuan

    nerd-fonts.hurmit
  ];

  programs.helix = {
    enable = true;
  };
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "${username}";
      user.email = "s4yok@nixos.btw";
    };
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      nix-reb = "sudo nixos-rebuild switch --flake /home/s4yok/nixos#nixos-btw";
      nix-pkgs = "nix search nixpkgs";
      nix-grb = "sudo nix-collect-garbage -d";
      llm-serv = "llama serve -hf";
      llm-cli = "llama-cli -hf";
      
    };
      
  };
  
  home.stateVersion = "26.05";
}
