{ ... }:
{ pkgs, ... }:
{
  system.defaults.dock.persistent-apps = [
    "/Applications/Safari.app"
    "/Applications/WezTerm.app"
    "${pkgs.vscode}/Applications/Visual Studio Code.app"
    "${pkgs.obsidian}/Applications/Obsidian.app"
    "/Applications/Telegram.app"
    "/Applications/TickTick.app"
    "/System/Applications/System Settings.app"
  ];
}
