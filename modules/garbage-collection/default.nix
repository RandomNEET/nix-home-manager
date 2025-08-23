{ ... }:
{
  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "weekly";
    randomizedDelaySec = "30min";
  };
}
