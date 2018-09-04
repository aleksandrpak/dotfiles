source ~/.config/nvim/plugins.vim

source ~/.config/nvim/settings.vim

if !empty(glob("/usr/share/vim/google/google.vim"))
    source /usr/share/vim/google/google.vim
    Glug youcompleteme-google
endif

source ~/.config/nvim/more_settings.vim

source ~/.config/nvim/functions.vim

source ~/.config/nvim/plugins_settings.vim

call ApplyLocalSettings(expand('.'))
