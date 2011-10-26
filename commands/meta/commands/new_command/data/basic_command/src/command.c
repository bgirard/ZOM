#include <stdio.h>
#include "zomlib.h"

void get_help(int argc, char* argv[]) {
  printf("Some help text here\n");
}

void register_implement() {
  implement_optional_help(get_help);
}


void get_complete(int argc, char* argv[]) {
  int i = 0;
  for( i = 0; i < argc; i++ ){
    printf("myarg[%i] = %s\n", i, argv[i]);
  }
}

void run_command(int argc, char* argv[]) {
  printf("Running the template command\n");
}

