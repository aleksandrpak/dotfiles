{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  packages = with pkgs; [
    # Development
    ## Nix
    nil
    nixfmt-rfc-style
    ## Lua
    lua
    lua-language-server
    stylua
    # Bash
    shellcheck
    shellharden
    shfmt
    ## Go
    go
    delve
    gotools
    gopls
    gofumpt
    golines
    ## Web
    nodejs_22
    ## Rust
    rustup
    ## Python
    python3
    black
    pyright
    ## Beancount
    beancount-language-server
    ## Markdown
    mdformat
    markdownlint-cli
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
