#ifndef C_XOSHIRO_H
#define C_XOSHIRO_H

static inline uint64_t rotl(const uint64_t x, int k);

uint64_t next(void);

void jump(void);

void long_jump(void);

#endif