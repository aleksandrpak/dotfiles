{ ... }:
{ pkgs, ... }:
{
  system.defaults.dock.persistent-apps = [
    "/Applications/Google Chrome.app"
    "/Applications/Safari.app"
    "/Applications/WezTerm.app"
    "/Users/alekspak/Applications/Chrome Apps.localized/Cider V.app"
    "${pkgs.vscode}/Applications/Visual Studio Code.app"
    "${pkgs.obsidian}/Applications/Obsidian.app"
    "/Applications/Telegram.app"
    "/Applications/TickTick.app"
    "/System/Applications/System Settings.app"
  ];
}