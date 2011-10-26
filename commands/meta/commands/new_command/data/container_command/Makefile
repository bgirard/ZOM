#C = gcc
#CFLAGS = -g -O2 -I ../../zomlib/public_include/
#LIBS = -L../../zomlib/bin/ -lzom
#OBJECTS = bin/command.o

all: command

bin:
	mkdir bin

run: command
	./bin/command

command : $(OBJECTS) bin
	cp $$ZOM_HOME/src/zom.sh bin/command
	cp $$ZOM_HOME/build_commands.sh .
	make install_command

#bin/%.o : src/%.c bin
#	$(CC) $(CFLAGS) -c $< -o $@

clean: clean_command
	rm -rf bin

install_command:
	./build_commands.sh command

clean_command:
	./build_commands.sh clean


