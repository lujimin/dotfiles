# Preferred editor for terminal programs.
set -gx EDITOR nvim
set -gx VISUAL nvim

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
    # Use an e prefix to keep Fish defaults and other tool names available.
    # Abbreviations expand visibly and only affect interactive input.
    if type -q eza
        if not type -q el; and not abbr --query el
            abbr --add el 'eza --icons=auto --group-directories-first'
        end
        if not type -q ell; and not abbr --query ell
            abbr --add ell 'eza --long --header --icons=auto --group-directories-first'
        end
        if not type -q ela; and not abbr --query ela
            abbr --add ela 'eza --long --all --header --icons=auto --group-directories-first'
        end
        if not type -q elt; and not abbr --query elt
            abbr --add elt 'eza --tree --level=2 --icons=auto --group-directories-first'
        end
        if not type -q elg; and not abbr --query elg
            abbr --add elg 'eza --long --all --header --git --icons=auto --group-directories-first'
        end
        if not type -q eld; and not abbr --query eld
            abbr --add eld 'eza --long --header --only-dirs --icons=auto --group-directories-first'
        end
        if not type -q elf; and not abbr --query elf
            abbr --add elf 'eza --long --header --only-files --icons=auto --group-directories-first'
        end
    end

    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end
end
