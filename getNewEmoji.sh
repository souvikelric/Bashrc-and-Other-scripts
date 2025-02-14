#!/bin/bash

PS1='\[$(tput setaf 75)\]\u\[$(tput setaf 171)\]@\[$(tput setaf 171)\]ShadowCoder\[$(tput setaf 211)\]\w \[$(tput setaf 215)$(__git_ps1 " (%s)") \[\033[97m\]\012🪸 '
export LANG=en_US.UTF-8
emojiArr=(
    "🪸" "😎" "🥶" "🥳" "👽" "👹" "🤖" "🦁" 
    "🐲" "🦄" "🫎" "🐽" "🦮" "🐈" "🦥" "🐉"
    "🦐" "🪼" "🎉" "🎨" "🥇" "🧩" "🎸" "🩻"
    "📱" "📎" "🍿" "🍉" "🚒" "🚤" "🏝️" "♨️"
    "♨️" "♨️" "⛄" "❄️" "❄️" "❄️" "💥" "🕙"
)

randomNumber=$((($RANDOM % ${#emojiArr[@]})))
randomEmoji=${emojiArr[$randomNumber]}

# echo "The random Number is $randomNumber"
# echo "$randomEmoji"

#important
#remove trailing spaces
PS1="${PS1%"${PS1##*[![:space:]]}"}"

# Add the new generated emoji
modifiedPS1="${PS1:0:${#PS1}-2}$randomEmoji "

# Assign the modified PS1

PS1=$modifiedPS1
echo $PS1
# export PS1
