#!/usr/bin/env bash
#
# bash command prompt stuff
#
#
# partially takend from https://gist.github.com/4503986
#
# A set of color functions to help with fancy $PS1 prompts
#
# This:
#     PROMPT_COMMAND='PS1="\e[32;1m\]\u@\[\e[35;1m\]\H \[\e[0m\]\w]\$ "''
#
# Can be more clearly written as:
#     PROMPT_COMMAND='PS1="$(DARK_GREEN \\u@)$(PURPLE \\H) \w]\$ "''
#
# note: Escape codes returned from these functions will not work in a directly
#       assigned $PS1, use PROMPT_COMMAND to prevent extra escaping.
#

# Text Colors
function RED         { echo "\[\e[0;91m\]$1\[\e[0m\]"; }
function DARK_RED    { echo "\[\e[0;31m\]$1\[\e[0m\]"; }
function YELLOW      { echo "\[\e[0;93m\]$1\[\e[0m\]"; }
function DARK_YELLOW { echo "\[\e[0;33m\]$1\[\e[0m\]"; }
function GREEN       { echo "\[\e[0;92m\]$1\[\e[0m\]"; }
function DARK_GREEN  { echo "\[\e[0;32m\]$1\[\e[0m\]"; }
function CYAN        { echo "\[\e[0;96m\]$1\[\e[0m\]"; }
function DARK_CYAN   { echo "\[\e[0;36m\]$1\[\e[0m\]"; }
function BLUE        { echo "\[\e[0;94m\]$1\[\e[0m\]"; }
function DARK_BLUE   { echo "\[\e[0;34m\]$1\[\e[0m\]"; }
function MAGENTA     { echo "\[\e[0;95m\]$1\[\e[0m\]"; }
function PURPLE      { echo "\[\e[0;35m\]$1\[\e[0m\]"; }
function BLACK       { echo "\[\e[0;30m\]$1\[\e[0m\]"; }
function GRAY        { echo "\[\e[0;90m\]$1\[\e[0m\]"; }
function LIGHT_GRAY  { echo "\[\e[0;37m\]$1\[\e[0m\]"; }
function WHITE       { echo "\[\e[0;97m\]$1\[\e[0m\]"; }

# # Black on Background Color
# function B_ON_RED         { echo "\[\e[0;30;101m\]$1\[\e[0m\]"; }
# function B_ON_DARK_RED    { echo "\[\e[0;30;41m\]$1\[\e[0m\]"; }
# function B_ON_YELLOW      { echo "\[\e[0;30;103m\]$1\[\e[0m\]"; }
# function B_ON_DARK_YELLOW { echo "\[\e[0;30;43m\]$1\[\e[0m\]"; }
# function B_ON_GREEN       { echo "\[\e[0;30;102m\]$1\[\e[0m\]"; }
# function B_ON_DARK_GREEN  { echo "\[\e[0;30;42m\]$1\[\e[0m\]"; }
# function B_ON_CYAN        { echo "\[\e[0;30;106m\]$1\[\e[0m\]"; }
# function B_ON_DARK_CYAN   { echo "\[\e[0;30;46m\]$1\[\e[0m\]"; }
# function B_ON_BLUE        { echo "\[\e[0;30;104m\]$1\[\e[0m\]"; }
# function B_ON_DARK_BLUE   { echo "\[\e[0;30;44m\]$1\[\e[0m\]"; }
# function B_ON_MAGENTA     { echo "\[\e[0;30;105m\]$1\[\e[0m\]"; }
# function B_ON_PURPLE      { echo "\[\e[0;30;45m\]$1\[\e[0m\]"; }
# function B_ON_BLACK       { echo "\[\e[0;30;40m\]$1\[\e[0m\]"; }
# function B_ON_DARK_GRAY   { echo "\[\e[0;30;100m\]$1\[\e[0m\]"; }
# function B_ON_GRAY        { echo "\[\e[0;30;47m\]$1\[\e[0m\]"; }
# function B_ON_LIGHT_GRAY  { echo "\[\e[0;30;107m\]$1\[\e[0m\]"; }

# # White on Background Color
# function W_ON_RED         { echo "\[\e[0;97;101m\]$1\[\e[0m\]"; }
# function W_ON_DARK_RED    { echo "\[\e[0;97;41m\]$1\[\e[0m\]"; }
# function W_ON_YELLOW      { echo "\[\e[0;97;103m\]$1\[\e[0m\]"; }
# function W_ON_DARK_YELLOW { echo "\[\e[0;97;43m\]$1\[\e[0m\]"; }
# function W_ON_GREEN       { echo "\[\e[0;97;102m\]$1\[\e[0m\]"; }
# function W_ON_DARK_GREEN  { echo "\[\e[0;97;42m\]$1\[\e[0m\]"; }
# function W_ON_CYAN        { echo "\[\e[0;97;106m\]$1\[\e[0m\]"; }
# function W_ON_DARK_CYAN   { echo "\[\e[0;97;46m\]$1\[\e[0m\]"; }
# function W_ON_BLUE        { echo "\[\e[0;97;104m\]$1\[\e[0m\]"; }
# function W_ON_DARK_BLUE   { echo "\[\e[0;97;44m\]$1\[\e[0m\]"; }
# function W_ON_MAGENTA     { echo "\[\e[0;97;105m\]$1\[\e[0m\]"; }
# function W_ON_PURPLE      { echo "\[\e[0;97;45m\]$1\[\e[0m\]"; }
# function W_ON_BLACK       { echo "\[\e[0;97;40m\]$1\[\e[0m\]"; }
# function W_ON_DARK_GRAY   { echo "\[\e[0;97;100m\]$1\[\e[0m\]"; }
# function W_ON_GRAY        { echo "\[\e[0;97;47m\]$1\[\e[0m\]"; }
# function W_ON_LIGHT_GRAY  { echo "\[\e[0;97;107m\]$1\[\e[0m\]"; }

# git
function GIT_BRANCH {
if git branch &>/dev/null; then
     BRANCH=$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2)
     local prefix=$(echo -e '\xE2\x94\x80')
     echo "$prefix["$(GREEN $BRANCH)"]"
fi;
}

# heroku
function WHICH_CLOUD {
local symb=$(echo -e '\xE2\x98\x81\x0A')
local prefix=$(echo -e '\xE2\x94\x80')
case $HEROKU_CLOUD in
    staging)
        echo "$prefix["$(CYAN "$HEROKU_CLOUD")"]"
        ;;
    eu-west-1-a)
        echo "$prefix["$(RED "$HEROKU_CLOUD")"]"
        ;;
    production)
        echo "$prefix["$(RED "$HEROKU_CLOUD")"]"
        ;;
    *)
        echo "$prefix["$(GREEN "$HEROKU_CLOUD")"]"
	;;
esac
}

# is heroku sudo
function IS_H_SUDO {
local prefix=$(echo -e '\xE2\x94\x80')
if [ $HEROKU_SUDO ]; then
    echo "$prefix["$(RED h:sudo)"]"
fi
}

# time
function WHAT_TIME {
local prefix=$(echo -e '\xE2\x94\x80')
echo "$prefix["$(DARK_CYAN \\T)"]"
}

# pwd
function WHICH_PATH {
local prefix=$(echo -e '\xE2\x94\x80')
echo "$prefix["$(GREEN \\w)"]"
}

# echo SYMB | hexdump
function begin_top_line { echo -e "\xE2\x94\x8C\xE2\x94\x80"; }
function prompt_symbol {
## DOESN'T WORK!!???
local LAST_EXIT="$?"
if [ $LAST_EXIT != 0 ]; then
    echo -e "\xE2\x94\x94\xE2\x9C\x97";
else
    echo -e "\xE2\x94\x94\xE2\x96\xB8";
fi
}


PROMPT_COMMAND='PS1="$(begin_top_line)$(WHAT_TIME)$(WHICH_CLOUD)$(IS_H_SUDO)$(WHICH_PATH)$(GIT_BRANCH)\n$(prompt_symbol) "'

