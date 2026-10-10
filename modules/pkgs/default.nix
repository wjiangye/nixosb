{
  config,
  pkgs,
  pkgs-stable,
  ...
}:

{

  programs.virt-manager.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    btop
    nvtopPackages.amd
    yazi
    w3m

    eza
    bat
    ripgrep
    fd
    fzf
    jq

    fastfetch
    wl-clipboard
    cliphist
    grim
    slurp

    librewolf
    pkgs-stable.libreoffice
    pkgs-stable.kdePackages.okular
    vlc

    llama-cpp-vulkan
    ffmpeg

  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  services.flatpak.enable = true;

}
