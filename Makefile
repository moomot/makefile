CC=g++
all: prog
prog: main.o loader.o libloader.o run lib.o lib2.o
	${CC} -Wall -c main.c
loader.o: loader.c
	${CC} -Wall -fPIC -c loader.c
libloader.o:
	${CC} -shared -o libloader.so loader.o -ldl
run:
	${CC} main.o -ldl -o run -L. -lloader -Wl,-rpath,.

lib.o:
	${CC} -Wall -fPIC -c lib.c
	${CC} -shared -o lib.so lib.o

lib2.o: 
	${CC} -Wall -fPIC -c lib2.c
	${CC} -shared -o lib2.so lib2.o
	

clean:
	rm -rf *.o
