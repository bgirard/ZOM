C = gcc
CFLAGS = -g -O2
OBJECTS = bin/zomlib.o

all: zomlib

run: all
	./bin/zomlib

bin:
	mkdir bin

zomlib: $(OBJECTS) bin
	ar rcs bin/libzom.a $(OBJECTS)
#	$(CC) $(CFLAGS) $(OBJECTS) -o bin/zomlib

bin/%.o : src/%.c bin
	$(CC) $(CFLAGS) -Ipublic_include/ -c $< -o $@

clean:
	rm -rf bin

