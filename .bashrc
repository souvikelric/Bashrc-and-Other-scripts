#Set aliases

alias devInfusion="cd ~/'OneDrive - Accenture'/Desktop/Opria-Infusion/Infusion"
alias changeEmoji="~/'OneDrive - Accenture'/Desktop/scripts/getNewEmoji.sh"
alias changeBg="python ~/'OneDrive - Accenture'/Desktop/scripts/changeTerminalBg.py"
alias cdDesktop="cd ~/OneDrive\ -\ Accenture/Desktop"
alias cdScripts="cd ~/OneDrive\ -\ Accenture/Desktop/scripts"
alias jupyter="/C/Users/s.s.roy.chowdhury/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0/LocalCache/local-packages/Python312/Scripts/jupyter-notebook.exe"
alias p5js="~/'OneDrive - Accenture'/Desktop/scripts/p5jsStarter.sh"

# The below alias opens explorer in the current directory
alias exl="explorer ."
alias reDes="mstsc"

greenCol="\033[38;2;91;240;179m"
redCol="\033[38;2;253;84;110m"
magentaCol="\033[38;2;207;89;249m"
reset="\033[0m"


checkMemory(){

 availSpace=$(df -h | tail -1 | awk '{print "Available space : " $5}')
 memUsed=$(df -h | tail -1 | awk '{print "Used memory : " $6}')
 realMemUsed=$(powershell -Command "Get-PSDrive C" | awk 'NR==4 {print "Real Available space : "  $3"GB" }')

 echo -e "${greenCol}${availSpace}${reset}"
 echo -e "${magentaCol}${realMemUsed}${reset}"
 echo -e "${redCol}${memUsed}${reset}"

}

complete -F _command checkMemory

#alias checkMem="checkMemory"


gacp(){

    git="$(__git_ps1 ' (%s)')"
    if [ -d ".git" ] || [ -n "$git" ];then
        status=$(git status --porcelain)
        if [[ -z $status ]];then
            echo -e "${greenCol}No files to be added or committed${reset}"
            echo -e "${magentaCol}$(git status)${reset}"
        else
            echo -e "${greenCol}Files present that need to be added or commited${reset}"
            if [ -z "$1" ];then
                echo -e "${redCol}Please add a message to commmit and push${reset}"
            else
                git add . && git commit -m"$1" && git push origin
            fi
        fi
    else
        echo -e "${redCol}Not a git repo${reset}"
    fi

}


gfp(){

    git fetch && git status | grep -q "behind"
    if [ $? -eq 0 ]; then
        echo "${redCol}Pull required${reset}"
        echo "${greenCol}$(git status | grep "behind" | awk '{print $4 " " $7 " " $8}' | awk -F "," '{print $1}')${reset}"
        status=$(git status --porcelain | wc -l)
        if [[ ! $status -eq "0" ]];then
            git stash
        fi
        git pull
        if [[ ! $status -eq "0" ]];then
            git stash apply
            echo "${greenCol}Pull Complete. Stash applied. You can now run the command gacp 'message' to push changes to remote${reset}"
        else
            echo "${greenCol}Pull Complete${reset}"
        fi
    else
        echo "${magentaCol}Pull not required${reset}"
    fi
}



figlet(){

	python -m pyfiglet $@

}

reactcleanup(){

	python ~/OneDrive\ -\ Accenture/Desktop/scripts/reactCleanup.py "$(pwd)"

}

dev(){
    if [ -z "$1" ];then
        echo "Error: Please pass a git repo name"
    elif [ "$1" == "Infusion" ];then
	devInfusion
    elif [ "$1" == "AIMI" ];then
	cd ~/OneDrive\ -\ Accenture/Desktop/AIMI/AIMI_Next_UI
    elif [ "$1" == "UAM" ];then
	cd ~/OneDrive\ -\ Accenture/Desktop/UAM/UserAccess-UI
    else
        echo "$1 is not a registered repo"
    fi
}

export LANG=en_US.UTF-8

# Set the PS1 variable
export PS1='\[$(tput setaf 75)\]\u\[$(tput setaf 171)\]@\[$(tput setaf 171)\]\h \[$(tput setaf 211)\]\w \[$(tput sgr0)\]\$(__git_ps1 " (%s)") \[\033[97m\]\012🪸 '

val=$(changeEmoji)
# echo $val
export PS1="$val "

# Running the above set function to give an update about the memory when 
# users login to bash
checkMemory


