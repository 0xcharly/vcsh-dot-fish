if status is-interactive
  set fish_greeting # Disable greeting message.
  eval (/opt/homebrew/bin/brew shellenv)
  fish_add_path $HOME/.local/bin

  set -Ux BAT_THEME Catppuccin-mocha

  function fish_mode_prompt; end
end
