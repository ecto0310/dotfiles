# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-$(whoami).zsh" ]]; then
    source "${XDG_CACHE_HOME}/p10k-instant-prompt-$(whoami).zsh"
fi

# Powerlevel10k theme
if [[ -r "${XDG_CONFIG_HOME}/zsh/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
    source "${XDG_CONFIG_HOME}/zsh/powerlevel10k/powerlevel10k.zsh-theme"
fi

# Powerlevel10k config
if [[ -r "${XDG_CONFIG_HOME}/zsh/.p10k.zsh" ]]; then
    source "${XDG_CONFIG_HOME}/zsh/.p10k.zsh"
fi

# history
if [[ ! -d "${XDG_CACHE_HOME}/zsh" ]]; then
    mkdir -m 700 "${XDG_CACHE_HOME}/zsh"
fi
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt share_history
setopt histignorealldups

# WSL only
if [ "$IS_WSL" = true ]; then
    if [[ -f "${XDG_CONFIG_HOME}/bash/wsl.sh" ]]; then
        source "${XDG_CONFIG_HOME}/bash/wsl.sh"
    fi
fi

# alias
if [[ -r "${XDG_CONFIG_HOME}/bash/alias.sh" ]]; then
    source "${XDG_CONFIG_HOME}/bash/alias.sh"
fi
