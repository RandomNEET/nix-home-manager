rec {
  username = "howl";
  userpasswd = "$6$.FVrKngH1eXjNYi9$lsTAUQvvJyB209fhkf3g5E12iCcgNdDZKW0XTwCp7i3lNwM8gjNq3kRgjW4WIBV68YETysoDCHhKtSIncPT3n1";
  editor = "nvim";
  terminal = "kitty";
  terminalFileManager = "yazi";
  browser = "firefox";
  emailClient = "thunderbird";
  xdg = {
    userDirs = {
      desktop = null; # null or "$HOME/dsk"
      documents = "$HOME/doc";
      download = "$HOME/dls";
      music = "$HOME/mus";
      pictures = "$HOME/pic";
      publicShare = "$HOME/pub";
      templates = "$HOME/tpl";
      videos = "$HOME/vid";
    };
  };

  ssh = {
    dir = "/home/${username}/.vault/ssh";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${ssh.dir}/gh-randomneet";
        addKeysToAgent = "yes";
      };
      "nasix" = {
        hostname = "192.168.0.56";
        port = 22;
        user = "howl";
        identityFile = "${ssh.dir}/nasix";
        addKeysToAgent = "yes";
      };
    };
    daemon = {
      enable = true;
      ports = [
        22
      ];
      authorizedKeysFiles = [ "${ssh.dir}/dix.pub" ];
      settings = {
        PasswordAuthentication = false;
      };
    };
    agent.enable = false;
  };

  gpg = {
    homedir = "/home/${username}/.gnupg";
    agent = {
      enable = true;
      enableSshSupport = true; # Automatically disable ssh-agent if set to true
    };
  };

  zsh = {
    initContent = '''';

    envExtra = ''
      export VI_MODE_SET_CURSOR=true
      MODE_INDICATOR="%F{red}<<<%f"
    '';

    shellGlobalAliases = {
      G = "| grep";
    };
    shellAliases = {
      update = "home-manager switch --flake /home/${username}/.config/home-manager#${username}";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
      ];
      theme = "simple";
    };
  };

  nixvim = {
    withNodeJs = false;
    withPerl = false;
    withPython3 = true;
    withRuby = false;

    lsp.enable = true;
    treesitter.enable = true; # Automatically disable noice if set to false
    lint.enable = true;
    conform.enable = true;
    copilot.enable = true;
    noice.enable = true; # Require treesitter
    snack = {
      image.enable = true;
    };
    obsidian = {
      workspaces = [
        {
          name = "default";
          path = "~/${obsidian.vaults.default.target}";
        }
        {
          name = "daily";
          path = "~/${obsidian.vaults.default.target}/daily";
          overrides = {
            notes_subdir = "daily";
          };
        }
        {
          name = "develop";
          path = "~/${obsidian.vaults.default.target}/develop";
          overrides = {
            notes_subdir = "develop";
          };
        }
      ];
    };
  };

  git = {
    userName = "RandomNEET";
    userEmail = "dev@randomneet.me";
  };

  obsidian = {
    vaults = {
      default = {
        enable = true;
        target = "doc/obsidian";
      };
    };
  };
}
