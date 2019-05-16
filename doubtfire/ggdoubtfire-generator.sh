#!/bin/bash

PROJECT_PATH=$1

cat <<EOF > ~/.dotfiles/ggdoubtfire
$VISUAL $PROJECT_PATH/doubtfire-web
$VISUAL $PROJECT_PATH/doubtfire-api

open -a Postgres

# toggl doubtfire-dev

open https://github.com/doubtfire-lms/
open http://localhost:4200
tmuxp load doubtfire
EOF
