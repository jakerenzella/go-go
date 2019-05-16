#!/bin/bash

while true; do
    read -p "Do you wish to install tmuxp?" yn
    case $yn in
        [Yy]* ) pip3 install tmuxp ;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Enter the root path of this project without the trailing slash"
echo "For example: ~Repos/doubtfire"
echo
read -p "Enter path: " dirpath

# git clone https://github.com/gpakosz/.tmux.git ${HOME}
# ln -s -f ${HOME}/.tmux/.tmux.conf
# cp ${HOME}.tmux/.tmux.conf.local .

./doubtfire/tmuxp-generator.sh ${dirpath}
./doubtfire/ggdoubtfire-generator.sh ${dirpath}