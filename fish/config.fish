if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --icons --group-directories-first -1'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    # VPN shortcuts
    alias vpn-connect='sudo pon dngx_vpn'
    alias vpn-disconnect='sudo poff dngx_vpn'
    alias vpn-status='ip addr show ppp0 2>/dev/null && ip route | grep ppp0 || echo "VPN not connected"'
    alias vpn-debug='sudo pon dngx_vpn debug dump logfd 2 nodetach'
    alias vpn-split='dngx-vpn mode split'
    alias vpn-full='dngx-vpn mode full'
    alias vpn-toggle='dngx-vpn toggle-mode'    

    # If connecting via SSH, use compatible TERM
    if set -q SSH_CONNECTION
      set -gx TERM xterm-256color
    end


    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
    
    # Custom fish config
    source ~/.config/caelestia/user-config.fish 2> /dev/null
end
