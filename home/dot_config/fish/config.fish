# Preferred editor for terminal programs.
set -gx EDITOR nvim
set -gx VISUAL nvim

# Paths currently configured in this machine's fish_user_paths.
fish_add_path --global $HOME/.local/bin $HOME/.config/kaku/fish/bin

# Initialize Homebrew before loading its Fish completions.
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if type -q brew
    eval (brew shellenv)
end

if type -q brew
    set -l brew_prefix (brew --prefix)
    if test -d $brew_prefix/share/fish/completions
        set -p fish_complete_path $brew_prefix/share/fish/completions
    end
    if test -d $brew_prefix/share/fish/vendor_completions.d
        set -p fish_complete_path $brew_prefix/share/fish/vendor_completions.d
    end
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end
end
