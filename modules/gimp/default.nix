{ pkgs, ... }:
{
  home.packages = with pkgs; [ gimp ];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/x-xcf" = "gimp.desktop";
    };
  };
}
