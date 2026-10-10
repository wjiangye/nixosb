{
  config,
  lib,
  pkgs,
  pkgs-stable,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 5;
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "es_ES.UTF-8";
  console = {
    enable = true;
    keyMap = "es";
    useXkbConfig = false;
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
    ];
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    nixfmt-tree

    brightnessctl
    lm_sensors
    proton-vpn
  ];

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    libinput.enable = true;
    fwupd.enable = true;
  };

  system.stateVersion = "26.11";

}
