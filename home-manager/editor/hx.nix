{
  config,
  pkgs,
  ...
}:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "everforest_dark";

      editor = {
        line-number = "relative";
        mouse = false;
        cursorline = true;
        bufferline = "multiple";

        indent-guides.render = true;

        cursor-shape= {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        lsp.display-messages = true;
        
      };
    };
    
    extraPackages = with pkgs; [
      nixfmt
    ];

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
  };
}
