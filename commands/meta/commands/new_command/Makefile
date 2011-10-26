C = gcc
CFLAGS = -g -O2 -I $(ZOM_HOME)/zomlib/public_include/
LIBS = -L$(ZOM_HOME)/zomlib/bin/ -lzom
OBJECTS = bin/command.o

all: command

bin:
	mkdir bin

run: command
	./bin/command

#command : $(OBJECTS) bin
#	$(CC) $(CFLAGS) $(LIBS) $(OBJECTS) -o bin/command

command : bin
	cp src/command.sh bin/command
	cat $(ZOM_HOME)/src/template.sh >> bin/command
	chmod +x bin/command

bin/%.o : src/%.c bin
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf bin

