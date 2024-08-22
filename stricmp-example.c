#include <stdio.h>

// This is a Windows CRT functions defined in "string.h".
int __cdecl stricmp(const char *_Str1,const char *_Str2);

int main(int argc, char **argv) {
    const char *str1 = "hello";
    const char *str2 = "HELLO";

    if (stricmp(str1, str2) == 0) {
	printf("Strings are equal case-insensitively\n");
    } else {
	printf("Strings are not equal case-insensitively\n");
    }

    return 0;
}
