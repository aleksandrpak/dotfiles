source ~/.config/nvim/plugins.vim

source ~/.config/nvim/settings.vim

if !empty(glob("~/.config/nvim/google.vim"))
    source ~/.config/nvim/google.vim
endif

source ~/.config/nvim/more_settings.vim

source ~/.config/nvim/functions.vim

source ~/.config/nvim/plugins_settings.vim

call ApplyLocalSettings(expand('.'))
