{ opts, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = false;
      desktop = opts.xdg.userDirs.desktop or "$HOME/dsk";
      documents = opts.xdg.userDirs.documents or "$HOME/doc";
      download = opts.xdg.userDirs.download or "$HOME/pic";
      music = opts.xdg.userDirs.music or "$HOME/mus";
      pictures = opts.xdg.userDirs.pictures or "$HOME/pic";
      publicShare = opts.xdg.userDirs.publicShare or "$HOME/pub";
      templates = opts.xdg.userDirs.templates or "$HOME/tpl";
      videos = opts.xdg.userDirs.videos or "$HOME/vid";
    };
  };
}
