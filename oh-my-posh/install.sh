#!/bin/bash

if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRO=$ID
else
  echo "No se pudo detectar la distribución."
  exit 1
fi


color_negro="\033[40m"
color_rojo="\033[41m"
color_verde="\033[42m"
color_amarillo="\033[43m"
color_azul="\033[44m"
color_magenta="\033[45m"
color_cian="\033[46m"
color_blanco="\033[47m"
reset="\033[0m"
negrita="\033[1m"

echo -e "\033[0;35m
            _    __
 _  _____  (_)__/ /
| |/ / _ \/ / _  / 
|___/\___/_/\_,_/  
                   
[*] Github: github.com/v019-exe
[*] Script hecha por v019.exe
[*] OS: $DISTRO
[*] Only for linux and darwin
\033[0m"

case $DISTRO in
  ubuntu | debian | arch | fedora)
    echo -e "[INSTALLER]: Installing oh-my-posh in Linux ($DISTRO)"
    if curl -s https://ohmyposh.dev/install.sh | bash &> /dev/null; then
      echo "eval \"\$(oh-my-posh init bash)\"" >> "$HOME/.bashrc"
      if [ $? -eq 0 ]; then
        echo -e "[INSTALLER]: Installed successfully"
        echo -e "[INSTALLER]: Restarting terminal"
        exec bash
        if [ $? -eq 0 ]; then
          echo -e "[INSTALLER]: Terminal restarted successfully"
        else
          echo -e "[INSTALLER]: Error while restarting the terminal"
          exit 1
        fi
      else
        echo -e "[INSTALLER]: Error while trying to finish the installation"
        exit 1
      fi
    else
      echo -e "[INSTALLER]: Error downloading oh-my-posh"
      exit 1
    fi
    ;;
  darwin)
    echo -e "[INSTALLER]: Attempting to install oh-my-posh on macOS ($DISTRO)"
    if brew install jandedobbeleer/oh-my-posh/oh-my-posh; then
      echo "eval \"\$(oh-my-posh init zsh)\"" >> "$HOME/.bashrc"
      echo -e "[INSTALLER]: Installed successfully on macOS"
    else
      echo -e "[INSTALLER]: Error installing oh-my-posh on macOS"
      exit 1
    fi
    ;;
  *)
    echo -e "[INSTALLER]: OS not supported."
    exit 1
    ;;
esac
      



