# added by Anaconda2 4.1.1 installer
echo "loading ~/.bash_profile"
export SPHINX_DOC_BIN="/Users/alvin/homebrew/opt/sphinx-doc/bin"
export MACTEX_BIN="/usr/local/texlive/2017/bin/x86_64-darwin"
export PYTHON2_BIN="/Users/alvin/anaconda2/bin"
export HOMEBREW_BIN="/Users/alvin/homebrew/Cellar/opt/coreutils/libexec/gnuman:~/homebrew/bin"
export GNU_SED_BIN="/Users/alvin/homebrew/opt/gnu-sed/libexec/gnubin"
#export PATH=$MACTEX_BIN:$SPHINX_DOC_BIN:$PYTHON2_BIN:$HOMEBREW_BIN:$PATH

MANPATH="/Users/alvin/homebrew/opt/gnu-sed/libexec/gnuman:$MANPATH"

NEW_PATH="$MACTEX_BIN:"
NEW_PATH+="$SPHINX_DOC_BIN:"
NEW_PATH+="$PYTHON2_BIN:"
NEW_PATH+="$HOMEBREW_BIN:"
NEW_PATH+="$GNU_SED_BIN"
PATH="$NEW_PATH:$PATH"


#export PATH=/Users/alvin/homebrew/opt/sphinx-doc/bin:~/anaconda2/bin:~/homebrew/Cellar/opt/coreutils/libexec/gnuman:~/homebrew/bin:$PATH


#export PATH="/Users/alvin/homebrew/opt/sphinx-doc/bin:$PATH"
