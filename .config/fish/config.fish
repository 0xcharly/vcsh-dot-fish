if status is-interactive
    set fish_greeting # Disable greeting message.

    test -x /opt/homebrew/bin/brew && eval (/opt/homebrew/bin/brew shellenv)
    test -d $HOME/.local/bin && fish_add_path $HOME/.local/bin

    set -Ux BAT_THEME Enki-Tokyo-Night

    # Set if your term supports `pipenv shell --fancy`.
    set pipenv_fish_fancy yes

    function fish_mode_prompt
    end

    function fish_prompt
        set -l prompt_symbol '❯'
        fish_is_root_user; and set prompt_symbol '#'
        set_color brwhite
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
