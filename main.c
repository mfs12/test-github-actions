#include <stdio.h>

int main(int argc, char *argv[])
{
	printf("hallo world\n");

	printf("args %d\n", argc);
	for (int i = 0; i < argc; i++) {
		printf("arg %d: %s\n", i, argv[i]);
	}

	return 0;
}
