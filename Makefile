CC := gcc
AR := ar

CFLAGS := -I.
ARFLAGS := rcs
LDFLAGS := -L.
LIBS := -lsicoro

all: libsicoro.a

sicoro.o: sicoro.c
	$(CC) $(CFLAGS) -c -o $@ $<

libsicoro.a: sicoro.o
	$(AR) $(ARFLAGS) $@ $<

test: test.c libsicoro.a
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS) $(LIBS)

clean: FORCE
	rm -f *.o *.a

FORCE: ;