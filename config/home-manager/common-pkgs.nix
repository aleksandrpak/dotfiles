{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  packages = with pkgs; [
    # Development
    ## Nix
    libiconv # Needed to build nil
    nixfmt-rfc-style
    ## Go
    go
    ## Rust
    rustup
    ## Python
    python3
    ## Lua
    lua
    ## Markdown
    glow
    ## Web
    nodejs_22
    ## IDE
    neovim
    ripgrep
    gnumake
    gcc
    ## Version control
    gh
    delta
    # System tools
    btop
    file
    fx
    tldr
    tmux
    wget
    ## Main machines
    e2fsprogs
    ffmpeg
    ## ZSH
    zsh
    zoxide
    fzf
    fd
    eza
    bat
    oh-my-posh
  ];
}
