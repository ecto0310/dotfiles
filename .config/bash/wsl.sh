#!/usr/bin/env bash

# 1Password SSH Agent
if type "npiperelay.exe" > /dev/null 2>&1; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.socket
    if [[ $(pgrep -f "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?) != "0" ]]; then
        if [[ -S "${SSH_AUTH_SOCK}" ]]; then
            rm "${SSH_AUTH_SOCK}"
        fi
        (setsid socat UNIX-LISTEN:"${SSH_AUTH_SOCK}",fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
    fi
fi
