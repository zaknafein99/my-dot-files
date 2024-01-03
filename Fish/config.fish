if status is-interactive
    # Commands to run in interactive sessions can go here
end
function ec
    emacsclient --create-frame $argv &
end
alias ls="exa -l --icons"
alias la="exa -la --icons"
alias vim=lvim
alias ec="emacsclient -c -a 'emacs'"
alias emacs="emacsclient -c -a 'emacs'"

starship init fish | source
