##### Win32 variables #####

WIN32_EXE=dpmaster.exe
WIN32_LDFLAGS=-lwsock32
WIN32_RM=del

##### Unix variables #####

UNIX_EXE=dpmaster
UNIX_LDFLAGS=
UNIX_RM=rm -f

##### Common variables #####

CC=gcc
CFLAGS=-Wall -O2
OBJECTS=dpmaster.o messages.o servers.o

##### Commands #####

.PHONY: all mingw clean win32clean

all:
	$(MAKE) EXE=$(UNIX_EXE) LDFLAGS="$(UNIX_LDFLAGS)" $(UNIX_EXE) 

mingw:
	@$(MAKE) EXE=$(WIN32_EXE) LDFLAGS="$(WIN32_LDFLAGS)" $(WIN32_EXE)

.c.o:
	$(CC) $(CFLAGS) -c $*.c

$(EXE): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	strip $@

clean:
	-$(UNIX_RM) $(WIN32_EXE)
	-$(UNIX_RM) $(UNIX_EXE)
	-$(UNIX_RM) *.o *~

win32clean:
	-$(WIN32_RM) $(WIN32_EXE)
	-$(WIN32_RM) *.o
