#include <stdio.h>
#include <stdint.h>
#include "c_xoshiro.h"

int main() {
   printf("Hello, World!");

    uint64_t x, k;
    uint64_t res;

    printf("x = 0, k = 0");
    x = 0;
    k = 0;

    res = rotl(x, k);
    printf("Result: %d", res);

   return 0;
}
