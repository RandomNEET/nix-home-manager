{
  lib,
  pkgs,
  opts,
  ...
}:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        overrideGpg = true;
      };
    }
    // lib.optionalAttrs ((opts.theme or "") != "") {
      gui = import ./themes/${opts.theme}.nix { inherit pkgs; };
    };
  };

  home.shellAliases = {
    lg = "lazygit";
  };
}
