# .profile is for things that are not specifically related to Bash, 
# like environment variables PATH and friends,
# are available anytime including 
#      interactive Bash sessions
#      non-interactive Bash session (like other command line shell sessions)
# For example, .profile should also be loaded 
#            when starting a graphical shell/desktop session/environment.
#            on login on linux setup
# Environment variables defines the run time modifying stuff 


# brew install coreutils ->  GNU's coreutils -> PATH is ~/homebrew/Cellar/opt/coreutils/libexec/gnuman 
#export PATH=~/anaconda2/bin:~/homebrew/Cellar/opt/coreutils/libexec/gnuman:~/homebrew/bin:$PATH
export SPHINX_DOC_BIN="/Users/alvin/homebrew/opt/sphinx-doc/bin"
export MACTEX_BIN="/usr/local/texlive/2017/bin/x86_64-darwin"
export PYTHON2_BIN=="/Users/alvin/anaconda2/bin"
export HOMEBREW_BIN="/Users/alvin/homebrew/Cellar/opt/coreutils/libexec/gnuman:~/homebrew/bin"
export PATH=$MACTEX_BIN:$SPHINX_DOC_BIN:$PYTHON2_BIN:$HOMEBREW_BIN:$PATH



