#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "zomlib.h"

helpFunc help_func = NULL;

int implement_optional_help(helpFunc func) {
  help_func = func;
  return 0;
}

int main(int argc, char* argv[]) {

  register_implement();

  int i = 0; 

  if( argc >= 2 && strcmp(argv[1], "-description" )  == 0 ) {
    print_description();
    return 0;
  }

  if( argc >= 2 && strcmp(argv[1], "-complete" )  == 0 ) {
    int comp_argc = argc - 1;
    char** comp_argv =(char**) malloc( sizeof(char*) * comp_argc );
    comp_argv[0] = argv[0];
    for(i = 1; i < comp_argc; i++ ) {
      comp_argv[i] = argv[i+1];
    }

    get_complete(comp_argc, comp_argv);

    free(comp_argv);

    return 0;
  } else if( argc >= 2 && strcmp(argv[1], "help" )  == 0 ) {
    int comp_argc = argc - 1;
    char** comp_argv =(char**) malloc( sizeof(char*) * comp_argc );
    comp_argv[0] = argv[0];
    for(i = 1; i < comp_argc; i++ ) {
      comp_argv[i] = argv[i+1];
    }

    if( help_func != NULL ) {
      help_func(comp_argc, comp_argv);
    } else {
      printf("This command does not provide help\n");
    }

    free(comp_argv);

    return 0;
  }

  run_command(argc, argv);

  return 0;
}
