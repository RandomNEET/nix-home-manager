{ opts, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = opts.ssh.matchBlocks;
  };
  services.ssh-agent.enable = opts.ssh.agent.enable && !opts.gpg.agent.enableSshSupport;
}
