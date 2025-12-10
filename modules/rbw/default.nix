{ pkgs, opts, ... }:
{
  programs.rbw = {
    enable = true;
    settings = {
      base_url = opts.rbw.settings.base_url or null;
      email = opts.rbw.settings.email or "";
      identity_url = opts.rbw.settings.identity_url or null;
      lock_timeout = opts.rbw.settings.lock_timeout or 3600;
      pinentry = pkgs.pinentry-curses;
    };
  };
  home.packages = [ pkgs.pinentry-all ];
}
