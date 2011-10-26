
void register_implement();

void print_complete(int argc, char* argv[]);
void print_description();

void run_command(int argc, char* argv[]);

typedef void(*helpFunc)(int, char**);
int implement_optional_help(helpFunc func);

