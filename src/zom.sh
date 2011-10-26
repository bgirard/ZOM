#!/bin/bash

function complete {
  ls $COMMAND_HOME/commands
}

function run_command {

  COMMAND_BIN=$COMMAND_HOME/commands/$COMMAND/bin/command
  if [ -z "$COMMAND" ]
  then
    if [ -z "$IS_COMPLETE" ]
    then
      help
    fi
    return
  fi
  if [ ! -e "$COMMAND_BIN" ]
  then
    echo "Command $COMMAND_BIN does not exists"
    return
  fi
  #echo "COMMAND_HOME=$COMMAND_HOME/commands/$COMMAND $COMMAND_BIN $IS_COMPLETE$IS_HELP "$@"" >/dev/stderr
  COMMAND_HOME=$COMMAND_HOME/commands/$COMMAND $COMMAND_BIN $IS_COMPLETE $IS_HELP "$@"
}

function help {
  echo "Command container, the following commands are provided:"
  echo ""
  for i in $COMMAND_HOME/commands/*
  do
    COMMAND_BIN=$i/bin/command
    if [ ! -e "$COMMAND_BIN" ]
    then
      break
    fi
    printf "  %-20s %s\n" "$(basename $i)" "$(COMMAND_HOME=$i $COMMAND_BIN -description)"
  done
  return
}

function description {
  echo "Top level command"
}

function main {

  # Set the command home, default to zom_home if none are set
  COMMAND_HOME=${COMMAND_HOME:=$ZOM_HOME}

  if [ "$1" == "-description" ]
  then
    description
    return
  fi

  if [ "$1" == "-complete" ] && [ $COMP_CWORD -eq 1 ]
  then
    shift
    shift
    if [ "$1" == "help" ]
    then
      shift 
    fi
    complete "$@"
    if [ "$COMMAND_HOME" == "$ZOM_HOME" ]
    then
      # Completion for virtual top level command
      echo "help"
    fi
    return
  fi
  if [ "$1" == "-complete" ]
  then
    IS_COMPLETE=-complete
    let COMP_CWORD=$COMP_CWORD-1
    shift # shift -complete
    if [ "$COMMAND_HOME" == "$ZOM_HOME" ]
    then
      shift # shift zom
    fi
  fi
  if [ "$1" == "help" ]
  then
    shift 
    IS_HELP=help
    if [ -n "$IS_COMPLETE" ] && [ $COMP_CWORD -eq 1 ]
    then
      complete "$@"
      return
    fi
    if [ -z $1 ]
    then
      help
      return
    fi
    let COMP_CWORD=$COMP_CWORD-1
  fi

  COMMAND=$1
  shift

  run_command "$@"
}

main "$@"


