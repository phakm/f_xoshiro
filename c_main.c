#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include "c_xoshiro.h"

int main() {

    uint64_t v;
    v = next();
    printf("\n1st value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n2nd value: %" PRId64 "\n", static_cast<int64_t>(v));

    jump();
    v = next();
    printf("\n3rd value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n4th value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n5th value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n6th value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n7th value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n8th value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n9th value: %" PRId64 "\n", static_cast<int64_t>(v));

    v = next();
    printf("\n10th value: %" PRId64 "\n", static_cast<int64_t>(v));

    jump();
    v = next();
    printf("\n11th value: %" PRId64 "\n", static_cast<int64_t>(v));

    jump();
    v = next();
    printf("\n12th value: %" PRId64 "\n", static_cast<int64_t>(v));

    jump();
    v = next();
    printf("\n13th value: %" PRId64 "\n", static_cast<int64_t>(v));

    long_jump();
    v = next();
    printf("\n14th value: %" PRId64 "\n", static_cast<int64_t>(v));

    long_jump();
    v = next();
    printf("\n15th value: %" PRId64 "\n", static_cast<int64_t>(v));

    for (int i = 0; i < 100; ++i)
        long_jump();


    long_jump();
    v = next();
    printf("\n16th value: %" PRId64 "\n", static_cast<int64_t>(v));

   return 0;
}
