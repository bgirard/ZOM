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
      echo "help"
    fi
    return
  fi
  if [ "$1" == "-complete" ]
  then
    IS_COMPLETE=-complete
    let COMP_CWORD=$COMP_CWORD-1
    shift # shift -complete
    shift # shift zom
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
    let COMP_CWORD=$COMP_CWORD-1
    print_help
    return
  fi

  COMMAND=$1
  shift

  run_command "$@"

}


main "$@"

