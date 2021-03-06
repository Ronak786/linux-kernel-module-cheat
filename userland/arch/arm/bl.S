/* https://github.com/cirosantilli/linux-kernel-module-cheat#arm-bl-instruction */

#include <lkmc.h>

LKMC_PROLOGUE
    mov r0, 1
    bl inc
    LKMC_ASSERT_EQ(r0, =2)
LKMC_EPILOGUE

/* void inc(int *i) { (*i)++ } */
inc:
    add r0, 1
    bx lr
