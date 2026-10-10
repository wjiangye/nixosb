{ config, pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "dur_file";
      full_color = true;
      dur_file_path = "etc/ly/fondodur.dur";
      dur_offset_alignment = "center";
      animation_frame_delay = 5;
    };
  };

  environment.etc."ly/fondodur.dur".source = ./fondodur.dur;

}
