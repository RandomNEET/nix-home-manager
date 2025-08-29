{ opts, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = opts.ssh.matchBlocks;
  };
  services.ssh-agent.enable = opts.ssh.agent.enable && !opts.gpg.agent.enableSshSupport;
}
