if status is-interactive
  set fish_greeting # Disable greeting message.
  eval (/opt/homebrew/bin/brew shellenv)
  fish_add_path $HOME/.local/bin

  # Github Color Palette
  set -l foreground adbac7
  set -l selection 2e4c77
  set -l comment 768390
  set -l red ff938a
  set -l blue 6cb6ff
  set -l orange f69d50
  set -l yellow daaa3f
  set -l green 6bc46d
  set -l purple dcbdfb
  set -l cyan 76e3ea
  set -l pink fc8dc7

  # Syntax Highlighting Colors
  set -g fish_color_normal $foreground
  set -g fish_color_command $green
  set -g fish_color_keyword $red
  set -g fish_color_quote $cyan
  set -g fish_color_redirection $foreground
  set -g fish_color_end $orange
  set -g fish_color_error $red
  set -g fish_color_param $purple
  set -g fish_color_comment $comment
  set -g fish_color_selection --background=$selection
  set -g fish_color_search_match --background=$selection
  set -g fish_color_operator $green
  set -g fish_color_escape $pink
  set -g fish_color_autosuggestion $comment

  # Completion Pager Colors
  set -g fish_pager_color_progress $comment
  set -g fish_pager_color_prefix $cyan
  set -g fish_pager_color_completion $foreground
  set -g fish_pager_color_description $comment

  function fish_mode_prompt; end
end
