{ lib, opts, ... }:
{
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    icons = "auto";
  }
  // lib.optionalAttrs ((opts.theme or "") != "") {
    theme = opts.theme;
  };
}
