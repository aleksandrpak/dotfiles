{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  packages = with pkgs; [
    # Development
    ## Nix
    libiconv # Needed to build nil
    nixfmt-rfc-style
    ## Lua
    lua
    ## Go
    go
    ## Web
    nodejs_22
    ## Rust
    rustup
    ## Python
    python3
    ## Beancount
    beancount-language-server
    ## Markdown
    glow
    ## Version control
    gh
    delta
    ## IDE
    neovim
    ripgrep
    gnumake
    gcc
    # System tools
    btop
    file
    fx
    tldr
    tmux
    wget
    e2fsprogs
    ffmpeg
    mosh
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
