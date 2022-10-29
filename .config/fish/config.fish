if status is-interactive
    set fish_greeting # Disable greeting message.

    test -x /opt/homebrew/bin/brew && eval (/opt/homebrew/bin/brew shellenv)
    test -d $HOME/.local/bin && fish_add_path $HOME/.local/bin

    set -gx EDITOR (which nvim)
    set -gx VISUAL $EDITOR
    set -gx SUDO_EDITOR $EDITOR

    set -Ux BAT_THEME TwoDark
    set -Ux FZF_DEFAULT_OPTS '--color=fg:#abb2bf,bg:#21252b,hl:#61afef --color=fg+:#abb2bf,bg+:#21252b,hl+:#61afef --color=info:#e5c07b,prompt:#e06c75,pointer:#e06c75 --color=marker:#98c379,spinner:#c678dd,header:#56b6c2'
    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin $PATH $HOME/.ghcup/bin # ghcup-env

    set -Ux HOMEBREW_NO_AUTO_UPDATE 1
    set -Ux MANPAGER "nvim +Man!"

    # Set if your term supports `pipenv shell --fancy`.
    set pipenv_fish_fancy yes

    bind \cf ~/.local/bin/open-tmux-workspace
    bind -M insert \cf ~/.local/bin/open-tmux-workspace

    function fish_mode_prompt
    end

    function fish_prompt
        set -l prompt_symbol '❯'
        fish_is_root_user; and set prompt_symbol '#'
        set_color brblack
        echo -n (date "+%H:%M:%S") (format_pwd) (set_color blue)
        echo -n $prompt_symbol (set_color normal)
    end

    function format_pwd
        set -l pwd (pwd)
        set -l whoami (whoami)
        string match -rq "/google/src/cloud/$whoami/(?<citc_space>[a-zA-Z0-9_-]+)/google3" (pwd)
        if test -n "$citc_space"
            # Rename the current tab.
            title $citc_space

            # Echo the citc space name.
            set_color brwhite
            echo -n "("
            set_color blue
            echo -n citc
            set_color brwhite
            echo -n ":"
            set_color green
            echo -n $citc_space
            set_color brwhite
            echo -n ")"
        else
            set_color brgreen
            echo (prompt_pwd)
        end
    end
end
