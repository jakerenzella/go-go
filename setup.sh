#!/bin/bash


if ! [ -x "$(command -v tmux)" ] ; then
  brew install tmux
fi

if ! [ -x "$(command -v tmuxp)" ] ; then
  pip3 install tmuxp
fi

echo "Enter the root path of this project without the trailing slash"
echo "For example: ~/Repos/doubtfire"
echo
read -p "Enter path: " dirpath

# git clone https://github.com/gpakosz/.tmux.git ${HOME}
# ln -s -f ${HOME}/.tmux/.tmux.conf
# cp ${HOME}.tmux/.tmux.conf.local .

echo "Generating tmuxp configuration..."
./doubtfire/tmuxp-generator.sh ${dirpath}
echo "Generating ggdoubtfire file..."
./doubtfire/ggdoubtfire-generator.sh ${dirpath}