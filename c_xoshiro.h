#ifndef C_XOSHIRO_H
#define C_XOSHIRO_H


#include <stdint.h>

static inline uint64_t rotl(const uint64_t x, int k) {
	return (x << k) | (x >> (64 - k));
}
uint64_t next(void);

void jump(void);

void long_jump(void);

#endif