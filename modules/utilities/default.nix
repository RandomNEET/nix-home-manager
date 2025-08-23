{ pkgs, ... }:
{
  home.packages = with pkgs; [
    _7zz
    ffmpeg
    imagemagick
  ];
}
