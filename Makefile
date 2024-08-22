ifneq ($(MSYS),)
    CYGWIN=-lmsys-2.0
    ifneq ("$(wildcard /ucrt64/lib/libucrt.a)",)
        CRT=/ucrt64/lib/libucrt.a
    else ifneq("$(wildcard /clang64/lib/libucrt.a)",)
        CRT=/clang64/lib/libucrt.a
    else
        CRT=/mingw64/lib/libucrt.a
    endif
else
    CYGWIN=-lcygwin
    CRT=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libucrt.a
endif

.PHONY: clean

all: stricmp-example.exe

%.o: %.c Makefile
	gcc -c $<

%.exe: %.o
	ld -o $@ $< /usr/lib/crt0.o $(CYGWIN) -lkernel32 $(CRT)

clean:
	rm -f *.exe *.o
