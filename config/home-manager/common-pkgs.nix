{ pkgs, ... }:
let
  minimalPackages = with pkgs; [
    # Development
    ## Nix
    libiconv # Needed to build nil
    nixfmt-rfc-style
    ## Lua
    lua
    ## Python
    python3
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
    ## ZSH
    zsh
    zoxide
    fzf
    fd
    eza
    bat
    oh-my-posh
  ];
in
{
  minimalPackages = minimalPackages;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  packages =
    with pkgs;
    [
      # Development
      ## Go
      go
      ## Rust
      rustup
      ## Web
      nodejs_22
      # System tools
      ## Main machines
      e2fsprogs
      ffmpeg
    ]
    ++ minimalPackages;
}
