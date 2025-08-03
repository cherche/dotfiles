export PATH="\
$HOME/dotfiles/bin\
:/opt/homebrew/bin\
:/opt/homebrew/sbin\
:/usr/local/bin\
:/usr/bin\
:/bin\
:/usr/sbin\
:/sbin\
:/Library/TeX/texbin\
:/opt/X11/bin\
:/Users/ryan/.local/bin\
"
# Mainly for clang
export LIBRARY_PATH="\
/usr/local/lib\
:/opt/homebrew/lib\
:/usr/lib\
:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib\
"
export LD_LIBRARY_PATH="\
/usr/local/lib\
:/opt/homebrew/lib\
:/usr/lib\
:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib\
"
export DYLD_FRAMEWORK_PATH="\
:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include\
"
export CPLUS_INCLUDE_PATH="\
/usr/local/include\
:/opt/homebrew/include\
:/usr/local/include\
:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include\
"

export LANG=en_CA.UTF-8
export EDITOR=vim

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export N8N_CONFIG_FILES="$HOME/dotfiles/n8n/config.json"

