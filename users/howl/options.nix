# vim:fileencoding=utf-8:foldmethod=marker
rec {
  username = "howl";
  editor = "nvim";
  terminal = "kitty";
  terminalFileManager = "yazi";
  browser = "qutebrowser";
  theme = "catppuccin-mocha";
  xdg = {
    userDirs = {
      desktop = null;
      documents = "/home/${username}/doc";
      download = "/home/${username}/dls";
      music = "/home/${username}/mus";
      pictures = "/home/${username}/pic";
      publicShare = "/home/${username}/pub";
      templates = "/home/${username}/tpl";
      videos = "/home/${username}/vid";
    };
  };

  # Shell {{{
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
      update = "sudo nixos-rebuild switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
      ];
      theme = "simple";
    };
  };
  # }}}

  # File manager {{{
  yazi = {
    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = [
              "g"
              "d"
            ];
            run = "cd ~/dls";
            desc = "Go ~/dls";
          }
          {
            on = [
              "g"
              "r"
            ];
            run = "cd ~/repo";
            desc = "Go ~/repo";
          }
          {
            on = [
              "g"
              "u"
            ];
            run = "cd /run/media/$USER";
            desc = "Go /run/media/$USER";
          }
        ];
      };
    };
  };
  # }}}

  # Editor {{{
  nixvim = {
    treesitter.enable = true;
    lsp.enable = true;
    conform.enable = true;
    lint.enable = true;

    snacks = {
      image.enable = true;
    };
    noice.enable = true;

    copilot = {
      enable = true;
      cmp = false;
    };
  };
  # }}}

  # Mail {{{
  email = {
    maildirBasePath = ".mail";

    primary = {
      name = "RandomNEET";
      primary = true;
      maildir.path = "/neet";
      address = "neet@randomneet.me";
      userName = "neet@randomneet.me";
      passwordCommand = "pass migadu/neet";
      realName = "RandomNEET";
      gpg = {
        key = "0xBFA119DF465BFBB1";
        signByDefault = true;
        encryptByDefault = false;
      };
      flavor = "migadu.com";

      aerc = {
        enable = true;
        extraAccounts = {
          default = "Inbox";
          folders-sort = "Inbox,Inbox/dev,Inbox/contact,Inbox/selfhost,Inbox/bill,Inbox/cert,Inbox/temp,Archive,Drafts,Sent,Junk,Trash";
          check-mail = "5m";
          check-mail-cmd = "systemctl --user start mbsync.service";
          check-mail-timeout = "30s";
        };
      };

      mbsync = {
        enable = true;
        create = "maildir";
      };
    };
  };

  mbsync = {
    program = {
      groups = {
        inboxes = {
          RandomNEET = [
            "INBOX"
            "INBOX/dev"
            "INBOX/contact"
            "INBOX/selfhost"
            "INBOX/bill"
            "INBOX/cert"
            "INBOX/temp"
          ];
        };
      };
    };
    service = {
      configFile = "/home/${username}/.vault/mail/mbsync/neet";
      notify = {
        enable = true;
        mailDir = "/home/${username}/.mail/neet";
        countFile = "${mbsync.service.notify.mailDir}/.new";
      };
    };
  };
  # }}}

  # Media {{{
  rmpc = {
    config = {
      address = "127.0.0.1:6600";
      password = "None";
      notify = true;
    };
  };
  # }}}

  # Vault {{{
  rbw = {
    settings = {
      base_url = "https://vaultwarden.scaphium.xyz";
      email = "selfhost@randomneet.me";
      lock_timeout = 3600;
    };
  };
  # }}}

  # Misc {{{
  git = {
    settings = {
      user = {
        name = "RandomNEET";
        email = "dev@randomneet.me";
      };
      init = {
        defaultBranch = "master";
      };
      advice = {
        defaultBranchName = false;
      };
    };
  };

  newsboat = {
    browser = "w3m";
  };
  # }}}

  # Package {{{
  packages = [
    "ffmpeg"
    "imagemagick"
    "w3m"
    "lolcat"
    "figlet"
    "fortune"
    "cowsay"
    "asciiquarium-transparent"
    "cbonsai"
    "cmatrix"
    "pipes"
    "tty-clock"
    "cliwt"
  ];
  # }}}
}
