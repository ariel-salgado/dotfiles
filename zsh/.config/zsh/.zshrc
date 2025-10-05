# History
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
setopt EXTENDED_HISTORY					        # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY					          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST			      # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS					        # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS				      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS				        # Do not display a previously found event.
setopt HIST_IGNORE_SPACE				        # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS				        # Do not write a duplicate event to the history file.
setopt HIST_VERIFY						          # Do not execute immediately upon history expansion.

#zinit
ZINIT_HOME="$ZINIT_DIR"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
#zinit end

# custom
[ -f "$ZDOTDIR/custom.zsh" ] && source "$ZDOTDIR/custom.zsh"

# pnpm
export PNPM_HOME="/home/ariel/.config/local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
FNM_PATH="/home/ariel/.config/local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
# fnm end
