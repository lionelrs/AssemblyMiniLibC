#include "../include/minilibc.h"
#include <stdio.h>
#include <string.h>

void test_strlen()
{
    const char* testString = "Hello, World!";
    size_t customLen = my_strlen(testString);
    size_t standardLen = strlen(testString);

    printf("Custom strlen: %zu\n", customLen);
    printf("Standard strlen: %zu\n", standardLen);

    if (customLen == standardLen) {
        printf("Test PASSED\n");
    } else {
        printf("Test FAILED\n");
    }
}