#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MAXLINELEN 128

int main() {
	int its = 0;
	char line[MAXLINELEN];
	char lastline[MAXLINELEN];
	int thislen = 0;
	int thistart = 0;
	while (fgets(line, MAXLINELEN, stdin)) {
		int thelen = strlen(line);
		// Chop the newline off
		line[thelen - 1] = '\0';
		if (its > 0 && *line != *lastline) {
			printf("%s,%i,%i\n", lastline, thistart, thislen);
			thistart = its;
			thislen = 1;
		}
		else {
			thislen++;
		}
		strcpy(lastline, line);
		its++;
	}
	// Handle last group/row
	printf("%s,%i,%i\n", line, thistart, thislen);
}

