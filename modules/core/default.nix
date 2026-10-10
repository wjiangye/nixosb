{
  config,
  pkgs,
  pkgs-stable,
  hostname,
  ...
}:

{

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 7;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [
    vim
    git
    tree
    curl
    wget
    unzip
    zip
    
    pkgs-stable.dnsutils
    pkgs-stable.pciutils
    pkgs-stable.usbutils
    
    psmisc
    file
  ];

  services.udisks2.enable = true;
  services.gvfs.enable = true;

}
