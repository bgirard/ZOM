#!/bin/bash

function complete {
  return
}

function description {
  echo "Creates a new zom command in the given directory"
}

function print_help {
  description
  echo ""
  echo "Set your PWD to the zom commands directory you wish to create a new command in."
  echo "and invoke this command."
  echo ""
  echo "This command can be used to create C or Bash based zom commands."
}

function run_command {
  echo "Enter the name of the command you would like to create"
  read NEW_CMD_NAME
  echo "What type of command would you like to create?"
  echo "1) Bash command"
  echo "2) Container command"
  echo "Select? [1,2]"
  read NEW_CMD_TYPE
  # FINISH THIS
  echo "Command '$NEW_CMD_NAME' will be created in $PWD" 
  echo "Confirm? [Y/n]" 
  read NEW_CMD_CONFIRM
  if [ $NEW_CMD_CONFIRM == "Y" ]
  then
    mkdir $PWD/$NEW_CMD_NAME
    if [ $NEW_CMD_TYPE == "1" ]
    then
      cp -r $COMMAND_HOME/data/bash_command/* $PWD/$NEW_CMD_NAME
    else
      cp -r $COMMAND_HOME/data/container_command/* $PWD/$NEW_CMD_NAME
    fi
  fi
  return
}


