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
  ];
}
