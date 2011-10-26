
all: install

install: install_webserver install_zomlib install_command profile install_zom

clean: clean_zomlib clean_zom clean_command

profile:
	mkdir profile

install_zom:
	cp src/zom.sh bin/zom
	chmod +x bin/zom
#	gcc -std=c99 -Wall src/*.c -o bin/zom

clean_zom:
	-rm bin/zom

install_zomlib:
	cd zomlib && make all
	cp zomlib/bin/libzom.a lib/

clean_zomlib:
	-cd zomlib && make clean
	-rm lib/libzom.a

install_webserver:
	./webserver/install.sh

clean_webserver:
	./webserver/clean.sh

install_command:
	./build_commands.sh command

clean_command:
	./build_commands.sh clean


