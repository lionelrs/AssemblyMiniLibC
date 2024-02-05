#include "../include/minilibc.h"
#include <stdio.h>
#include <string.h>

void test_strchr()
{
    const char* s = "Hello, world!";
    int charsToTest[] = { 'H', 'w', '!', 'x', 0 }; // Test cases including the null terminator
    char *result, *expected;
    int i;

    for (i = 0; i < 5; i++) {
        int c = charsToTest[i];

        expected = strchr(s, c);

        result = my_strchr(s, c);

        printf("Testing strchr for '%c':\n", c);
        if (expected == result) {
            printf("  SUCCESS: Both functions returned the same pointer.\n");
        } else {
            printf("  FAILURE: Different results.\n");
        }

        if (result != NULL) {
            printf("  Result string: %s\n", result);
        } else {
            printf("  Character '%c' not found.\n", c);
        }
    }
}