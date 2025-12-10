{
  lib,
  pkgs,
  opts,
  ...
}:
{
  home = {
    username = "${opts.username}";
    homeDirectory = "/home/${opts.username}";
    sessionVariables = lib.mkMerge [
      (lib.optionalAttrs ((opts.editor or "") != "") { EDITOR = opts.editor; })
      (lib.optionalAttrs ((opts.terminal or "") != "") { TERMINAL = opts.terminal; })
      (lib.optionalAttrs ((opts.browser or "") != "") { BROWSER = opts.browser; })
    ];
    packages = with pkgs; [ ] ++ builtins.map (name: builtins.getAttr name pkgs) (opts.packages or [ ]);
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;
}
