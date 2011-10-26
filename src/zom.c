#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <dirent.h>
#include <stdbool.h>

void auto_complete_command(int argc, char* argv[]) {
  char cmd[FILENAME_MAX];
  strcpy(cmd, getenv("ZOM_HOME"));
  strcat(cmd, "/commands");
  DIR *dp;
  struct dirent *ep;     
  dp = opendir (cmd);

  if (dp != NULL)
  {
    readdir (dp); // Skip . & ..
    readdir (dp);

    while (ep = readdir (dp))
      printf("%s ", ep->d_name);

    (void) closedir (dp);
  }
  else
    perror ("Couldn't open the directory");

}

bool command_exists(const char* cmdName) {
  char cmd[FILENAME_MAX];
  strcpy(cmd, getenv("ZOM_HOME"));
  strcat(cmd, "/commands/");
  strcat(cmd, cmdName);
  strcat(cmd, "/bin/command");
  FILE* fp = NULL;

  fp = fopen( cmd, "r" );
  if( fp != NULL ) {
    fclose( fp );
    return true;
  }

  return false;
}

void auto_complete(int argc, char* argv[]) {
  if( argc < 5 && strcmp(getenv("COMP_CWORD"), "1") == 0 ) {
    auto_complete_command(argc, argv);
  } else {
    printf("%s", argv[3]);
    if( argc >= 5 && command_exists(argv[3]) ) {
      printf("exists");
    } else {
      printf("no exists");
    }
  }
}

int main(int argc, char* argv[]) {

  if( argc > 1 && strcmp(argv[1], "-complete") == 0 ) {
    auto_complete(argc, argv);
    return 0;
  }

  for( int i = 0; i < argc; i++ ) {
    printf("%s\n", argv[i]);
  }
  return 0;
}

