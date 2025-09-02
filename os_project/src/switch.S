.global _ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_
.type _ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_, @function
_ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_:
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0) #prvi argument a0

    ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1) #drugi argument a1
    ret