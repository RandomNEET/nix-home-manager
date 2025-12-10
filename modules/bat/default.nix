{ lib, opts, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "plain";
    }
    // lib.optionalAttrs ((opts.theme or "") == "catppuccin-mocha") {
      theme = "Catppuccin Mocha";
    };
  };
}
