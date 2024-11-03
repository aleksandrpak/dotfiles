{ ... }:
{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Development
    ## Nix
    nixd
    nixfmt-rfc-style
    ## Go
    go
    ## Rust
    rustup
    ## Python
    python3
    ## Lua
    lua
    ## Web
    nodejs_22
    ## IDE
    vim
    neovim
    ripgrep
    gnumake
    gcc
    ## Version control
    gh
    delta
    # System tools
    btop
    e2fsprogs
    ffmpeg
    file
    fx
    tldr
    tmux
    wget
    ## ZSH
    zsh
    fzf
    fd
    eza
    bat
    oh-my-posh
    # GUI
    # TODO: add firefox
    discord
    obsidian
    protonmail-bridge
    vscode
    ## MacOS only
    raycast
    stats
    xcode-install
  ];
}
