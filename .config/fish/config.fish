if status is-interactive
    set fish_greeting # Disable greeting message.

    test -x /opt/homebrew/bin/brew && eval (/opt/homebrew/bin/brew shellenv)
    test -d $HOME/.local/bin && fish_add_path $HOME/.local/bin

    set -gx EDITOR (which nvim)
    set -gx VISUAL $EDITOR
    set -gx SUDO_EDITOR $EDITOR

    set -Ux BAT_THEME TwoDark
    set -e FZF_DEFAULT_OPTS
    set -Ux FZF_DEFAULT_OPTS " --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
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
        echo -n (date "+%H:%M:%S") (format_pwd) (set_color brblue)
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
            set_color white
            echo -n "("
            set_color brblue
            echo -n citc
            set_color white
            echo -n ":"
            set_color brgreen
            echo -n $citc_space
            set_color white
            echo -n ")"
        else
            set_color green
            echo (prompt_pwd)
        end
    end
end
