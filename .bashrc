#!/bin/bash
# .bashrc customize for MacOS
echo "Customizing bash to ~/.bashrc settings"

# User {{{1 
[[ $USER = "" ]] && USER=$LOGNAME
export USER 

# Editor {{{1
export EDITOR=vim
export XEDITOR=vim
export VISUAL=vim
export TEXEDIT=vim
export DICTIONARY=american

# Language {{{1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Profile Variables {{{1
export MY_VIMRC="$HOME/.vimrc"
export MY_BASH_PROFILE="$HOME/.bash_profile"
export MY_BASHRC="$HOME/.bashrc"
export MY_PROFILE="$HOME/.profile"
export MY_NOTES_DIR="$HOME/Notes"

# Color {{{1
export Black='\e[0;90m'
export Red='\e[0;91m'
export Green='\e[0;92m'
export Yellow='\e[0;93m'
export Blue='\e[0;94m'
export Purple='\e[0;95m'
export Cyan='\e[0;96m'
export White='\e[0;97m'

ulimit -c 0 # Don't create core files by default. abort(2) still leaves them.

### History {{{1
shopt -s histappend         # Append commands to history file ~/.bash_history instead of overwriting it.

HISTSIZE=384                #The amount of history kept in memory when Bash is running
HISTFILESIZE=${HISTSIZE}    #The amount of history kept on the disk. 
HISTCONTROL=ignoreboth	# Ignore blank lines and duplicates in history
HISTTIMEFORMAT="%Y%m%d %H:%M:%S " 

# hist file
[[ ! -d $HOME/hist ]] && mkdir -m 0700 $HOME/hist
HISTFILE=${HOME}/hist/$HOSTNAME.$(date +%y%m%d).$$
export HISTSIZE HISTFILESIZE HISTCONTROL HISTTIMEFORMAT HISTFILE 

# PS1's git branch parser {{{1
parse_git_branch() { 
    git branch --no-color 2> /dev/null \
        | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/';
}

# PS1's Date Time parser {{{1
# Location of timezone(TZ) list: /usr/share/zoneinfo/
# Time Zone: String for TZ (Environment Variable for date/gdate)
# Southeast Asia Time: Asia/Singapore
# America Mountain Time: America/Boise
# America Pacific Time: America/Los_Angeles
 
getEpoch() { echo "$(gdate +%s)"; }

# Convert epoch to date time of specific time zone
epochTo_TZDateTime() {
   
    export TZ="$1" # Example for $1 = "America/Los_Angeles"
    current_epoch_time="$2"; 
    deliminator="/"
    month_day_year=$(gdate -d @$current_epoch_time +%m$deliminator%d$deliminator%Y);
    time_am_pm=$(gdate -d @$current_epoch_time +%R:%S); 
    day_of_week=$(gdate -d @$current_epoch_time +%A);
    day_of_month=$(gdate -d @$current_epoch_time +%d); 
    month=$(gdate -d @$current_epoch_time +%B);
    year=$(gdate -d @$current_epoch_time +%Y);
    region=$(gdate -d @$current_epoch_time +%Z);
    
    # echo "$work_week $day_of_week $month $day_of_month $year ($month_day_year) $time_am_pm $region"; 
    echo "$day_of_week ($month_day_year) $time_am_pm $region"; 
    unset TZ; 
}

epochTo_WorkWeek() {
    export TZ="$1"
    current_epoch_time="$2";
   
    # work week from 00 to 53
    work_week=$(gdate -d@$current_epoch_time +%U); 
    unset TZ;
    echo "$work_week"; 
}
# Set User Prompt {{{1 

set_user_prompt() {

  TITLEBAR='\[\033]0;\u@\h:\w\007\]'
  local this_TZ="America/Los_Angeles"
  local current_epoch="$(getEpoch)"
  TZ_DT=$(epochTo_TZDateTime $this_TZ $current_epoch)
  WW="WW$(epochTo_WorkWeek $this_TZ $current_epoch)" 
  
  # For black background 
  #PS1="${TITLEBAR}$Blue[$Red H\! | $WW | $TZ_DT$Blue ][ $Red\w\$(parse_git_branch)$Blue ]$Green\]\n\u \$> "

  PS1="\[\033]0;\u@\h:\007\]";   #titlebar
  PS1+="${Blue}[ ";      # [
  PS1+="${White}H\!";    # History number with prefix 'H'
  PS1+="${Blue} | ";     # Separator '|'
  PS1+="${White}$WW";    # Work week (with prefix WW) starts on Sunday. 
  PS1+="${Blue} | ";     # Separator '|'
  PS1+="${Yellow}$TZ_DT" # Date and Time in TZ
  PS1+="${Blue}][ ";     # ]
                         # [
  PS1+="${Cyan}\w ";     # working directory                             
  PS1+="${Red}\$(parse_git_branch)";   # show git branch                             
  PS1+="${Blue}]${Green}";      # ]
  PS1+="\n";                    # new line
  PS1+="\u \$> ";               # "User" $>
  # For white background 
  #PS1="${TITLEBAR}$Blue[ H\! | $WW | $TZ_DT$Blue ][ \w\$(parse_git_branch) ]$Black\]\n\u \$> "

  PS2="continue > "
  export PS1 PS2
}

set_user_prompt

### Source optional environment settings if the user has them
test -f $HOME/.bash_function && . $HOME/.bash_function
test -f $HOME/.aliases && . $HOME/.aliases

# }}} vim: fdm=marker 

