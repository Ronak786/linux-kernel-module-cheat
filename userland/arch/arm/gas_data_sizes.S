/* https://github.com/cirosantilli/linux-kernel-module-cheat#gnu-gas-assembler data sizes */

#include <lkmc.h>

.data
mybyte:
    .byte 0x12
myword:
    .word 0x1234
mylong:
    .long 0x12345678
myquad:
    .quad 0x123456789ABCDEF0
myocta:
    .octa 0x123456789ABCDEF0123456789ABCDEF0
theend:
LKMC_PROLOGUE
#define ASSERT_DIFF(label1, label2, result) \
    ldr r0, =label1; \
    ldr r1, =label2; \
    sub r0, r1, r0; \
    LKMC_ASSERT_EQ(r0, =result)

    ASSERT_DIFF(mybyte, myword, 1)
    ASSERT_DIFF(myword, mylong, 4)
    ASSERT_DIFF(mylong, myquad, 4)
    ASSERT_DIFF(myquad, myocta, 8)
    ASSERT_DIFF(myocta, theend, 16)
#undef ASSERT_DIF
LKMC_EPILOGUE
