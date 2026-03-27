# ------------------------------------------------------------------
# 1. SHELL BEHAVIOR & SESSIONS
# ------------------------------------------------------------------

# Guard: If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Check window size after each command and update LINES/COLUMNS
shopt -s checkwinsize
# Auto-correct minor typos in 'cd' commands
shopt -s cdspell dirspell
# Extend globbing (e.g., ls **/*.js)
shopt -s globstar

# ------------------------------------------------------------------
# 2. PROFESSIONAL HISTORY MANAGEMENT
# ------------------------------------------------------------------

# ignoreboth: don't save lines starting with space or duplicate lines
# erasedups: remove old duplicate entries from the entire history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%F %T " # Adds timestamps to 'history' command
shopt -s histappend            # Append to history, don't overwrite

# ------------------------------------------------------------------
# 3. THE PROMPT (Git-Aware)
# ------------------------------------------------------------------

# Extracts the current git branch name
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# u: user, h: host, W: current folder, $: branch
export PS1='\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\W\[\e[33m\]$(parse_git_branch)\[\e[m\]\$ '

# ------------------------------------------------------------------
# 4. ALIASES & SHORTCUTS
# ------------------------------------------------------------------

# Colorize standard outputs
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Navigation & Listing
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias path='echo -e ${PATH//:/\\n}'
alias myip='curl -s https://ifconfig.me/ip && echo'
alias ports='netstat -tulanp'

# Safety Nets (Prompts for confirmation)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Neovim Overrides
alias vi='nvim'
alias vim='nvim'
alias v='nvim'

#Git commands
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --all'

# ------------------------------------------------------------------
# 5. EXTERNAL COMPLETIONS & FILES
# ------------------------------------------------------------------

# Load custom aliases if the file exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
