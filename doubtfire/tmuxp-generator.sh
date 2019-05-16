#!/bin/bash

PROJECT_PATH=$1

cat <<EOF > ~/.tmuxp/doubtfire-test.json
{
  "session_name": "doubtfire",
  "windows": [
    {
      "options": {
        "automatic-rename": "off"
      },
      "window_name": "zsh",
      "layout": "0d64,193x44,0,0{96x44,0,0[96x22,0,0,1,96x21,0,23,2],96x44,97,0[96x22,97,0,3,96x21,97,23,4]}",
      "panes": [
        {
          "shell_command": [
            "lsof -i tcp:3000 | awk 'NR!=1 {print $2}' | xargs kill",
            "cd $PROJECT_PATH/doubtfire-api",
            "bundle exec rails s"
          ]
        },
        {
          "shell_command": [
            "cd $PROJECT_PATH/doubtfire-api"
          ],
          "focus": "true"
        },
        {
          "shell_command": [
            "lsof -i tcp:4200 | awk 'NR!=1 {print $2}' | xargs kill",
            "cd $PROJECT_PATH/doubtfire-web",
            "npm start"
          ]
        },
        {
          "shell_command": [
            "cd $PROJECT_PATH/doubtfire-web"
          ]
        }
      ],
      "focus": "true"
    }
  ]
}
EOF