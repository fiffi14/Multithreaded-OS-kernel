
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	26813103          	ld	sp,616(sp) # 8000a268 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	508050ef          	jal	ra,80005524 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv11intpRoutineEv>:
.global _ZN5Riscv11intpRoutineEv
.type _ZN5Riscv11intpRoutineEv, @function
.align 4
_ZN5Riscv11intpRoutineEv:
push:
    addi sp,sp,-256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp) # x2 - sp; automatski ce se restaurirati
    .endr
    80001004:	00113423          	sd	ra,8(sp)
    80001008:	00313c23          	sd	gp,24(sp)
    8000100c:	02413023          	sd	tp,32(sp)
    80001010:	02513423          	sd	t0,40(sp)
    80001014:	02613823          	sd	t1,48(sp)
    80001018:	02713c23          	sd	t2,56(sp)
    8000101c:	04813023          	sd	s0,64(sp)
    80001020:	04913423          	sd	s1,72(sp)
    80001024:	04a13823          	sd	a0,80(sp)
    80001028:	04b13c23          	sd	a1,88(sp)
    8000102c:	06c13023          	sd	a2,96(sp)
    80001030:	06d13423          	sd	a3,104(sp)
    80001034:	06e13823          	sd	a4,112(sp)
    80001038:	06f13c23          	sd	a5,120(sp)
    8000103c:	09013023          	sd	a6,128(sp)
    80001040:	09113423          	sd	a7,136(sp)
    80001044:	09213823          	sd	s2,144(sp)
    80001048:	09313c23          	sd	s3,152(sp)
    8000104c:	0b413023          	sd	s4,160(sp)
    80001050:	0b513423          	sd	s5,168(sp)
    80001054:	0b613823          	sd	s6,176(sp)
    80001058:	0b713c23          	sd	s7,184(sp)
    8000105c:	0d813023          	sd	s8,192(sp)
    80001060:	0d913423          	sd	s9,200(sp)
    80001064:	0da13823          	sd	s10,208(sp)
    80001068:	0db13c23          	sd	s11,216(sp)
    8000106c:	0fc13023          	sd	t3,224(sp)
    80001070:	0fd13423          	sd	t4,232(sp)
    80001074:	0fe13823          	sd	t5,240(sp)
    80001078:	0ff13c23          	sd	t6,248(sp)

    mv a0, sp #argument
    8000107c:	00010513          	mv	a0,sp
    call _ZN6Kernel3TCB7superSPEm
    80001080:	4f5000ef          	jal	ra,80001d74 <_ZN6Kernel3TCB7superSPEm>
    mv t0, a0
    80001084:	00050293          	mv	t0,a0
    ld a0, 80(sp) # kod sistemskog poziva
    80001088:	05013503          	ld	a0,80(sp)
    mv sp, t0 // povr vrednost, sp, novog sistemskog steka ili istog pri ugnz
    8000108c:	00028113          	mv	sp,t0

    call _ZN5Riscv10intpHandleEmmmmm
    80001090:	0d4010ef          	jal	ra,80002164 <_ZN5Riscv10intpHandleEmmmmm>

    mv t0, a0
    80001094:	00050293          	mv	t0,a0
    mv a0, sp
    80001098:	00010513          	mv	a0,sp
    call _ZN6Kernel3TCB6userSPEm
    8000109c:	51d000ef          	jal	ra,80001db8 <_ZN6Kernel3TCB6userSPEm>
    mv sp, a0 // vratiti se na korisnicki
    800010a0:	00050113          	mv	sp,a0
    mv a0, t0 // povr vrednost intpHandler
    800010a4:	00028513          	mv	a0,t0


    csrr t0, scause #ova provera nece biti kod getc zbog onog u riscv.cpp
    800010a8:	142022f3          	csrr	t0,scause
    addi t0, t0, -0x8
    800010ac:	ff828293          	addi	t0,t0,-8
    beqz t0, pop
    800010b0:	00028863          	beqz	t0,800010c0 <pop>
    addi t0, t0, -0x1
    800010b4:	fff28293          	addi	t0,t0,-1
    beqz t0, pop
    800010b8:	00028463          	beqz	t0,800010c0 <pop>
    ld a0, 80(sp) #pop i a0 posto nije bio ecall
    800010bc:	05013503          	ld	a0,80(sp)

00000000800010c0 <pop>:

pop:
    .irp index, 1,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp) #x10 - a0, x2 - sp
    .endr
    800010c0:	00813083          	ld	ra,8(sp)
    800010c4:	01813183          	ld	gp,24(sp)
    800010c8:	02013203          	ld	tp,32(sp)
    800010cc:	02813283          	ld	t0,40(sp)
    800010d0:	03013303          	ld	t1,48(sp)
    800010d4:	03813383          	ld	t2,56(sp)
    800010d8:	04013403          	ld	s0,64(sp)
    800010dc:	04813483          	ld	s1,72(sp)
    800010e0:	05813583          	ld	a1,88(sp)
    800010e4:	06013603          	ld	a2,96(sp)
    800010e8:	06813683          	ld	a3,104(sp)
    800010ec:	07013703          	ld	a4,112(sp)
    800010f0:	07813783          	ld	a5,120(sp)
    800010f4:	08013803          	ld	a6,128(sp)
    800010f8:	08813883          	ld	a7,136(sp)
    800010fc:	09013903          	ld	s2,144(sp)
    80001100:	09813983          	ld	s3,152(sp)
    80001104:	0a013a03          	ld	s4,160(sp)
    80001108:	0a813a83          	ld	s5,168(sp)
    8000110c:	0b013b03          	ld	s6,176(sp)
    80001110:	0b813b83          	ld	s7,184(sp)
    80001114:	0c013c03          	ld	s8,192(sp)
    80001118:	0c813c83          	ld	s9,200(sp)
    8000111c:	0d013d03          	ld	s10,208(sp)
    80001120:	0d813d83          	ld	s11,216(sp)
    80001124:	0e013e03          	ld	t3,224(sp)
    80001128:	0e813e83          	ld	t4,232(sp)
    8000112c:	0f013f03          	ld	t5,240(sp)
    80001130:	0f813f83          	ld	t6,248(sp)
    addi sp,sp,256
    80001134:	10010113          	addi	sp,sp,256

    sret
    80001138:	10200073          	sret

000000008000113c <_ZN5Riscv7syscallEmmmmm>:


.global _ZN5Riscv7syscallEmmmmm
.type _ZN5Riscv7syscallEmmmmm, @function
_ZN5Riscv7syscallEmmmmm:
    ecall
    8000113c:	00000073          	ecall
    ret #samo je obicna fja
    80001140:	00008067          	ret

0000000080001144 <_ZN5Riscv8pushRegsEv>:


.global _ZN5Riscv8pushRegsEv #vec cuvao ra i sp, sto su x1 i x2
.type _ZN5Riscv8pushRegsEv, @function
_ZN5Riscv8pushRegsEv:
    addi sp, sp, -256
    80001144:	f0010113          	addi	sp,sp,-256
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001148:	00313c23          	sd	gp,24(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    80001150:	02513423          	sd	t0,40(sp)
    80001154:	02613823          	sd	t1,48(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    80001160:	04913423          	sd	s1,72(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    80001180:	09113423          	sd	a7,136(sp)
    80001184:	09213823          	sd	s2,144(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)
    ret
    800011bc:	00008067          	ret

00000000800011c0 <_ZN5Riscv7popRegsEv>:
.global _ZN5Riscv7popRegsEv
.type _ZN5Riscv7popRegsEv, @function
_ZN5Riscv7popRegsEv:
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011c0:	01813183          	ld	gp,24(sp)
    800011c4:	02013203          	ld	tp,32(sp)
    800011c8:	02813283          	ld	t0,40(sp)
    800011cc:	03013303          	ld	t1,48(sp)
    800011d0:	03813383          	ld	t2,56(sp)
    800011d4:	04013403          	ld	s0,64(sp)
    800011d8:	04813483          	ld	s1,72(sp)
    800011dc:	05013503          	ld	a0,80(sp)
    800011e0:	05813583          	ld	a1,88(sp)
    800011e4:	06013603          	ld	a2,96(sp)
    800011e8:	06813683          	ld	a3,104(sp)
    800011ec:	07013703          	ld	a4,112(sp)
    800011f0:	07813783          	ld	a5,120(sp)
    800011f4:	08013803          	ld	a6,128(sp)
    800011f8:	08813883          	ld	a7,136(sp)
    800011fc:	09013903          	ld	s2,144(sp)
    80001200:	09813983          	ld	s3,152(sp)
    80001204:	0a013a03          	ld	s4,160(sp)
    80001208:	0a813a83          	ld	s5,168(sp)
    8000120c:	0b013b03          	ld	s6,176(sp)
    80001210:	0b813b83          	ld	s7,184(sp)
    80001214:	0c013c03          	ld	s8,192(sp)
    80001218:	0c813c83          	ld	s9,200(sp)
    8000121c:	0d013d03          	ld	s10,208(sp)
    80001220:	0d813d83          	ld	s11,216(sp)
    80001224:	0e013e03          	ld	t3,224(sp)
    80001228:	0e813e83          	ld	t4,232(sp)
    8000122c:	0f013f03          	ld	t5,240(sp)
    80001230:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001234:	10010113          	addi	sp,sp,256
    80001238:	00008067          	ret
	...

0000000080001248 <_ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_>:
.global _ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_
.type _ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_, @function
_ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_:
    sd ra, 0 * 8(a0)
    80001248:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0) #prvi argument a0
    8000124c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001250:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1) #drugi argument a1
    80001254:	0085b103          	ld	sp,8(a1)
    80001258:	00008067          	ret

000000008000125c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000125c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001260:	00b29a63          	bne	t0,a1,80001274 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001264:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001268:	fe029ae3          	bnez	t0,8000125c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000126c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001270:	00008067          	ret

0000000080001274 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001274:	00100513          	li	a0,1
    80001278:	00008067          	ret

000000008000127c <_Z9mem_allocm>:

#include "../h/syscall_c.h"
#include "../h/riscv.hpp"
#include "../lib/hw.h"

void *mem_alloc(size_t size) {
    8000127c:	ff010113          	addi	sp,sp,-16
    80001280:	00113423          	sd	ra,8(sp)
    80001284:	00813023          	sd	s0,0(sp)
    80001288:	01010413          	addi	s0,sp,16
};


inline size_t Riscv::roundToBlks(size_t size) //od 64B koristi se 48B
{
    size += sizeof(Kernel::MemoryAllocator::BlkHeader);
    8000128c:	01050513          	addi	a0,a0,16
    return size/MEM_BLOCK_SIZE + (size%MEM_BLOCK_SIZE ? 1 : 0);
    80001290:	00655593          	srli	a1,a0,0x6
    80001294:	03f57513          	andi	a0,a0,63
    80001298:	00050463          	beqz	a0,800012a0 <_Z9mem_allocm+0x24>
    8000129c:	00100513          	li	a0,1
    size = Riscv::roundToBlks(size);
    return (void *)Riscv::syscall(0x1, size);
    800012a0:	00000713          	li	a4,0
    800012a4:	00000693          	li	a3,0
    800012a8:	00000613          	li	a2,0
    800012ac:	00a585b3          	add	a1,a1,a0
    800012b0:	00100513          	li	a0,1
    800012b4:	00000097          	auipc	ra,0x0
    800012b8:	e88080e7          	jalr	-376(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    800012bc:	00813083          	ld	ra,8(sp)
    800012c0:	00013403          	ld	s0,0(sp)
    800012c4:	01010113          	addi	sp,sp,16
    800012c8:	00008067          	ret

00000000800012cc <_Z8mem_freePv>:

int mem_free(void *addr) {
    800012cc:	ff010113          	addi	sp,sp,-16
    800012d0:	00113423          	sd	ra,8(sp)
    800012d4:	00813023          	sd	s0,0(sp)
    800012d8:	01010413          	addi	s0,sp,16
    800012dc:	00050593          	mv	a1,a0
    return (int) Riscv::syscall(0x2, (uint64) addr);
    800012e0:	00000713          	li	a4,0
    800012e4:	00000693          	li	a3,0
    800012e8:	00000613          	li	a2,0
    800012ec:	00200513          	li	a0,2
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	e4c080e7          	jalr	-436(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    800012f8:	0005051b          	sext.w	a0,a0
    800012fc:	00813083          	ld	ra,8(sp)
    80001300:	00013403          	ld	s0,0(sp)
    80001304:	01010113          	addi	sp,sp,16
    80001308:	00008067          	ret

000000008000130c <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    8000130c:	fd010113          	addi	sp,sp,-48
    80001310:	02113423          	sd	ra,40(sp)
    80001314:	02813023          	sd	s0,32(sp)
    80001318:	00913c23          	sd	s1,24(sp)
    8000131c:	01213823          	sd	s2,16(sp)
    80001320:	01313423          	sd	s3,8(sp)
    80001324:	03010413          	addi	s0,sp,48
    80001328:	00050493          	mv	s1,a0
    8000132c:	00058913          	mv	s2,a1
    80001330:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001334:	00001537          	lui	a0,0x1
    80001338:	00000097          	auipc	ra,0x0
    8000133c:	f44080e7          	jalr	-188(ra) # 8000127c <_Z9mem_allocm>
    80001340:	00050713          	mv	a4,a0
    return Riscv::syscall(0x11, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
    80001344:	00098693          	mv	a3,s3
    80001348:	00090613          	mv	a2,s2
    8000134c:	00048593          	mv	a1,s1
    80001350:	01100513          	li	a0,17
    80001354:	00000097          	auipc	ra,0x0
    80001358:	de8080e7          	jalr	-536(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    8000135c:	0005051b          	sext.w	a0,a0
    80001360:	02813083          	ld	ra,40(sp)
    80001364:	02013403          	ld	s0,32(sp)
    80001368:	01813483          	ld	s1,24(sp)
    8000136c:	01013903          	ld	s2,16(sp)
    80001370:	00813983          	ld	s3,8(sp)
    80001374:	03010113          	addi	sp,sp,48
    80001378:	00008067          	ret

000000008000137c <_Z11thread_exitv>:

int thread_exit() {
    8000137c:	ff010113          	addi	sp,sp,-16
    80001380:	00113423          	sd	ra,8(sp)
    80001384:	00813023          	sd	s0,0(sp)
    80001388:	01010413          	addi	s0,sp,16
    Riscv::syscall(0x12);
    8000138c:	00000713          	li	a4,0
    80001390:	00000693          	li	a3,0
    80001394:	00000613          	li	a2,0
    80001398:	00000593          	li	a1,0
    8000139c:	01200513          	li	a0,18
    800013a0:	00000097          	auipc	ra,0x0
    800013a4:	d9c080e7          	jalr	-612(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
    return 0;

}
    800013a8:	00000513          	li	a0,0
    800013ac:	00813083          	ld	ra,8(sp)
    800013b0:	00013403          	ld	s0,0(sp)
    800013b4:	01010113          	addi	sp,sp,16
    800013b8:	00008067          	ret

00000000800013bc <_Z15thread_dispatchv>:

void thread_dispatch() {
    800013bc:	ff010113          	addi	sp,sp,-16
    800013c0:	00113423          	sd	ra,8(sp)
    800013c4:	00813023          	sd	s0,0(sp)
    800013c8:	01010413          	addi	s0,sp,16
    Riscv::syscall(0x13);
    800013cc:	00000713          	li	a4,0
    800013d0:	00000693          	li	a3,0
    800013d4:	00000613          	li	a2,0
    800013d8:	00000593          	li	a1,0
    800013dc:	01300513          	li	a0,19
    800013e0:	00000097          	auipc	ra,0x0
    800013e4:	d5c080e7          	jalr	-676(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    800013e8:	00813083          	ld	ra,8(sp)
    800013ec:	00013403          	ld	s0,0(sp)
    800013f0:	01010113          	addi	sp,sp,16
    800013f4:	00008067          	ret

00000000800013f8 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    800013f8:	ff010113          	addi	sp,sp,-16
    800013fc:	00113423          	sd	ra,8(sp)
    80001400:	00813023          	sd	s0,0(sp)
    80001404:	01010413          	addi	s0,sp,16
    return Riscv::syscall(0x21, (uint64) handle, (uint64) init);
    80001408:	00000713          	li	a4,0
    8000140c:	00000693          	li	a3,0
    80001410:	02059613          	slli	a2,a1,0x20
    80001414:	02065613          	srli	a2,a2,0x20
    80001418:	00050593          	mv	a1,a0
    8000141c:	02100513          	li	a0,33
    80001420:	00000097          	auipc	ra,0x0
    80001424:	d1c080e7          	jalr	-740(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    80001428:	0005051b          	sext.w	a0,a0
    8000142c:	00813083          	ld	ra,8(sp)
    80001430:	00013403          	ld	s0,0(sp)
    80001434:	01010113          	addi	sp,sp,16
    80001438:	00008067          	ret

000000008000143c <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    8000143c:	ff010113          	addi	sp,sp,-16
    80001440:	00113423          	sd	ra,8(sp)
    80001444:	00813023          	sd	s0,0(sp)
    80001448:	01010413          	addi	s0,sp,16
    8000144c:	00050593          	mv	a1,a0
    return Riscv::syscall(0x22, (uint64) handle);
    80001450:	00000713          	li	a4,0
    80001454:	00000693          	li	a3,0
    80001458:	00000613          	li	a2,0
    8000145c:	02200513          	li	a0,34
    80001460:	00000097          	auipc	ra,0x0
    80001464:	cdc080e7          	jalr	-804(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    80001468:	0005051b          	sext.w	a0,a0
    8000146c:	00813083          	ld	ra,8(sp)
    80001470:	00013403          	ld	s0,0(sp)
    80001474:	01010113          	addi	sp,sp,16
    80001478:	00008067          	ret

000000008000147c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    8000147c:	ff010113          	addi	sp,sp,-16
    80001480:	00113423          	sd	ra,8(sp)
    80001484:	00813023          	sd	s0,0(sp)
    80001488:	01010413          	addi	s0,sp,16
    8000148c:	00050593          	mv	a1,a0
    return Riscv::syscall(0x23, (uint64) id);
    80001490:	00000713          	li	a4,0
    80001494:	00000693          	li	a3,0
    80001498:	00000613          	li	a2,0
    8000149c:	02300513          	li	a0,35
    800014a0:	00000097          	auipc	ra,0x0
    800014a4:	c9c080e7          	jalr	-868(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    800014a8:	0005051b          	sext.w	a0,a0
    800014ac:	00813083          	ld	ra,8(sp)
    800014b0:	00013403          	ld	s0,0(sp)
    800014b4:	01010113          	addi	sp,sp,16
    800014b8:	00008067          	ret

00000000800014bc <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800014bc:	ff010113          	addi	sp,sp,-16
    800014c0:	00113423          	sd	ra,8(sp)
    800014c4:	00813023          	sd	s0,0(sp)
    800014c8:	01010413          	addi	s0,sp,16
    800014cc:	00050593          	mv	a1,a0
    return Riscv::syscall(0x24, (uint64) id);
    800014d0:	00000713          	li	a4,0
    800014d4:	00000693          	li	a3,0
    800014d8:	00000613          	li	a2,0
    800014dc:	02400513          	li	a0,36
    800014e0:	00000097          	auipc	ra,0x0
    800014e4:	c5c080e7          	jalr	-932(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    800014e8:	0005051b          	sext.w	a0,a0
    800014ec:	00813083          	ld	ra,8(sp)
    800014f0:	00013403          	ld	s0,0(sp)
    800014f4:	01010113          	addi	sp,sp,16
    800014f8:	00008067          	ret

00000000800014fc <_Z11sem_trywaitP4_sem>:

int sem_trywait(sem_t id) {
    800014fc:	ff010113          	addi	sp,sp,-16
    80001500:	00113423          	sd	ra,8(sp)
    80001504:	00813023          	sd	s0,0(sp)
    80001508:	01010413          	addi	s0,sp,16
    8000150c:	00050593          	mv	a1,a0
    return Riscv::syscall(0x26, (uint64) id);
    80001510:	00000713          	li	a4,0
    80001514:	00000693          	li	a3,0
    80001518:	00000613          	li	a2,0
    8000151c:	02600513          	li	a0,38
    80001520:	00000097          	auipc	ra,0x0
    80001524:	c1c080e7          	jalr	-996(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    80001528:	0005051b          	sext.w	a0,a0
    8000152c:	00813083          	ld	ra,8(sp)
    80001530:	00013403          	ld	s0,0(sp)
    80001534:	01010113          	addi	sp,sp,16
    80001538:	00008067          	ret

000000008000153c <_Z4putcc>:

void putc(char c) {
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00113423          	sd	ra,8(sp)
    80001544:	00813023          	sd	s0,0(sp)
    80001548:	01010413          	addi	s0,sp,16
    8000154c:	00050593          	mv	a1,a0
    Riscv::syscall(0x42, c);
    80001550:	00000713          	li	a4,0
    80001554:	00000693          	li	a3,0
    80001558:	00000613          	li	a2,0
    8000155c:	04200513          	li	a0,66
    80001560:	00000097          	auipc	ra,0x0
    80001564:	bdc080e7          	jalr	-1060(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    80001568:	00813083          	ld	ra,8(sp)
    8000156c:	00013403          	ld	s0,0(sp)
    80001570:	01010113          	addi	sp,sp,16
    80001574:	00008067          	ret

0000000080001578 <_Z4getcv>:

char getc() {
    80001578:	ff010113          	addi	sp,sp,-16
    8000157c:	00113423          	sd	ra,8(sp)
    80001580:	00813023          	sd	s0,0(sp)
    80001584:	01010413          	addi	s0,sp,16
    return Riscv::syscall(0x41);
    80001588:	00000713          	li	a4,0
    8000158c:	00000693          	li	a3,0
    80001590:	00000613          	li	a2,0
    80001594:	00000593          	li	a1,0
    80001598:	04100513          	li	a0,65
    8000159c:	00000097          	auipc	ra,0x0
    800015a0:	ba0080e7          	jalr	-1120(ra) # 8000113c <_ZN5Riscv7syscallEmmmmm>
}
    800015a4:	0ff57513          	andi	a0,a0,255
    800015a8:	00813083          	ld	ra,8(sp)
    800015ac:	00013403          	ld	s0,0(sp)
    800015b0:	01010113          	addi	sp,sp,16
    800015b4:	00008067          	ret

00000000800015b8 <_ZN6Kernel9SemaphorenwEm>:
    //     //printString("out deblock\n");
    // }



    void *Semaphore::operator new(uint64 s) {
    800015b8:	ff010113          	addi	sp,sp,-16
    800015bc:	00113423          	sd	ra,8(sp)
    800015c0:	00813023          	sd	s0,0(sp)
    800015c4:	01010413          	addi	s0,sp,16
    size += sizeof(Kernel::MemoryAllocator::BlkHeader);
    800015c8:	01050513          	addi	a0,a0,16 # 1010 <_entry-0x7fffeff0>
    return size/MEM_BLOCK_SIZE + (size%MEM_BLOCK_SIZE ? 1 : 0);
    800015cc:	00655793          	srli	a5,a0,0x6
    800015d0:	03f57513          	andi	a0,a0,63
    800015d4:	00050463          	beqz	a0,800015dc <_ZN6Kernel9SemaphorenwEm+0x24>
    800015d8:	00100513          	li	a0,1
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    800015dc:	00a78533          	add	a0,a5,a0
    800015e0:	00001097          	auipc	ra,0x1
    800015e4:	e88080e7          	jalr	-376(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    }
    800015e8:	00813083          	ld	ra,8(sp)
    800015ec:	00013403          	ld	s0,0(sp)
    800015f0:	01010113          	addi	sp,sp,16
    800015f4:	00008067          	ret

00000000800015f8 <_ZN6Kernel9SemaphorenaEm>:

    void *Semaphore::operator new [](uint64 s) {
    800015f8:	ff010113          	addi	sp,sp,-16
    800015fc:	00113423          	sd	ra,8(sp)
    80001600:	00813023          	sd	s0,0(sp)
    80001604:	01010413          	addi	s0,sp,16
    size += sizeof(Kernel::MemoryAllocator::BlkHeader);
    80001608:	01050513          	addi	a0,a0,16
    return size/MEM_BLOCK_SIZE + (size%MEM_BLOCK_SIZE ? 1 : 0);
    8000160c:	00655793          	srli	a5,a0,0x6
    80001610:	03f57513          	andi	a0,a0,63
    80001614:	00050463          	beqz	a0,8000161c <_ZN6Kernel9SemaphorenaEm+0x24>
    80001618:	00100513          	li	a0,1
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    8000161c:	00a78533          	add	a0,a5,a0
    80001620:	00001097          	auipc	ra,0x1
    80001624:	e48080e7          	jalr	-440(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    }
    80001628:	00813083          	ld	ra,8(sp)
    8000162c:	00013403          	ld	s0,0(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00008067          	ret

0000000080001638 <_ZN6Kernel9SemaphoredlEPv>:

    void Semaphore::operator delete(void *p) noexcept {
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00113423          	sd	ra,8(sp)
    80001640:	00813023          	sd	s0,0(sp)
    80001644:	01010413          	addi	s0,sp,16
        MemoryAllocator::__mem__free(p);
    80001648:	00001097          	auipc	ra,0x1
    8000164c:	ec4080e7          	jalr	-316(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    }
    80001650:	00813083          	ld	ra,8(sp)
    80001654:	00013403          	ld	s0,0(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret

0000000080001660 <_ZN6Kernel9SemaphoredaEPv>:

    void Semaphore::operator delete [](void *p) noexcept {
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00113423          	sd	ra,8(sp)
    80001668:	00813023          	sd	s0,0(sp)
    8000166c:	01010413          	addi	s0,sp,16
        MemoryAllocator::__mem__free(p);
    80001670:	00001097          	auipc	ra,0x1
    80001674:	e9c080e7          	jalr	-356(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    }
    80001678:	00813083          	ld	ra,8(sp)
    8000167c:	00013403          	ld	s0,0(sp)
    80001680:	01010113          	addi	sp,sp,16
    80001684:	00008067          	ret

0000000080001688 <_ZN6Kernel9Semaphore4openEj>:

    Semaphore *Semaphore::open(unsigned init) {
    80001688:	fe010113          	addi	sp,sp,-32
    8000168c:	00113c23          	sd	ra,24(sp)
    80001690:	00813823          	sd	s0,16(sp)
    80001694:	00913423          	sd	s1,8(sp)
    80001698:	02010413          	addi	s0,sp,32
    8000169c:	00050493          	mv	s1,a0
            return new Semaphore(init);
    800016a0:	01800513          	li	a0,24
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	f14080e7          	jalr	-236(ra) # 800015b8 <_ZN6Kernel9SemaphorenwEm>
        };

        Elem *head, *tail;

    public:
        List() : head(0), tail(0) {}
    800016ac:	00053023          	sd	zero,0(a0)
    800016b0:	00053423          	sd	zero,8(a0)

class Semaphore {


public:
    Semaphore(unsigned val=0):   blockedQ(), closed(false), value(val) {}
    800016b4:	00050823          	sb	zero,16(a0)
    800016b8:	0004849b          	sext.w	s1,s1
    800016bc:	00952a23          	sw	s1,20(a0)
    }
    800016c0:	01813083          	ld	ra,24(sp)
    800016c4:	01013403          	ld	s0,16(sp)
    800016c8:	00813483          	ld	s1,8(sp)
    800016cc:	02010113          	addi	sp,sp,32
    800016d0:	00008067          	ret

00000000800016d4 <_ZN6Kernel9Semaphore5closeEv>:

    int Semaphore::close() {
    800016d4:	fe010113          	addi	sp,sp,-32
    800016d8:	00113c23          	sd	ra,24(sp)
    800016dc:	00813823          	sd	s0,16(sp)
    800016e0:	00913423          	sd	s1,8(sp)
    800016e4:	01213023          	sd	s2,0(sp)
    800016e8:	02010413          	addi	s0,sp,32
    800016ec:	00050913          	mv	s2,a0
        if(closed) return -1;
    800016f0:	01054783          	lbu	a5,16(a0)
    800016f4:	0ff7f793          	andi	a5,a5,255
    800016f8:	02078863          	beqz	a5,80001728 <_ZN6Kernel9Semaphore5closeEv+0x54>
    800016fc:	fff00513          	li	a0,-1
    80001700:	04c0006f          	j	8000174c <_ZN6Kernel9Semaphore5closeEv+0x78>
        T *removeFirst() {
            if (!head) { return 0; }

            Elem *elem = head;
            head = head->next;
            if (!head) { tail = 0; }
    80001704:	00093423          	sd	zero,8(s2)

            T *ret = elem->data;
    80001708:	00053483          	ld	s1,0(a0)
                MemoryAllocator::__mem__free(p);
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	e00080e7          	jalr	-512(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
        TCB *tmp;
        while((tmp=blockedQ.removeFirst())!=nullptr) {
    80001714:	02048663          	beqz	s1,80001740 <_ZN6Kernel9Semaphore5closeEv+0x6c>
  static void dispatch();

  static TCB *createThread(Body body, void *arg, uint64 *stack); //*

  bool isBlocked() const { return blocked; }
  void setBlocked(bool b) { blocked = b; }
    80001718:	04048023          	sb	zero,64(s1)
            tmp->setBlocked(false);
            Scheduler::put(tmp);
    8000171c:	00048513          	mv	a0,s1
    80001720:	00001097          	auipc	ra,0x1
    80001724:	f58080e7          	jalr	-168(ra) # 80002678 <_ZN6Kernel9Scheduler3putEPNS_3TCBE>
            if (!head) { return 0; }
    80001728:	00093503          	ld	a0,0(s2)
    8000172c:	00050a63          	beqz	a0,80001740 <_ZN6Kernel9Semaphore5closeEv+0x6c>
            head = head->next;
    80001730:	00853783          	ld	a5,8(a0)
    80001734:	00f93023          	sd	a5,0(s2)
            if (!head) { tail = 0; }
    80001738:	fc0798e3          	bnez	a5,80001708 <_ZN6Kernel9Semaphore5closeEv+0x34>
    8000173c:	fc9ff06f          	j	80001704 <_ZN6Kernel9Semaphore5closeEv+0x30>
        }
        closed=true;
    80001740:	00100793          	li	a5,1
    80001744:	00f90823          	sb	a5,16(s2)
        return 0;
    80001748:	00000513          	li	a0,0
    }
    8000174c:	01813083          	ld	ra,24(sp)
    80001750:	01013403          	ld	s0,16(sp)
    80001754:	00813483          	ld	s1,8(sp)
    80001758:	00013903          	ld	s2,0(sp)
    8000175c:	02010113          	addi	sp,sp,32
    80001760:	00008067          	ret

0000000080001764 <_ZN6Kernel9Semaphore4waitEv>:

    int Semaphore::wait() {
        if(closed) return -1;
    80001764:	01054783          	lbu	a5,16(a0)
    80001768:	0ff7f793          	andi	a5,a5,255
    8000176c:	0a079863          	bnez	a5,8000181c <_ZN6Kernel9Semaphore4waitEv+0xb8>
    int Semaphore::wait() {
    80001770:	fe010113          	addi	sp,sp,-32
    80001774:	00113c23          	sd	ra,24(sp)
    80001778:	00813823          	sd	s0,16(sp)
    8000177c:	00913423          	sd	s1,8(sp)
    80001780:	01213023          	sd	s2,0(sp)
    80001784:	02010413          	addi	s0,sp,32
    80001788:	00050493          	mv	s1,a0
        if (--value < 0) {
    8000178c:	01452783          	lw	a5,20(a0)
    80001790:	fff7879b          	addiw	a5,a5,-1
    80001794:	00f52a23          	sw	a5,20(a0)
    80001798:	02079713          	slli	a4,a5,0x20
    8000179c:	02074063          	bltz	a4,800017bc <_ZN6Kernel9Semaphore4waitEv+0x58>
            blockedQ.addLast(TCB::running);
            TCB::running->setBlocked(true);
            TCB::dispatch();

        }
        return 0;
    800017a0:	00000513          	li	a0,0

    }
    800017a4:	01813083          	ld	ra,24(sp)
    800017a8:	01013403          	ld	s0,16(sp)
    800017ac:	00813483          	ld	s1,8(sp)
    800017b0:	00013903          	ld	s2,0(sp)
    800017b4:	02010113          	addi	sp,sp,32
    800017b8:	00008067          	ret
            blockedQ.addLast(TCB::running);
    800017bc:	00009797          	auipc	a5,0x9
    800017c0:	ac47b783          	ld	a5,-1340(a5) # 8000a280 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017c4:	0007b903          	ld	s2,0(a5)
                return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(n));
    800017c8:	00100513          	li	a0,1
    800017cc:	00001097          	auipc	ra,0x1
    800017d0:	c9c080e7          	jalr	-868(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
            Elem(T *data, Elem *next) : data(data), next(next) {}
    800017d4:	01253023          	sd	s2,0(a0)
    800017d8:	00053423          	sd	zero,8(a0)
            if (tail) {
    800017dc:	0084b783          	ld	a5,8(s1)
    800017e0:	02078863          	beqz	a5,80001810 <_ZN6Kernel9Semaphore4waitEv+0xac>
                tail->next = elem;
    800017e4:	00a7b423          	sd	a0,8(a5)
                tail = elem;
    800017e8:	00a4b423          	sd	a0,8(s1)
            TCB::running->setBlocked(true);
    800017ec:	00009797          	auipc	a5,0x9
    800017f0:	a947b783          	ld	a5,-1388(a5) # 8000a280 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017f4:	0007b783          	ld	a5,0(a5)
    800017f8:	00100713          	li	a4,1
    800017fc:	04e78023          	sb	a4,64(a5)
            TCB::dispatch();
    80001800:	00000097          	auipc	ra,0x0
    80001804:	39c080e7          	jalr	924(ra) # 80001b9c <_ZN6Kernel3TCB8dispatchEv>
        return 0;
    80001808:	00000513          	li	a0,0
    8000180c:	f99ff06f          	j	800017a4 <_ZN6Kernel9Semaphore4waitEv+0x40>
                head = tail = elem;
    80001810:	00a4b423          	sd	a0,8(s1)
    80001814:	00a4b023          	sd	a0,0(s1)
    80001818:	fd5ff06f          	j	800017ec <_ZN6Kernel9Semaphore4waitEv+0x88>
        if(closed) return -1;
    8000181c:	fff00513          	li	a0,-1
    }
    80001820:	00008067          	ret

0000000080001824 <_ZN6Kernel9Semaphore6signalEv>:

    int Semaphore::signal() {
        if (closed) return -1;
    80001824:	01054703          	lbu	a4,16(a0)
    80001828:	0ff77713          	andi	a4,a4,255
    8000182c:	08071863          	bnez	a4,800018bc <_ZN6Kernel9Semaphore6signalEv+0x98>
    80001830:	00050793          	mv	a5,a0
        //printString("signal: "); printInt(value,10,1); printString("\n");
        if(++value<=0) {
    80001834:	01452703          	lw	a4,20(a0)
    80001838:	0017071b          	addiw	a4,a4,1
    8000183c:	0007069b          	sext.w	a3,a4
    80001840:	00e52a23          	sw	a4,20(a0)
    80001844:	00d05663          	blez	a3,80001850 <_ZN6Kernel9Semaphore6signalEv+0x2c>
            //if(!fifu) return -1;
            fifu->setBlocked(false);
            Scheduler::put(fifu);
        }

        return 0;
    80001848:	00000513          	li	a0,0
    }
    8000184c:	00008067          	ret
    int Semaphore::signal() {
    80001850:	fe010113          	addi	sp,sp,-32
    80001854:	00113c23          	sd	ra,24(sp)
    80001858:	00813823          	sd	s0,16(sp)
    8000185c:	00913423          	sd	s1,8(sp)
    80001860:	02010413          	addi	s0,sp,32
            if (!head) { return 0; }
    80001864:	00053503          	ld	a0,0(a0)
    80001868:	04050663          	beqz	a0,800018b4 <_ZN6Kernel9Semaphore6signalEv+0x90>
            head = head->next;
    8000186c:	00853703          	ld	a4,8(a0)
    80001870:	00e7b023          	sd	a4,0(a5)
            if (!head) { tail = 0; }
    80001874:	02070c63          	beqz	a4,800018ac <_ZN6Kernel9Semaphore6signalEv+0x88>
            T *ret = elem->data;
    80001878:	00053483          	ld	s1,0(a0)
                MemoryAllocator::__mem__free(p);
    8000187c:	00001097          	auipc	ra,0x1
    80001880:	c90080e7          	jalr	-880(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    80001884:	04048023          	sb	zero,64(s1)
            Scheduler::put(fifu);
    80001888:	00048513          	mv	a0,s1
    8000188c:	00001097          	auipc	ra,0x1
    80001890:	dec080e7          	jalr	-532(ra) # 80002678 <_ZN6Kernel9Scheduler3putEPNS_3TCBE>
        return 0;
    80001894:	00000513          	li	a0,0
    }
    80001898:	01813083          	ld	ra,24(sp)
    8000189c:	01013403          	ld	s0,16(sp)
    800018a0:	00813483          	ld	s1,8(sp)
    800018a4:	02010113          	addi	sp,sp,32
    800018a8:	00008067          	ret
            if (!head) { tail = 0; }
    800018ac:	0007b423          	sd	zero,8(a5)
    800018b0:	fc9ff06f          	j	80001878 <_ZN6Kernel9Semaphore6signalEv+0x54>
            if (!head) { return 0; }
    800018b4:	00050493          	mv	s1,a0
    800018b8:	fcdff06f          	j	80001884 <_ZN6Kernel9Semaphore6signalEv+0x60>
        if (closed) return -1;
    800018bc:	fff00513          	li	a0,-1
    800018c0:	00008067          	ret

00000000800018c4 <_ZN6Kernel9Semaphore7tryWaitEv>:

    int Semaphore::tryWait() {
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00813423          	sd	s0,8(sp)
    800018cc:	01010413          	addi	s0,sp,16
        if(closed) return 0;
    800018d0:	01054783          	lbu	a5,16(a0)
    800018d4:	0ff7f793          	andi	a5,a5,255
    800018d8:	02079a63          	bnez	a5,8000190c <_ZN6Kernel9Semaphore7tryWaitEv+0x48>
        if(value>0) {
    800018dc:	01452783          	lw	a5,20(a0)
    800018e0:	0007879b          	sext.w	a5,a5
    800018e4:	00f04a63          	bgtz	a5,800018f8 <_ZN6Kernel9Semaphore7tryWaitEv+0x34>
            value--;
            return 1;
        }
        return -1;
    800018e8:	fff00513          	li	a0,-1
    }
    800018ec:	00813403          	ld	s0,8(sp)
    800018f0:	01010113          	addi	sp,sp,16
    800018f4:	00008067          	ret
            value--;
    800018f8:	01452783          	lw	a5,20(a0)
    800018fc:	fff7879b          	addiw	a5,a5,-1
    80001900:	00f52a23          	sw	a5,20(a0)
            return 1;
    80001904:	00100513          	li	a0,1
    80001908:	fe5ff06f          	j	800018ec <_ZN6Kernel9Semaphore7tryWaitEv+0x28>
        if(closed) return 0;
    8000190c:	00000513          	li	a0,0
    80001910:	fddff06f          	j	800018ec <_ZN6Kernel9Semaphore7tryWaitEv+0x28>

0000000080001914 <_Z10userMainWrPv>:
using namespace Kernel;

void userMain();
int guard = 0;

void userMainWr(void*) {
    80001914:	ff010113          	addi	sp,sp,-16
    80001918:	00113423          	sd	ra,8(sp)
    8000191c:	00813023          	sd	s0,0(sp)
    80001920:	01010413          	addi	s0,sp,16
    userMain();
    80001924:	00003097          	auipc	ra,0x3
    80001928:	1b0080e7          	jalr	432(ra) # 80004ad4 <_Z8userMainv>
    guard = 1;
    8000192c:	00100793          	li	a5,1
    80001930:	00009717          	auipc	a4,0x9
    80001934:	9af72023          	sw	a5,-1632(a4) # 8000a2d0 <guard>
}
    80001938:	00813083          	ld	ra,8(sp)
    8000193c:	00013403          	ld	s0,0(sp)
    80001940:	01010113          	addi	sp,sp,16
    80001944:	00008067          	ret

0000000080001948 <main>:

void main() {
    80001948:	ff010113          	addi	sp,sp,-16
    8000194c:	00113423          	sd	ra,8(sp)
    80001950:	00813023          	sd	s0,0(sp)
    80001954:	01010413          	addi	s0,sp,16
    MemoryAllocator::init();
    80001958:	00001097          	auipc	ra,0x1
    8000195c:	aac080e7          	jalr	-1364(ra) # 80002404 <_ZN6Kernel15MemoryAllocator4initEv>

    Riscv::w_stvec((uint64) &Riscv::intpRoutine);
    80001960:	00009797          	auipc	a5,0x9
    80001964:	9107b783          	ld	a5,-1776(a5) # 8000a270 <_GLOBAL_OFFSET_TABLE_+0x18>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001968:	10579073          	csrw	stvec,a5
    TCB *mainTCB = TCB::createThread(nullptr,nullptr,nullptr);
    8000196c:	00000613          	li	a2,0
    80001970:	00000593          	li	a1,0
    80001974:	00000513          	li	a0,0
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	340080e7          	jalr	832(ra) # 80001cb8 <_ZN6Kernel3TCB12createThreadEPFvPvES1_Pm>
    TCB::running = mainTCB;
    80001980:	00009797          	auipc	a5,0x9
    80001984:	9007b783          	ld	a5,-1792(a5) # 8000a280 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001988:	00a7b023          	sd	a0,0(a5)

    uint64 *sp = (uint64*)MemoryAllocator::__mem__alloc(DEFAULT_STACK_SIZE);
    8000198c:	00001537          	lui	a0,0x1
    80001990:	00001097          	auipc	ra,0x1
    80001994:	ad8080e7          	jalr	-1320(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    80001998:	00050613          	mv	a2,a0
    TCB::createThread(userMainWr,nullptr,sp);
    8000199c:	00000593          	li	a1,0
    800019a0:	00000517          	auipc	a0,0x0
    800019a4:	f7450513          	addi	a0,a0,-140 # 80001914 <_Z10userMainWrPv>
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	310080e7          	jalr	784(ra) # 80001cb8 <_ZN6Kernel3TCB12createThreadEPFvPvES1_Pm>
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800019b0:	00200793          	li	a5,2
    800019b4:	1007a073          	csrs	sstatus,a5


    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);


    while(!guard) {
    800019b8:	00009797          	auipc	a5,0x9
    800019bc:	9187a783          	lw	a5,-1768(a5) # 8000a2d0 <guard>
    800019c0:	00079863          	bnez	a5,800019d0 <main+0x88>
        thread_dispatch();
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	9f8080e7          	jalr	-1544(ra) # 800013bc <_Z15thread_dispatchv>
    while(!guard) {
    800019cc:	fedff06f          	j	800019b8 <main+0x70>
    }
    //delete mainTCB;
    printString("main gotov\n");
    800019d0:	00006517          	auipc	a0,0x6
    800019d4:	65050513          	addi	a0,a0,1616 # 80008020 <CONSOLE_STATUS+0x10>
    800019d8:	00003097          	auipc	ra,0x3
    800019dc:	a34080e7          	jalr	-1484(ra) # 8000440c <_Z11printStringPKc>
    /*if(a<0) {
        __putc('-'); __putc('\n');
    } else {
        __putc('+'); __putc('\n');
    }*/
    800019e0:	00813083          	ld	ra,8(sp)
    800019e4:	00013403          	ld	s0,0(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret

00000000800019f0 <_ZN6Kernel3TCB10thrWrapperEv>:
            yield(oldR, running);
        }

    }

    void TCB::thrWrapper() {
    800019f0:	fe010113          	addi	sp,sp,-32
    800019f4:	00113c23          	sd	ra,24(sp)
    800019f8:	00813823          	sd	s0,16(sp)
    800019fc:	00913423          	sd	s1,8(sp)
    80001a00:	02010413          	addi	s0,sp,32
        Riscv::popSppSpie(); //popovanje sadrzaja sstatus registra zbog promene privilegije
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	738080e7          	jalr	1848(ra) # 8000213c <_ZN5Riscv10popSppSpieEv>
        running->body(running->arg); //za sve niti ce ovo raditi kada krecu, pa mora kroz running
    80001a0c:	00009497          	auipc	s1,0x9
    80001a10:	8cc48493          	addi	s1,s1,-1844 # 8000a2d8 <_ZN6Kernel3TCB7runningE>
    80001a14:	0004b783          	ld	a5,0(s1)
    80001a18:	0007b703          	ld	a4,0(a5)
    80001a1c:	0087b503          	ld	a0,8(a5)
    80001a20:	000700e7          	jalr	a4
        running->setFinished(true);
    80001a24:	0004b783          	ld	a5,0(s1)
  void setFinished(bool b) { finished = b; }
    80001a28:	00100713          	li	a4,1
    80001a2c:	02e78423          	sb	a4,40(a5)
        thread_exit();
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	94c080e7          	jalr	-1716(ra) # 8000137c <_Z11thread_exitv>
    }
    80001a38:	01813083          	ld	ra,24(sp)
    80001a3c:	01013403          	ld	s0,16(sp)
    80001a40:	00813483          	ld	s1,8(sp)
    80001a44:	02010113          	addi	sp,sp,32
    80001a48:	00008067          	ret

0000000080001a4c <_ZN6Kernel3TCBC1EPFvPvES1_Pm>:
    TCB::TCB(Body b, void *arg, uint64 *stack) :
    80001a4c:	fe010113          	addi	sp,sp,-32
    80001a50:	00113c23          	sd	ra,24(sp)
    80001a54:	00813823          	sd	s0,16(sp)
    80001a58:	00913423          	sd	s1,8(sp)
    80001a5c:	02010413          	addi	s0,sp,32
    80001a60:	00050493          	mv	s1,a0
        blocked(false)
    80001a64:	00b53023          	sd	a1,0(a0)
    80001a68:	00c53423          	sd	a2,8(a0)
    80001a6c:	00d53823          	sd	a3,16(a0)
    80001a70:	00000797          	auipc	a5,0x0
    80001a74:	f8078793          	addi	a5,a5,-128 # 800019f0 <_ZN6Kernel3TCB10thrWrapperEv>
    80001a78:	00f53c23          	sd	a5,24(a0)
         stack != nullptr? (uint64) &stack[DEFAULT_STACK_SIZE]:0
    80001a7c:	06068063          	beqz	a3,80001adc <_ZN6Kernel3TCBC1EPFvPvES1_Pm+0x90>
    80001a80:	000087b7          	lui	a5,0x8
    80001a84:	00f686b3          	add	a3,a3,a5
        blocked(false)
    80001a88:	02d4b023          	sd	a3,32(s1)
    80001a8c:	02048423          	sb	zero,40(s1)
    80001a90:	04048023          	sb	zero,64(s1)
        if(b!=nullptr) {
    80001a94:	02058a63          	beqz	a1,80001ac8 <_ZN6Kernel3TCBC1EPFvPvES1_Pm+0x7c>
            Sstack = (uint64*) MemoryAllocator::__mem__alloc(Riscv::roundToBlks(DEFAULT_STACK_SIZE));
    80001a98:	04100513          	li	a0,65
    80001a9c:	00001097          	auipc	ra,0x1
    80001aa0:	9cc080e7          	jalr	-1588(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    80001aa4:	02a4b823          	sd	a0,48(s1)
            cntActiveT++;
    80001aa8:	00008717          	auipc	a4,0x8
    80001aac:	63070713          	addi	a4,a4,1584 # 8000a0d8 <_ZN6Kernel3TCB10cntActiveTE>
    80001ab0:	00072783          	lw	a5,0(a4)
    80001ab4:	0017879b          	addiw	a5,a5,1
    80001ab8:	00f72023          	sw	a5,0(a4)
            Scheduler::put(this);
    80001abc:	00048513          	mv	a0,s1
    80001ac0:	00001097          	auipc	ra,0x1
    80001ac4:	bb8080e7          	jalr	-1096(ra) # 80002678 <_ZN6Kernel9Scheduler3putEPNS_3TCBE>
    }
    80001ac8:	01813083          	ld	ra,24(sp)
    80001acc:	01013403          	ld	s0,16(sp)
    80001ad0:	00813483          	ld	s1,8(sp)
    80001ad4:	02010113          	addi	sp,sp,32
    80001ad8:	00008067          	ret
         stack != nullptr? (uint64) &stack[DEFAULT_STACK_SIZE]:0
    80001adc:	00000693          	li	a3,0
    80001ae0:	fa9ff06f          	j	80001a88 <_ZN6Kernel3TCBC1EPFvPvES1_Pm+0x3c>

0000000080001ae4 <_ZN6Kernel3TCBD1Ev>:
    TCB::~TCB() {
    80001ae4:	fe010113          	addi	sp,sp,-32
    80001ae8:	00113c23          	sd	ra,24(sp)
    80001aec:	00813823          	sd	s0,16(sp)
    80001af0:	00913423          	sd	s1,8(sp)
    80001af4:	02010413          	addi	s0,sp,32
    80001af8:	00050493          	mv	s1,a0
        if(body) cntActiveT--;
    80001afc:	00053783          	ld	a5,0(a0)
    80001b00:	00078c63          	beqz	a5,80001b18 <_ZN6Kernel3TCBD1Ev+0x34>
    80001b04:	00008717          	auipc	a4,0x8
    80001b08:	5d470713          	addi	a4,a4,1492 # 8000a0d8 <_ZN6Kernel3TCB10cntActiveTE>
    80001b0c:	00072783          	lw	a5,0(a4)
    80001b10:	fff7879b          	addiw	a5,a5,-1
    80001b14:	00f72023          	sw	a5,0(a4)
        MemoryAllocator::__mem__free(stack);
    80001b18:	0104b503          	ld	a0,16(s1)
    80001b1c:	00001097          	auipc	ra,0x1
    80001b20:	9f0080e7          	jalr	-1552(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
        MemoryAllocator::__mem__free(Sstack); //izbegavanje ugnz sis poziva
    80001b24:	0304b503          	ld	a0,48(s1)
    80001b28:	00001097          	auipc	ra,0x1
    80001b2c:	9e4080e7          	jalr	-1564(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    }
    80001b30:	01813083          	ld	ra,24(sp)
    80001b34:	01013403          	ld	s0,16(sp)
    80001b38:	00813483          	ld	s1,8(sp)
    80001b3c:	02010113          	addi	sp,sp,32
    80001b40:	00008067          	ret

0000000080001b44 <_ZN6Kernel3TCB5yieldEPS0_S1_>:
    void TCB::yield(TCB *oldT, TCB *newT) { //sinhrono
    80001b44:	fe010113          	addi	sp,sp,-32
    80001b48:	00113c23          	sd	ra,24(sp)
    80001b4c:	00813823          	sd	s0,16(sp)
    80001b50:	00913423          	sd	s1,8(sp)
    80001b54:	01213023          	sd	s2,0(sp)
    80001b58:	02010413          	addi	s0,sp,32
    80001b5c:	00050493          	mv	s1,a0
    80001b60:	00058913          	mv	s2,a1
        Riscv::pushRegs();
    80001b64:	fffff097          	auipc	ra,0xfffff
    80001b68:	5e0080e7          	jalr	1504(ra) # 80001144 <_ZN5Riscv8pushRegsEv>
        switchContext(&oldT->context, &newT->context);
    80001b6c:	01890593          	addi	a1,s2,24
    80001b70:	01848513          	addi	a0,s1,24
    80001b74:	fffff097          	auipc	ra,0xfffff
    80001b78:	6d4080e7          	jalr	1748(ra) # 80001248 <_ZN6Kernel3TCB13switchContextEPNS0_7ContextES2_>
        Riscv::popRegs();
    80001b7c:	fffff097          	auipc	ra,0xfffff
    80001b80:	644080e7          	jalr	1604(ra) # 800011c0 <_ZN5Riscv7popRegsEv>
    }
    80001b84:	01813083          	ld	ra,24(sp)
    80001b88:	01013403          	ld	s0,16(sp)
    80001b8c:	00813483          	ld	s1,8(sp)
    80001b90:	00013903          	ld	s2,0(sp)
    80001b94:	02010113          	addi	sp,sp,32
    80001b98:	00008067          	ret

0000000080001b9c <_ZN6Kernel3TCB8dispatchEv>:
    void TCB::dispatch() {
    80001b9c:	fe010113          	addi	sp,sp,-32
    80001ba0:	00113c23          	sd	ra,24(sp)
    80001ba4:	00813823          	sd	s0,16(sp)
    80001ba8:	00913423          	sd	s1,8(sp)
    80001bac:	02010413          	addi	s0,sp,32
        TCB *oldR = running;
    80001bb0:	00008497          	auipc	s1,0x8
    80001bb4:	7284b483          	ld	s1,1832(s1) # 8000a2d8 <_ZN6Kernel3TCB7runningE>
  bool isFinished() const { return finished; }
    80001bb8:	0284c783          	lbu	a5,40(s1)
        if(!oldR->isFinished() && !oldR->isBlocked()) {
    80001bbc:	00079663          	bnez	a5,80001bc8 <_ZN6Kernel3TCB8dispatchEv+0x2c>
  bool isBlocked() const { return blocked; }
    80001bc0:	0404c783          	lbu	a5,64(s1)
    80001bc4:	02078e63          	beqz	a5,80001c00 <_ZN6Kernel3TCB8dispatchEv+0x64>
        running = Scheduler::get();
    80001bc8:	00001097          	auipc	ra,0x1
    80001bcc:	a48080e7          	jalr	-1464(ra) # 80002610 <_ZN6Kernel9Scheduler3getEv>
    80001bd0:	00050593          	mv	a1,a0
    80001bd4:	00008797          	auipc	a5,0x8
    80001bd8:	70a7b223          	sd	a0,1796(a5) # 8000a2d8 <_ZN6Kernel3TCB7runningE>
        if(oldR!=running) {
    80001bdc:	00a48863          	beq	s1,a0,80001bec <_ZN6Kernel3TCB8dispatchEv+0x50>
            yield(oldR, running);
    80001be0:	00048513          	mv	a0,s1
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	f60080e7          	jalr	-160(ra) # 80001b44 <_ZN6Kernel3TCB5yieldEPS0_S1_>
    }
    80001bec:	01813083          	ld	ra,24(sp)
    80001bf0:	01013403          	ld	s0,16(sp)
    80001bf4:	00813483          	ld	s1,8(sp)
    80001bf8:	02010113          	addi	sp,sp,32
    80001bfc:	00008067          	ret
            Scheduler::put(oldR);
    80001c00:	00048513          	mv	a0,s1
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	a74080e7          	jalr	-1420(ra) # 80002678 <_ZN6Kernel9Scheduler3putEPNS_3TCBE>
    80001c0c:	fbdff06f          	j	80001bc8 <_ZN6Kernel3TCB8dispatchEv+0x2c>

0000000080001c10 <_ZN6Kernel3TCBnwEm>:
    TCB *TCB::createThread(Body body, void *arg, uint64 *stack) {
        return new TCB(body, arg, stack);
    }


    void *TCB::operator new(uint64 s) {
    80001c10:	ff010113          	addi	sp,sp,-16
    80001c14:	00113423          	sd	ra,8(sp)
    80001c18:	00813023          	sd	s0,0(sp)
    80001c1c:	01010413          	addi	s0,sp,16
};


inline size_t Riscv::roundToBlks(size_t size) //od 64B koristi se 48B
{
    size += sizeof(Kernel::MemoryAllocator::BlkHeader);
    80001c20:	01050513          	addi	a0,a0,16
    return size/MEM_BLOCK_SIZE + (size%MEM_BLOCK_SIZE ? 1 : 0);
    80001c24:	00655793          	srli	a5,a0,0x6
    80001c28:	03f57513          	andi	a0,a0,63
    80001c2c:	00050463          	beqz	a0,80001c34 <_ZN6Kernel3TCBnwEm+0x24>
    80001c30:	00100513          	li	a0,1
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    80001c34:	00a78533          	add	a0,a5,a0
    80001c38:	00001097          	auipc	ra,0x1
    80001c3c:	830080e7          	jalr	-2000(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    }
    80001c40:	00813083          	ld	ra,8(sp)
    80001c44:	00013403          	ld	s0,0(sp)
    80001c48:	01010113          	addi	sp,sp,16
    80001c4c:	00008067          	ret

0000000080001c50 <_ZN6Kernel3TCBnaEm>:

    void *TCB::operator new [](uint64 s) {
    80001c50:	ff010113          	addi	sp,sp,-16
    80001c54:	00113423          	sd	ra,8(sp)
    80001c58:	00813023          	sd	s0,0(sp)
    80001c5c:	01010413          	addi	s0,sp,16
    size += sizeof(Kernel::MemoryAllocator::BlkHeader);
    80001c60:	01050513          	addi	a0,a0,16
    return size/MEM_BLOCK_SIZE + (size%MEM_BLOCK_SIZE ? 1 : 0);
    80001c64:	00655793          	srli	a5,a0,0x6
    80001c68:	03f57513          	andi	a0,a0,63
    80001c6c:	00050463          	beqz	a0,80001c74 <_ZN6Kernel3TCBnaEm+0x24>
    80001c70:	00100513          	li	a0,1
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    80001c74:	00a78533          	add	a0,a5,a0
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	7f0080e7          	jalr	2032(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    }
    80001c80:	00813083          	ld	ra,8(sp)
    80001c84:	00013403          	ld	s0,0(sp)
    80001c88:	01010113          	addi	sp,sp,16
    80001c8c:	00008067          	ret

0000000080001c90 <_ZN6Kernel3TCBdlEPv>:

    void TCB::operator delete(void *p) noexcept {
    80001c90:	ff010113          	addi	sp,sp,-16
    80001c94:	00113423          	sd	ra,8(sp)
    80001c98:	00813023          	sd	s0,0(sp)
    80001c9c:	01010413          	addi	s0,sp,16
        MemoryAllocator::__mem__free(p);
    80001ca0:	00001097          	auipc	ra,0x1
    80001ca4:	86c080e7          	jalr	-1940(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    }
    80001ca8:	00813083          	ld	ra,8(sp)
    80001cac:	00013403          	ld	s0,0(sp)
    80001cb0:	01010113          	addi	sp,sp,16
    80001cb4:	00008067          	ret

0000000080001cb8 <_ZN6Kernel3TCB12createThreadEPFvPvES1_Pm>:
    TCB *TCB::createThread(Body body, void *arg, uint64 *stack) {
    80001cb8:	fd010113          	addi	sp,sp,-48
    80001cbc:	02113423          	sd	ra,40(sp)
    80001cc0:	02813023          	sd	s0,32(sp)
    80001cc4:	00913c23          	sd	s1,24(sp)
    80001cc8:	01213823          	sd	s2,16(sp)
    80001ccc:	01313423          	sd	s3,8(sp)
    80001cd0:	01413023          	sd	s4,0(sp)
    80001cd4:	03010413          	addi	s0,sp,48
    80001cd8:	00050913          	mv	s2,a0
    80001cdc:	00058993          	mv	s3,a1
    80001ce0:	00060a13          	mv	s4,a2
        return new TCB(body, arg, stack);
    80001ce4:	04800513          	li	a0,72
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	f28080e7          	jalr	-216(ra) # 80001c10 <_ZN6Kernel3TCBnwEm>
    80001cf0:	00050493          	mv	s1,a0
    80001cf4:	000a0693          	mv	a3,s4
    80001cf8:	00098613          	mv	a2,s3
    80001cfc:	00090593          	mv	a1,s2
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	d4c080e7          	jalr	-692(ra) # 80001a4c <_ZN6Kernel3TCBC1EPFvPvES1_Pm>
    80001d08:	0200006f          	j	80001d28 <_ZN6Kernel3TCB12createThreadEPFvPvES1_Pm+0x70>
    80001d0c:	00050913          	mv	s2,a0
    80001d10:	00048513          	mv	a0,s1
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	f7c080e7          	jalr	-132(ra) # 80001c90 <_ZN6Kernel3TCBdlEPv>
    80001d1c:	00090513          	mv	a0,s2
    80001d20:	00009097          	auipc	ra,0x9
    80001d24:	6e8080e7          	jalr	1768(ra) # 8000b408 <_Unwind_Resume>
    }
    80001d28:	00048513          	mv	a0,s1
    80001d2c:	02813083          	ld	ra,40(sp)
    80001d30:	02013403          	ld	s0,32(sp)
    80001d34:	01813483          	ld	s1,24(sp)
    80001d38:	01013903          	ld	s2,16(sp)
    80001d3c:	00813983          	ld	s3,8(sp)
    80001d40:	00013a03          	ld	s4,0(sp)
    80001d44:	03010113          	addi	sp,sp,48
    80001d48:	00008067          	ret

0000000080001d4c <_ZN6Kernel3TCBdaEPv>:

    void TCB::operator delete [](void *p) noexcept {
    80001d4c:	ff010113          	addi	sp,sp,-16
    80001d50:	00113423          	sd	ra,8(sp)
    80001d54:	00813023          	sd	s0,0(sp)
    80001d58:	01010413          	addi	s0,sp,16
        MemoryAllocator::__mem__free(p);
    80001d5c:	00000097          	auipc	ra,0x0
    80001d60:	7b0080e7          	jalr	1968(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    }
    80001d64:	00813083          	ld	ra,8(sp)
    80001d68:	00013403          	ld	s0,0(sp)
    80001d6c:	01010113          	addi	sp,sp,16
    80001d70:	00008067          	ret

0000000080001d74 <_ZN6Kernel3TCB7superSPEm>:

    uint64 TCB::superSP(uint64 sp) {
    80001d74:	fe010113          	addi	sp,sp,-32
    80001d78:	00813c23          	sd	s0,24(sp)
    80001d7c:	02010413          	addi	s0,sp,32
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001d80:	100027f3          	csrr	a5,sstatus
    80001d84:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    80001d88:	fe843783          	ld	a5,-24(s0)
        if((Riscv::r_sstatus() & Riscv::SSTATUS_SPP)==0) { //ako smo presli na neki sistemski stek, pa makar bio ugnz poziv
    80001d8c:	1007f793          	andi	a5,a5,256
    80001d90:	00079e63          	bnez	a5,80001dac <_ZN6Kernel3TCB7superSPEm+0x38>
            running->savedSP = sp;
    80001d94:	00008797          	auipc	a5,0x8
    80001d98:	5447b783          	ld	a5,1348(a5) # 8000a2d8 <_ZN6Kernel3TCB7runningE>
    80001d9c:	02a7bc23          	sd	a0,56(a5)
            return ((uint64) &(running->Sstack[DEFAULT_STACK_SIZE]));
    80001da0:	0307b503          	ld	a0,48(a5)
    80001da4:	000087b7          	lui	a5,0x8
    80001da8:	00f50533          	add	a0,a0,a5
        } else {
            return sp;
        }

    }
    80001dac:	01813403          	ld	s0,24(sp)
    80001db0:	02010113          	addi	sp,sp,32
    80001db4:	00008067          	ret

0000000080001db8 <_ZN6Kernel3TCB6userSPEm>:

    uint64 TCB::userSP(uint64 sp) {
    80001db8:	fe010113          	addi	sp,sp,-32
    80001dbc:	00813c23          	sd	s0,24(sp)
    80001dc0:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001dc4:	100027f3          	csrr	a5,sstatus
    80001dc8:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    80001dcc:	fe843783          	ld	a5,-24(s0)
        if((Riscv::r_sstatus() & Riscv::SSTATUS_SPP)==0) {
    80001dd0:	1007f793          	andi	a5,a5,256
    80001dd4:	00079863          	bnez	a5,80001de4 <_ZN6Kernel3TCB6userSPEm+0x2c>
            return running->savedSP; // sacuvani korisnicki
    80001dd8:	00008797          	auipc	a5,0x8
    80001ddc:	5007b783          	ld	a5,1280(a5) # 8000a2d8 <_ZN6Kernel3TCB7runningE>
    80001de0:	0387b503          	ld	a0,56(a5)
        } else
            return sp;
    }
    80001de4:	01813403          	ld	s0,24(sp)
    80001de8:	02010113          	addi	sp,sp,32
    80001dec:	00008067          	ret

0000000080001df0 <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>:
    return thread_create(&myHandle, this->body, this->arg);
}

Thread::Thread() {
    this->arg = this;
    this->body = [](void* arg) -> void {
    80001df0:	ff010113          	addi	sp,sp,-16
    80001df4:	00113423          	sd	ra,8(sp)
    80001df8:	00813023          	sd	s0,0(sp)
    80001dfc:	01010413          	addi	s0,sp,16
        auto thread = (Thread *)arg;
        thread->run();
    80001e00:	00053783          	ld	a5,0(a0)
    80001e04:	0107b783          	ld	a5,16(a5)
    80001e08:	000780e7          	jalr	a5
    };
    80001e0c:	00813083          	ld	ra,8(sp)
    80001e10:	00013403          	ld	s0,0(sp)
    80001e14:	01010113          	addi	sp,sp,16
    80001e18:	00008067          	ret

0000000080001e1c <_ZN6ThreadD1Ev>:
#include "../h/syscall_c.h"

void* operator new (size_t);
void operator delete (void*);

class Thread {
    80001e1c:	ff010113          	addi	sp,sp,-16
    80001e20:	00813423          	sd	s0,8(sp)
    80001e24:	01010413          	addi	s0,sp,16
    80001e28:	00813403          	ld	s0,8(sp)
    80001e2c:	01010113          	addi	sp,sp,16
    80001e30:	00008067          	ret

0000000080001e34 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore () {
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00113423          	sd	ra,8(sp)
    80001e3c:	00813023          	sd	s0,0(sp)
    80001e40:	01010413          	addi	s0,sp,16
    80001e44:	00008797          	auipc	a5,0x8
    80001e48:	2d478793          	addi	a5,a5,724 # 8000a118 <_ZTV9Semaphore+0x10>
    80001e4c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001e50:	00853503          	ld	a0,8(a0)
    80001e54:	fffff097          	auipc	ra,0xfffff
    80001e58:	5e8080e7          	jalr	1512(ra) # 8000143c <_Z9sem_closeP4_sem>
}
    80001e5c:	00813083          	ld	ra,8(sp)
    80001e60:	00013403          	ld	s0,0(sp)
    80001e64:	01010113          	addi	sp,sp,16
    80001e68:	00008067          	ret

0000000080001e6c <_Znwm>:
void* operator new (size_t size) {
    80001e6c:	ff010113          	addi	sp,sp,-16
    80001e70:	00113423          	sd	ra,8(sp)
    80001e74:	00813023          	sd	s0,0(sp)
    80001e78:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001e7c:	fffff097          	auipc	ra,0xfffff
    80001e80:	400080e7          	jalr	1024(ra) # 8000127c <_Z9mem_allocm>
}
    80001e84:	00813083          	ld	ra,8(sp)
    80001e88:	00013403          	ld	s0,0(sp)
    80001e8c:	01010113          	addi	sp,sp,16
    80001e90:	00008067          	ret

0000000080001e94 <_ZdlPv>:
void operator delete (void* addr) {
    80001e94:	ff010113          	addi	sp,sp,-16
    80001e98:	00113423          	sd	ra,8(sp)
    80001e9c:	00813023          	sd	s0,0(sp)
    80001ea0:	01010413          	addi	s0,sp,16
    mem_free(addr);
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	428080e7          	jalr	1064(ra) # 800012cc <_Z8mem_freePv>
}
    80001eac:	00813083          	ld	ra,8(sp)
    80001eb0:	00013403          	ld	s0,0(sp)
    80001eb4:	01010113          	addi	sp,sp,16
    80001eb8:	00008067          	ret

0000000080001ebc <_ZN6ThreadD0Ev>:
    80001ebc:	ff010113          	addi	sp,sp,-16
    80001ec0:	00113423          	sd	ra,8(sp)
    80001ec4:	00813023          	sd	s0,0(sp)
    80001ec8:	01010413          	addi	s0,sp,16
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	fc8080e7          	jalr	-56(ra) # 80001e94 <_ZdlPv>
    80001ed4:	00813083          	ld	ra,8(sp)
    80001ed8:	00013403          	ld	s0,0(sp)
    80001edc:	01010113          	addi	sp,sp,16
    80001ee0:	00008067          	ret

0000000080001ee4 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore () {
    80001ee4:	fe010113          	addi	sp,sp,-32
    80001ee8:	00113c23          	sd	ra,24(sp)
    80001eec:	00813823          	sd	s0,16(sp)
    80001ef0:	00913423          	sd	s1,8(sp)
    80001ef4:	02010413          	addi	s0,sp,32
    80001ef8:	00050493          	mv	s1,a0
}
    80001efc:	00000097          	auipc	ra,0x0
    80001f00:	f38080e7          	jalr	-200(ra) # 80001e34 <_ZN9SemaphoreD1Ev>
    80001f04:	00048513          	mv	a0,s1
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	f8c080e7          	jalr	-116(ra) # 80001e94 <_ZdlPv>
    80001f10:	01813083          	ld	ra,24(sp)
    80001f14:	01013403          	ld	s0,16(sp)
    80001f18:	00813483          	ld	s1,8(sp)
    80001f1c:	02010113          	addi	sp,sp,32
    80001f20:	00008067          	ret

0000000080001f24 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg) {
    80001f24:	ff010113          	addi	sp,sp,-16
    80001f28:	00813423          	sd	s0,8(sp)
    80001f2c:	01010413          	addi	s0,sp,16
    80001f30:	00008797          	auipc	a5,0x8
    80001f34:	1c078793          	addi	a5,a5,448 # 8000a0f0 <_ZTV6Thread+0x10>
    80001f38:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80001f3c:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80001f40:	00c53c23          	sd	a2,24(a0)
}
    80001f44:	00813403          	ld	s0,8(sp)
    80001f48:	01010113          	addi	sp,sp,16
    80001f4c:	00008067          	ret

0000000080001f50 <_ZN6Thread5startEv>:
int Thread::start() {
    80001f50:	ff010113          	addi	sp,sp,-16
    80001f54:	00113423          	sd	ra,8(sp)
    80001f58:	00813023          	sd	s0,0(sp)
    80001f5c:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, this->body, this->arg);
    80001f60:	01853603          	ld	a2,24(a0)
    80001f64:	01053583          	ld	a1,16(a0)
    80001f68:	00850513          	addi	a0,a0,8
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	3a0080e7          	jalr	928(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
}
    80001f74:	00813083          	ld	ra,8(sp)
    80001f78:	00013403          	ld	s0,0(sp)
    80001f7c:	01010113          	addi	sp,sp,16
    80001f80:	00008067          	ret

0000000080001f84 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00813423          	sd	s0,8(sp)
    80001f8c:	01010413          	addi	s0,sp,16
    80001f90:	00008797          	auipc	a5,0x8
    80001f94:	16078793          	addi	a5,a5,352 # 8000a0f0 <_ZTV6Thread+0x10>
    80001f98:	00f53023          	sd	a5,0(a0)
    this->arg = this;
    80001f9c:	00a53c23          	sd	a0,24(a0)
    this->body = [](void* arg) -> void {
    80001fa0:	00000797          	auipc	a5,0x0
    80001fa4:	e5078793          	addi	a5,a5,-432 # 80001df0 <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>
    80001fa8:	00f53823          	sd	a5,16(a0)
}
    80001fac:	00813403          	ld	s0,8(sp)
    80001fb0:	01010113          	addi	sp,sp,16
    80001fb4:	00008067          	ret

0000000080001fb8 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001fb8:	ff010113          	addi	sp,sp,-16
    80001fbc:	00113423          	sd	ra,8(sp)
    80001fc0:	00813023          	sd	s0,0(sp)
    80001fc4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	3f4080e7          	jalr	1012(ra) # 800013bc <_Z15thread_dispatchv>
}
    80001fd0:	00813083          	ld	ra,8(sp)
    80001fd4:	00013403          	ld	s0,0(sp)
    80001fd8:	01010113          	addi	sp,sp,16
    80001fdc:	00008067          	ret

0000000080001fe0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80001fe0:	ff010113          	addi	sp,sp,-16
    80001fe4:	00813423          	sd	s0,8(sp)
    80001fe8:	01010413          	addi	s0,sp,16
}
    80001fec:	00000513          	li	a0,0
    80001ff0:	00813403          	ld	s0,8(sp)
    80001ff4:	01010113          	addi	sp,sp,16
    80001ff8:	00008067          	ret

0000000080001ffc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init) {
    80001ffc:	ff010113          	addi	sp,sp,-16
    80002000:	00113423          	sd	ra,8(sp)
    80002004:	00813023          	sd	s0,0(sp)
    80002008:	01010413          	addi	s0,sp,16
    8000200c:	00008797          	auipc	a5,0x8
    80002010:	10c78793          	addi	a5,a5,268 # 8000a118 <_ZTV9Semaphore+0x10>
    80002014:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002018:	00850513          	addi	a0,a0,8
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	3dc080e7          	jalr	988(ra) # 800013f8 <_Z8sem_openPP4_semj>
}
    80002024:	00813083          	ld	ra,8(sp)
    80002028:	00013403          	ld	s0,0(sp)
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret

0000000080002034 <_ZN9Semaphore4waitEv>:

int Semaphore::wait () {
    80002034:	ff010113          	addi	sp,sp,-16
    80002038:	00113423          	sd	ra,8(sp)
    8000203c:	00813023          	sd	s0,0(sp)
    80002040:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002044:	00853503          	ld	a0,8(a0)
    80002048:	fffff097          	auipc	ra,0xfffff
    8000204c:	434080e7          	jalr	1076(ra) # 8000147c <_Z8sem_waitP4_sem>
}
    80002050:	00813083          	ld	ra,8(sp)
    80002054:	00013403          	ld	s0,0(sp)
    80002058:	01010113          	addi	sp,sp,16
    8000205c:	00008067          	ret

0000000080002060 <_ZN9Semaphore6signalEv>:

int Semaphore::signal () {
    80002060:	ff010113          	addi	sp,sp,-16
    80002064:	00113423          	sd	ra,8(sp)
    80002068:	00813023          	sd	s0,0(sp)
    8000206c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002070:	00853503          	ld	a0,8(a0)
    80002074:	fffff097          	auipc	ra,0xfffff
    80002078:	448080e7          	jalr	1096(ra) # 800014bc <_Z10sem_signalP4_sem>
}
    8000207c:	00813083          	ld	ra,8(sp)
    80002080:	00013403          	ld	s0,0(sp)
    80002084:	01010113          	addi	sp,sp,16
    80002088:	00008067          	ret

000000008000208c <_ZN9Semaphore9timedWaitEm>:

int Semaphore::timedWait (time_t) {
    8000208c:	ff010113          	addi	sp,sp,-16
    80002090:	00813423          	sd	s0,8(sp)
    80002094:	01010413          	addi	s0,sp,16
    return 0;
}
    80002098:	00000513          	li	a0,0
    8000209c:	00813403          	ld	s0,8(sp)
    800020a0:	01010113          	addi	sp,sp,16
    800020a4:	00008067          	ret

00000000800020a8 <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait() {
    800020a8:	ff010113          	addi	sp,sp,-16
    800020ac:	00113423          	sd	ra,8(sp)
    800020b0:	00813023          	sd	s0,0(sp)
    800020b4:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    800020b8:	00853503          	ld	a0,8(a0)
    800020bc:	fffff097          	auipc	ra,0xfffff
    800020c0:	440080e7          	jalr	1088(ra) # 800014fc <_Z11sem_trywaitP4_sem>
}
    800020c4:	00813083          	ld	ra,8(sp)
    800020c8:	00013403          	ld	s0,0(sp)
    800020cc:	01010113          	addi	sp,sp,16
    800020d0:	00008067          	ret

00000000800020d4 <_ZN7Console4getcEv>:

char Console::getc() {
    800020d4:	ff010113          	addi	sp,sp,-16
    800020d8:	00113423          	sd	ra,8(sp)
    800020dc:	00813023          	sd	s0,0(sp)
    800020e0:	01010413          	addi	s0,sp,16
    return ::getc();
    800020e4:	fffff097          	auipc	ra,0xfffff
    800020e8:	494080e7          	jalr	1172(ra) # 80001578 <_Z4getcv>
}
    800020ec:	00813083          	ld	ra,8(sp)
    800020f0:	00013403          	ld	s0,0(sp)
    800020f4:	01010113          	addi	sp,sp,16
    800020f8:	00008067          	ret

00000000800020fc <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800020fc:	ff010113          	addi	sp,sp,-16
    80002100:	00113423          	sd	ra,8(sp)
    80002104:	00813023          	sd	s0,0(sp)
    80002108:	01010413          	addi	s0,sp,16
    ::putc(c);
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	430080e7          	jalr	1072(ra) # 8000153c <_Z4putcc>
}
    80002114:	00813083          	ld	ra,8(sp)
    80002118:	00013403          	ld	s0,0(sp)
    8000211c:	01010113          	addi	sp,sp,16
    80002120:	00008067          	ret

0000000080002124 <_ZN6Thread3runEv>:

protected:

    Thread ();

    virtual void run () {}
    80002124:	ff010113          	addi	sp,sp,-16
    80002128:	00813423          	sd	s0,8(sp)
    8000212c:	01010413          	addi	s0,sp,16
    80002130:	00813403          	ld	s0,8(sp)
    80002134:	01010113          	addi	sp,sp,16
    80002138:	00008067          	ret

000000008000213c <_ZN5Riscv10popSppSpieEv>:
#include "../lib/console.h"
#include "../lib/hw.h"

using namespace Kernel;

void Riscv::popSppSpie() {
    8000213c:	ff010113          	addi	sp,sp,-16
    80002140:	00813423          	sd	s0,8(sp)
    80002144:	01010413          	addi	s0,sp,16
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002148:	10000793          	li	a5,256
    8000214c:	1007b073          	csrc	sstatus,a5
    mc_sstatus(SSTATUS_SPP);
    __asm__ volatile ("csrw sepc, ra"); //upisati povr adresu u odn na trenutak skoka u prk rutinu
    80002150:	14109073          	csrw	sepc,ra
        //zato ne sme biti inline
    __asm__ volatile ("sret"); //DA SE IZADJE IZ THR_WRAP
    80002154:	10200073          	sret
}
    80002158:	00813403          	ld	s0,8(sp)
    8000215c:	01010113          	addi	sp,sp,16
    80002160:	00008067          	ret

0000000080002164 <_ZN5Riscv10intpHandleEmmmmm>:


// argmuneti se prenose preko regs a0,a1,a2,a3,a4 pa se ne moraju upisivati arg u iste u sis pozivu
uint64 Riscv::intpHandle(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80002164:	fa010113          	addi	sp,sp,-96
    80002168:	04113c23          	sd	ra,88(sp)
    8000216c:	04813823          	sd	s0,80(sp)
    80002170:	04913423          	sd	s1,72(sp)
    80002174:	06010413          	addi	s0,sp,96
    80002178:	00050793          	mv	a5,a0
    8000217c:	00058493          	mv	s1,a1
    80002180:	00060513          	mv	a0,a2
    80002184:	00068593          	mv	a1,a3
    80002188:	00070613          	mv	a2,a4
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    8000218c:	14202773          	csrr	a4,scause
    80002190:	fae43c23          	sd	a4,-72(s0)
    return scause;
    80002194:	fb843703          	ld	a4,-72(s0)
    volatile uint64 scause = Riscv::r_scause(); //LOKALNE PROM A ONE IDU UVEK NA STEK
    80002198:	fce43c23          	sd	a4,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000219c:	14102773          	csrr	a4,sepc
    800021a0:	fae43823          	sd	a4,-80(s0)
    return sepc;
    800021a4:	fb043703          	ld	a4,-80(s0)
    volatile uint64 sepc = Riscv::r_sepc(); //EKVIVALENT PUSH
    800021a8:	fce43823          	sd	a4,-48(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021ac:	10002773          	csrr	a4,sstatus
    800021b0:	fae43423          	sd	a4,-88(s0)
    return sstatus;
    800021b4:	fa843703          	ld	a4,-88(s0)
    volatile uint64 sstatus = Riscv::r_sstatus();
    800021b8:	fce43423          	sd	a4,-56(s0)
    volatile uint64 retVal = 0;
    800021bc:	fc043023          	sd	zero,-64(s0)

    if(scause == (1UL << 63 | 1UL)) {
    800021c0:	fd843683          	ld	a3,-40(s0)
    800021c4:	fff00713          	li	a4,-1
    800021c8:	03f71713          	slli	a4,a4,0x3f
    800021cc:	00170713          	addi	a4,a4,1
    800021d0:	08e68e63          	beq	a3,a4,8000226c <_ZN5Riscv10intpHandleEmmmmm+0x108>
        //     TCB::dispatch();
        // }

        mc_sip(Riscv::SIP_SSIP); //softverski prekid se obradio

    } else if(scause == 8UL || scause == 9UL) { // 9 sustinski dozvoljava ugnjezdavanja; time kernelske new i delete ne moram da pravim
    800021d4:	fd843683          	ld	a3,-40(s0)
    800021d8:	00800713          	li	a4,8
    800021dc:	08e68e63          	beq	a3,a4,80002278 <_ZN5Riscv10intpHandleEmmmmm+0x114>
    800021e0:	fd843683          	ld	a3,-40(s0)
    800021e4:	00900713          	li	a4,9
    800021e8:	08e68863          	beq	a3,a4,80002278 <_ZN5Riscv10intpHandleEmmmmm+0x114>
            }
        }

        sepc += 4; //da bismo otisli na narednu instrukciju nakon ecall po povr iz rutine

    } else if(scause == (1UL << 63 | 9UL)) {
    800021ec:	fd843703          	ld	a4,-40(s0)
    800021f0:	fff00793          	li	a5,-1
    800021f4:	03f79793          	slli	a5,a5,0x3f
    800021f8:	00978793          	addi	a5,a5,9
    800021fc:	1ef70e63          	beq	a4,a5,800023f8 <_ZN5Riscv10intpHandleEmmmmm+0x294>
        console_handler();
    } else {
        //print sepc i scause sa onim fajlom sa timsa
        printString("scause: ");
    80002200:	00006517          	auipc	a0,0x6
    80002204:	e4050513          	addi	a0,a0,-448 # 80008040 <CONSOLE_STATUS+0x30>
    80002208:	00002097          	auipc	ra,0x2
    8000220c:	204080e7          	jalr	516(ra) # 8000440c <_Z11printStringPKc>
        printInt(scause, 16);
    80002210:	fd843503          	ld	a0,-40(s0)
    80002214:	00000613          	li	a2,0
    80002218:	01000593          	li	a1,16
    8000221c:	0005051b          	sext.w	a0,a0
    80002220:	00002097          	auipc	ra,0x2
    80002224:	39c080e7          	jalr	924(ra) # 800045bc <_Z8printIntiii>
        __putc('\n');
    80002228:	00a00513          	li	a0,10
    8000222c:	00005097          	auipc	ra,0x5
    80002230:	3c0080e7          	jalr	960(ra) # 800075ec <__putc>
        printString("sepc: ");
    80002234:	00006517          	auipc	a0,0x6
    80002238:	e1c50513          	addi	a0,a0,-484 # 80008050 <CONSOLE_STATUS+0x40>
    8000223c:	00002097          	auipc	ra,0x2
    80002240:	1d0080e7          	jalr	464(ra) # 8000440c <_Z11printStringPKc>
        printInt(sepc,16);
    80002244:	fd043503          	ld	a0,-48(s0)
    80002248:	00000613          	li	a2,0
    8000224c:	01000593          	li	a1,16
    80002250:	0005051b          	sext.w	a0,a0
    80002254:	00002097          	auipc	ra,0x2
    80002258:	368080e7          	jalr	872(ra) # 800045bc <_Z8printIntiii>
        __putc('\n');
    8000225c:	00a00513          	li	a0,10
    80002260:	00005097          	auipc	ra,0x5
    80002264:	38c080e7          	jalr	908(ra) # 800075ec <__putc>
        while(1);
    80002268:	0000006f          	j	80002268 <_ZN5Riscv10intpHandleEmmmmm+0x104>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000226c:	00200793          	li	a5,2
    80002270:	1447b073          	csrc	sip,a5
}
    80002274:	0440006f          	j	800022b8 <_ZN5Riscv10intpHandleEmmmmm+0x154>
        switch (code) {
    80002278:	04200713          	li	a4,66
    8000227c:	16f76463          	bltu	a4,a5,800023e4 <_ZN5Riscv10intpHandleEmmmmm+0x280>
    80002280:	00279793          	slli	a5,a5,0x2
    80002284:	00006717          	auipc	a4,0x6
    80002288:	dd470713          	addi	a4,a4,-556 # 80008058 <CONSOLE_STATUS+0x48>
    8000228c:	00e787b3          	add	a5,a5,a4
    80002290:	0007a783          	lw	a5,0(a5)
    80002294:	00e787b3          	add	a5,a5,a4
    80002298:	00078067          	jr	a5
                retVal = (uint64) MemoryAllocator::__mem__alloc(arg1);
    8000229c:	00048513          	mv	a0,s1
    800022a0:	00000097          	auipc	ra,0x0
    800022a4:	1c8080e7          	jalr	456(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
    800022a8:	fca43023          	sd	a0,-64(s0)
        sepc += 4; //da bismo otisli na narednu instrukciju nakon ecall po povr iz rutine
    800022ac:	fd043783          	ld	a5,-48(s0)
    800022b0:	00478793          	addi	a5,a5,4
    800022b4:	fcf43823          	sd	a5,-48(s0)

    }

    w_sstatus(sstatus);
    800022b8:	fc843783          	ld	a5,-56(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800022bc:	10079073          	csrw	sstatus,a5
    w_sepc(sepc);
    800022c0:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800022c4:	14179073          	csrw	sepc,a5
    w_scause(scause); // njihov getc menja celu rutinu i da se ne izgubi info
    800022c8:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
    800022cc:	14279073          	csrw	scause,a5
    return retVal;
    800022d0:	fc043503          	ld	a0,-64(s0)
    800022d4:	05813083          	ld	ra,88(sp)
    800022d8:	05013403          	ld	s0,80(sp)
    800022dc:	04813483          	ld	s1,72(sp)
    800022e0:	06010113          	addi	sp,sp,96
    800022e4:	00008067          	ret
                retVal = MemoryAllocator::__mem__free((void *)arg1);
    800022e8:	00048513          	mv	a0,s1
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	220080e7          	jalr	544(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    800022f4:	fca43023          	sd	a0,-64(s0)
                break;
    800022f8:	fb5ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                *handle = TCB::createThread((void (*)(void *)) arg2,(void *) arg3, (uint64*)arg4);
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	9bc080e7          	jalr	-1604(ra) # 80001cb8 <_ZN6Kernel3TCB12createThreadEPFvPvES1_Pm>
    80002304:	00a4b023          	sd	a0,0(s1)
                if(*handle!=nullptr) {
    80002308:	00050663          	beqz	a0,80002314 <_ZN5Riscv10intpHandleEmmmmm+0x1b0>
                    retVal = 0;
    8000230c:	fc043023          	sd	zero,-64(s0)
    80002310:	f9dff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                    retVal = -1;
    80002314:	fff00793          	li	a5,-1
    80002318:	fcf43023          	sd	a5,-64(s0)
    8000231c:	f91ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                TCB::running->setFinished(true);
    80002320:	00008797          	auipc	a5,0x8
    80002324:	f607b783          	ld	a5,-160(a5) # 8000a280 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002328:	0007b783          	ld	a5,0(a5)
  void setFinished(bool b) { finished = b; }
    8000232c:	00100713          	li	a4,1
    80002330:	02e78423          	sb	a4,40(a5)
                TCB::dispatch();
    80002334:	00000097          	auipc	ra,0x0
    80002338:	868080e7          	jalr	-1944(ra) # 80001b9c <_ZN6Kernel3TCB8dispatchEv>
                break;
    8000233c:	f71ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                TCB::dispatch();
    80002340:	00000097          	auipc	ra,0x0
    80002344:	85c080e7          	jalr	-1956(ra) # 80001b9c <_ZN6Kernel3TCB8dispatchEv>
                break;
    80002348:	f65ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                *handle = Semaphore::open((uint64)arg2);
    8000234c:	0005051b          	sext.w	a0,a0
    80002350:	fffff097          	auipc	ra,0xfffff
    80002354:	338080e7          	jalr	824(ra) # 80001688 <_ZN6Kernel9Semaphore4openEj>
    80002358:	00a4b023          	sd	a0,0(s1)
                if(*handle!=nullptr) {
    8000235c:	00050663          	beqz	a0,80002368 <_ZN5Riscv10intpHandleEmmmmm+0x204>
                    retVal = 0;
    80002360:	fc043023          	sd	zero,-64(s0)
    80002364:	f49ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                    retVal = -1;
    80002368:	fff00793          	li	a5,-1
    8000236c:	fcf43023          	sd	a5,-64(s0)
    80002370:	f3dff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                retVal = sem->close();
    80002374:	00048513          	mv	a0,s1
    80002378:	fffff097          	auipc	ra,0xfffff
    8000237c:	35c080e7          	jalr	860(ra) # 800016d4 <_ZN6Kernel9Semaphore5closeEv>
    80002380:	fca43023          	sd	a0,-64(s0)
                break;
    80002384:	f29ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                retVal = sem->wait();
    80002388:	00048513          	mv	a0,s1
    8000238c:	fffff097          	auipc	ra,0xfffff
    80002390:	3d8080e7          	jalr	984(ra) # 80001764 <_ZN6Kernel9Semaphore4waitEv>
    80002394:	fca43023          	sd	a0,-64(s0)
                break;
    80002398:	f15ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                retVal = sem->signal();
    8000239c:	00048513          	mv	a0,s1
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	484080e7          	jalr	1156(ra) # 80001824 <_ZN6Kernel9Semaphore6signalEv>
    800023a8:	fca43023          	sd	a0,-64(s0)
                break;
    800023ac:	f01ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                retVal = sem->tryWait();
    800023b0:	00048513          	mv	a0,s1
    800023b4:	fffff097          	auipc	ra,0xfffff
    800023b8:	510080e7          	jalr	1296(ra) # 800018c4 <_ZN6Kernel9Semaphore7tryWaitEv>
    800023bc:	fca43023          	sd	a0,-64(s0)
                break;
    800023c0:	eedff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                retVal = (uint64) __getc();
    800023c4:	00005097          	auipc	ra,0x5
    800023c8:	264080e7          	jalr	612(ra) # 80007628 <__getc>
    800023cc:	fca43023          	sd	a0,-64(s0)
                break;
    800023d0:	eddff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                __putc(arg1);
    800023d4:	0ff4f513          	andi	a0,s1,255
    800023d8:	00005097          	auipc	ra,0x5
    800023dc:	214080e7          	jalr	532(ra) # 800075ec <__putc>
                break;
    800023e0:	ecdff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
                printString("default\n");
    800023e4:	00006517          	auipc	a0,0x6
    800023e8:	c4c50513          	addi	a0,a0,-948 # 80008030 <CONSOLE_STATUS+0x20>
    800023ec:	00002097          	auipc	ra,0x2
    800023f0:	020080e7          	jalr	32(ra) # 8000440c <_Z11printStringPKc>
                break;
    800023f4:	eb9ff06f          	j	800022ac <_ZN5Riscv10intpHandleEmmmmm+0x148>
        console_handler();
    800023f8:	00005097          	auipc	ra,0x5
    800023fc:	268080e7          	jalr	616(ra) # 80007660 <console_handler>
    80002400:	eb9ff06f          	j	800022b8 <_ZN5Riscv10intpHandleEmmmmm+0x154>

0000000080002404 <_ZN6Kernel15MemoryAllocator4initEv>:
#include "../lib/hw.h"

namespace Kernel {
    MemoryAllocator::BlkHeader *MemoryAllocator::freeHead = nullptr;

    void MemoryAllocator::init() {
    80002404:	ff010113          	addi	sp,sp,-16
    80002408:	00813423          	sd	s0,8(sp)
    8000240c:	01010413          	addi	s0,sp,16
        size_t startAddr = (size_t) HEAP_START_ADDR;
    80002410:	00008797          	auipc	a5,0x8
    80002414:	e507b783          	ld	a5,-432(a5) # 8000a260 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002418:	0007b703          	ld	a4,0(a5)

        if(size_t rest = startAddr % MEM_BLOCK_SIZE)
    8000241c:	03f77793          	andi	a5,a4,63
    80002420:	00078663          	beqz	a5,8000242c <_ZN6Kernel15MemoryAllocator4initEv+0x28>
            startAddr += MEM_BLOCK_SIZE - rest;
    80002424:	40f70733          	sub	a4,a4,a5
    80002428:	04070713          	addi	a4,a4,64

        size_t endAddr = (size_t) HEAP_END_ADDR;
    8000242c:	00008797          	auipc	a5,0x8
    80002430:	e4c7b783          	ld	a5,-436(a5) # 8000a278 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002434:	0007b783          	ld	a5,0(a5)
        endAddr -= endAddr % MEM_BLOCK_SIZE;
    80002438:	fc07f793          	andi	a5,a5,-64

        freeHead = (BlkHeader *) startAddr;
    8000243c:	00008697          	auipc	a3,0x8
    80002440:	eac68693          	addi	a3,a3,-340 # 8000a2e8 <_ZN6Kernel15MemoryAllocator8freeHeadE>
    80002444:	00e6b023          	sd	a4,0(a3)
        freeHead->size = (endAddr - startAddr)/MEM_BLOCK_SIZE; //number of blocks
    80002448:	40e787b3          	sub	a5,a5,a4
    8000244c:	0067d793          	srli	a5,a5,0x6
    80002450:	00f73023          	sd	a5,0(a4)
        freeHead->next = nullptr;
    80002454:	0006b783          	ld	a5,0(a3)
    80002458:	0007b423          	sd	zero,8(a5)
    }
    8000245c:	00813403          	ld	s0,8(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>:

    void* MemoryAllocator::__mem__alloc(size_t sz) { //first fit, sz je u B prebaciti u blokove
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00813423          	sd	s0,8(sp)
    80002470:	01010413          	addi	s0,sp,16
    80002474:	00050713          	mv	a4,a0

        BlkHeader *curr = freeHead, *prev = nullptr;
    80002478:	00008517          	auipc	a0,0x8
    8000247c:	e7053503          	ld	a0,-400(a0) # 8000a2e8 <_ZN6Kernel15MemoryAllocator8freeHeadE>
    80002480:	00000693          	li	a3,0

        for (; curr && curr->size < sz; prev = curr, curr = curr->next);
    80002484:	00050c63          	beqz	a0,8000249c <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x34>
    80002488:	00053783          	ld	a5,0(a0)
    8000248c:	00e7f863          	bgeu	a5,a4,8000249c <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x34>
    80002490:	00050693          	mv	a3,a0
    80002494:	00853503          	ld	a0,8(a0)
    80002498:	fedff06f          	j	80002484 <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x1c>

        if (!curr) return nullptr;
    8000249c:	02050c63          	beqz	a0,800024d4 <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x6c>
        size_t remaining = curr->size - sz;
    800024a0:	00053783          	ld	a5,0(a0)
    800024a4:	40e78633          	sub	a2,a5,a4

        if (remaining > 0) {
    800024a8:	04e78263          	beq	a5,a4,800024ec <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x84>
            curr->size = sz;
    800024ac:	00e53023          	sd	a4,0(a0)
            BlkHeader *newBlk = (BlkHeader *)((size_t)curr +MEM_BLOCK_SIZE*sz);
    800024b0:	00671713          	slli	a4,a4,0x6
    800024b4:	00e50733          	add	a4,a0,a4
            if (prev) prev->next = newBlk;
    800024b8:	02068463          	beqz	a3,800024e0 <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x78>
    800024bc:	00e6b423          	sd	a4,8(a3)
            else freeHead = newBlk;

            newBlk->size = remaining;
    800024c0:	00c73023          	sd	a2,0(a4)
            newBlk->next = curr->next;
    800024c4:	00853783          	ld	a5,8(a0)
    800024c8:	00f73423          	sd	a5,8(a4)
        } else {
            if (prev)prev->next = curr->next;
            else freeHead = curr->next;
        }

        curr->next = nullptr;
    800024cc:	00053423          	sd	zero,8(a0)
        return ++curr;
    800024d0:	01050513          	addi	a0,a0,16
        // }
        // curr->next = nullptr;
        //
        // return ++curr;

    }
    800024d4:	00813403          	ld	s0,8(sp)
    800024d8:	01010113          	addi	sp,sp,16
    800024dc:	00008067          	ret
            else freeHead = newBlk;
    800024e0:	00008797          	auipc	a5,0x8
    800024e4:	e0e7b423          	sd	a4,-504(a5) # 8000a2e8 <_ZN6Kernel15MemoryAllocator8freeHeadE>
    800024e8:	fd9ff06f          	j	800024c0 <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x58>
            if (prev)prev->next = curr->next;
    800024ec:	00068863          	beqz	a3,800024fc <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x94>
    800024f0:	00853783          	ld	a5,8(a0)
    800024f4:	00f6b423          	sd	a5,8(a3)
    800024f8:	fd5ff06f          	j	800024cc <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x64>
            else freeHead = curr->next;
    800024fc:	00853783          	ld	a5,8(a0)
    80002500:	00008717          	auipc	a4,0x8
    80002504:	def73423          	sd	a5,-536(a4) # 8000a2e8 <_ZN6Kernel15MemoryAllocator8freeHeadE>
    80002508:	fc5ff06f          	j	800024cc <_ZN6Kernel15MemoryAllocator12__mem__allocEm+0x64>

000000008000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>:

    int MemoryAllocator::__mem__free(void *addr) {
    8000250c:	ff010113          	addi	sp,sp,-16
    80002510:	00813423          	sd	s0,8(sp)
    80002514:	01010413          	addi	s0,sp,16

        if (!addr) return -1;
    80002518:	0a050863          	beqz	a0,800025c8 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0xbc>

        auto *target = (BlkHeader *)((size_t) addr - sizeof(BlkHeader));
    8000251c:	ff050613          	addi	a2,a0,-16
    80002520:	00060693          	mv	a3,a2

        BlkHeader *curr = freeHead, *prev = nullptr;
    80002524:	00008797          	auipc	a5,0x8
    80002528:	dc47b783          	ld	a5,-572(a5) # 8000a2e8 <_ZN6Kernel15MemoryAllocator8freeHeadE>
    8000252c:	00000713          	li	a4,0

        for (; target > curr && curr; prev = curr, curr = curr->next);
    80002530:	00d7fa63          	bgeu	a5,a3,80002544 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x38>
    80002534:	00078863          	beqz	a5,80002544 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x38>
    80002538:	00078713          	mv	a4,a5
    8000253c:	0087b783          	ld	a5,8(a5)
    80002540:	ff1ff06f          	j	80002530 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x24>

        target->next = curr;
    80002544:	00f63423          	sd	a5,8(a2)

        if ((size_t)target + target->size*MEM_BLOCK_SIZE == (size_t)curr && curr) {
    80002548:	ff053583          	ld	a1,-16(a0)
    8000254c:	00659693          	slli	a3,a1,0x6
    80002550:	00d606b3          	add	a3,a2,a3
    80002554:	02f68663          	beq	a3,a5,80002580 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x74>
            target->size += curr->size;
            target->next = curr->next;
        }
        if (prev) {
    80002558:	06070063          	beqz	a4,800025b8 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0xac>
            prev->next = target;
    8000255c:	00c73423          	sd	a2,8(a4)
            if ((size_t)prev + prev->size*MEM_BLOCK_SIZE == (size_t)target) {
    80002560:	00073683          	ld	a3,0(a4)
    80002564:	00669793          	slli	a5,a3,0x6
    80002568:	00f707b3          	add	a5,a4,a5
    8000256c:	02f60863          	beq	a2,a5,8000259c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x90>
                prev->next = target->next;
            }
        } else {
            freeHead = target;
        }
        return 0;
    80002570:	00000513          	li	a0,0
    }
    80002574:	00813403          	ld	s0,8(sp)
    80002578:	01010113          	addi	sp,sp,16
    8000257c:	00008067          	ret
        if ((size_t)target + target->size*MEM_BLOCK_SIZE == (size_t)curr && curr) {
    80002580:	fc078ce3          	beqz	a5,80002558 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x4c>
            target->size += curr->size;
    80002584:	0007b683          	ld	a3,0(a5)
    80002588:	00d585b3          	add	a1,a1,a3
    8000258c:	feb53823          	sd	a1,-16(a0)
            target->next = curr->next;
    80002590:	0087b783          	ld	a5,8(a5)
    80002594:	00f63423          	sd	a5,8(a2)
    80002598:	fc1ff06f          	j	80002558 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x4c>
                prev->size += target->size;
    8000259c:	ff053783          	ld	a5,-16(a0)
    800025a0:	00f686b3          	add	a3,a3,a5
    800025a4:	00d73023          	sd	a3,0(a4)
                prev->next = target->next;
    800025a8:	00863783          	ld	a5,8(a2)
    800025ac:	00f73423          	sd	a5,8(a4)
        return 0;
    800025b0:	00000513          	li	a0,0
    800025b4:	fc1ff06f          	j	80002574 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x68>
            freeHead = target;
    800025b8:	00008797          	auipc	a5,0x8
    800025bc:	d2c7b823          	sd	a2,-720(a5) # 8000a2e8 <_ZN6Kernel15MemoryAllocator8freeHeadE>
        return 0;
    800025c0:	00000513          	li	a0,0
    800025c4:	fb1ff06f          	j	80002574 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x68>
        if (!addr) return -1;
    800025c8:	fff00513          	li	a0,-1
    800025cc:	fa9ff06f          	j	80002574 <_ZN6Kernel15MemoryAllocator11__mem__freeEPv+0x68>

00000000800025d0 <_Z41__static_initialization_and_destruction_0ii>:

    }



    800025d0:	ff010113          	addi	sp,sp,-16
    800025d4:	00813423          	sd	s0,8(sp)
    800025d8:	01010413          	addi	s0,sp,16
    800025dc:	00100793          	li	a5,1
    800025e0:	00f50863          	beq	a0,a5,800025f0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800025e4:	00813403          	ld	s0,8(sp)
    800025e8:	01010113          	addi	sp,sp,16
    800025ec:	00008067          	ret
    800025f0:	000107b7          	lui	a5,0x10
    800025f4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800025f8:	fef596e3          	bne	a1,a5,800025e4 <_Z41__static_initialization_and_destruction_0ii+0x14>
        List() : head(0), tail(0) {}
    800025fc:	00008797          	auipc	a5,0x8
    80002600:	cf478793          	addi	a5,a5,-780 # 8000a2f0 <_ZN6Kernel9Scheduler6readyQE>
    80002604:	0007b023          	sd	zero,0(a5)
    80002608:	0007b423          	sd	zero,8(a5)
    8000260c:	fd9ff06f          	j	800025e4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002610 <_ZN6Kernel9Scheduler3getEv>:
    TCB *Scheduler::get() {
    80002610:	fe010113          	addi	sp,sp,-32
    80002614:	00113c23          	sd	ra,24(sp)
    80002618:	00813823          	sd	s0,16(sp)
    8000261c:	00913423          	sd	s1,8(sp)
    80002620:	02010413          	addi	s0,sp,32
            if (!head) { return 0; }
    80002624:	00008517          	auipc	a0,0x8
    80002628:	ccc53503          	ld	a0,-820(a0) # 8000a2f0 <_ZN6Kernel9Scheduler6readyQE>
    8000262c:	04050263          	beqz	a0,80002670 <_ZN6Kernel9Scheduler3getEv+0x60>
            head = head->next;
    80002630:	00853783          	ld	a5,8(a0)
    80002634:	00008717          	auipc	a4,0x8
    80002638:	caf73e23          	sd	a5,-836(a4) # 8000a2f0 <_ZN6Kernel9Scheduler6readyQE>
            if (!head) { tail = 0; }
    8000263c:	02078463          	beqz	a5,80002664 <_ZN6Kernel9Scheduler3getEv+0x54>
            T *ret = elem->data;
    80002640:	00053483          	ld	s1,0(a0)
                MemoryAllocator::__mem__free(p);
    80002644:	00000097          	auipc	ra,0x0
    80002648:	ec8080e7          	jalr	-312(ra) # 8000250c <_ZN6Kernel15MemoryAllocator11__mem__freeEPv>
    }
    8000264c:	00048513          	mv	a0,s1
    80002650:	01813083          	ld	ra,24(sp)
    80002654:	01013403          	ld	s0,16(sp)
    80002658:	00813483          	ld	s1,8(sp)
    8000265c:	02010113          	addi	sp,sp,32
    80002660:	00008067          	ret
            if (!head) { tail = 0; }
    80002664:	00008797          	auipc	a5,0x8
    80002668:	c807ba23          	sd	zero,-876(a5) # 8000a2f8 <_ZN6Kernel9Scheduler6readyQE+0x8>
    8000266c:	fd5ff06f          	j	80002640 <_ZN6Kernel9Scheduler3getEv+0x30>
            if (!head) { return 0; }
    80002670:	00050493          	mv	s1,a0
        return readyQ.removeFirst();
    80002674:	fd9ff06f          	j	8000264c <_ZN6Kernel9Scheduler3getEv+0x3c>

0000000080002678 <_ZN6Kernel9Scheduler3putEPNS_3TCBE>:
    void Scheduler::put(TCB *t) {
    80002678:	fe010113          	addi	sp,sp,-32
    8000267c:	00113c23          	sd	ra,24(sp)
    80002680:	00813823          	sd	s0,16(sp)
    80002684:	00913423          	sd	s1,8(sp)
    80002688:	02010413          	addi	s0,sp,32
    8000268c:	00050493          	mv	s1,a0
                return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(n));
    80002690:	00100513          	li	a0,1
    80002694:	00000097          	auipc	ra,0x0
    80002698:	dd4080e7          	jalr	-556(ra) # 80002468 <_ZN6Kernel15MemoryAllocator12__mem__allocEm>
            Elem(T *data, Elem *next) : data(data), next(next) {}
    8000269c:	00953023          	sd	s1,0(a0)
    800026a0:	00053423          	sd	zero,8(a0)
            if (tail) {
    800026a4:	00008797          	auipc	a5,0x8
    800026a8:	c547b783          	ld	a5,-940(a5) # 8000a2f8 <_ZN6Kernel9Scheduler6readyQE+0x8>
    800026ac:	02078263          	beqz	a5,800026d0 <_ZN6Kernel9Scheduler3putEPNS_3TCBE+0x58>
                tail->next = elem;
    800026b0:	00a7b423          	sd	a0,8(a5)
                tail = elem;
    800026b4:	00008797          	auipc	a5,0x8
    800026b8:	c4a7b223          	sd	a0,-956(a5) # 8000a2f8 <_ZN6Kernel9Scheduler6readyQE+0x8>
    }
    800026bc:	01813083          	ld	ra,24(sp)
    800026c0:	01013403          	ld	s0,16(sp)
    800026c4:	00813483          	ld	s1,8(sp)
    800026c8:	02010113          	addi	sp,sp,32
    800026cc:	00008067          	ret
                head = tail = elem;
    800026d0:	00008797          	auipc	a5,0x8
    800026d4:	c2078793          	addi	a5,a5,-992 # 8000a2f0 <_ZN6Kernel9Scheduler6readyQE>
    800026d8:	00a7b423          	sd	a0,8(a5)
    800026dc:	00a7b023          	sd	a0,0(a5)
    800026e0:	fddff06f          	j	800026bc <_ZN6Kernel9Scheduler3putEPNS_3TCBE+0x44>

00000000800026e4 <_GLOBAL__sub_I__ZN6Kernel9Scheduler6readyQE>:
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00113423          	sd	ra,8(sp)
    800026ec:	00813023          	sd	s0,0(sp)
    800026f0:	01010413          	addi	s0,sp,16
    800026f4:	000105b7          	lui	a1,0x10
    800026f8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800026fc:	00100513          	li	a0,1
    80002700:	00000097          	auipc	ra,0x0
    80002704:	ed0080e7          	jalr	-304(ra) # 800025d0 <_Z41__static_initialization_and_destruction_0ii>
    80002708:	00813083          	ld	ra,8(sp)
    8000270c:	00013403          	ld	s0,0(sp)
    80002710:	01010113          	addi	sp,sp,16
    80002714:	00008067          	ret

0000000080002718 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002718:	fe010113          	addi	sp,sp,-32
    8000271c:	00113c23          	sd	ra,24(sp)
    80002720:	00813823          	sd	s0,16(sp)
    80002724:	00913423          	sd	s1,8(sp)
    80002728:	01213023          	sd	s2,0(sp)
    8000272c:	02010413          	addi	s0,sp,32
    80002730:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002734:	00000913          	li	s2,0
    80002738:	00c0006f          	j	80002744 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	c80080e7          	jalr	-896(ra) # 800013bc <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	e34080e7          	jalr	-460(ra) # 80001578 <_Z4getcv>
    8000274c:	0005059b          	sext.w	a1,a0
    80002750:	01b00793          	li	a5,27
    80002754:	02f58a63          	beq	a1,a5,80002788 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002758:	0084b503          	ld	a0,8(s1)
    8000275c:	00003097          	auipc	ra,0x3
    80002760:	b44080e7          	jalr	-1212(ra) # 800052a0 <_ZN6Buffer3putEi>
        i++;
    80002764:	0019071b          	addiw	a4,s2,1
    80002768:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000276c:	0004a683          	lw	a3,0(s1)
    80002770:	0026979b          	slliw	a5,a3,0x2
    80002774:	00d787bb          	addw	a5,a5,a3
    80002778:	0017979b          	slliw	a5,a5,0x1
    8000277c:	02f767bb          	remw	a5,a4,a5
    80002780:	fc0792e3          	bnez	a5,80002744 <_ZL16producerKeyboardPv+0x2c>
    80002784:	fb9ff06f          	j	8000273c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002788:	00100793          	li	a5,1
    8000278c:	00008717          	auipc	a4,0x8
    80002790:	b6f72a23          	sw	a5,-1164(a4) # 8000a300 <_ZL9threadEnd>
    data->buffer->put('!');
    80002794:	02100593          	li	a1,33
    80002798:	0084b503          	ld	a0,8(s1)
    8000279c:	00003097          	auipc	ra,0x3
    800027a0:	b04080e7          	jalr	-1276(ra) # 800052a0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800027a4:	0104b503          	ld	a0,16(s1)
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	d14080e7          	jalr	-748(ra) # 800014bc <_Z10sem_signalP4_sem>
}
    800027b0:	01813083          	ld	ra,24(sp)
    800027b4:	01013403          	ld	s0,16(sp)
    800027b8:	00813483          	ld	s1,8(sp)
    800027bc:	00013903          	ld	s2,0(sp)
    800027c0:	02010113          	addi	sp,sp,32
    800027c4:	00008067          	ret

00000000800027c8 <_ZL8producerPv>:

static void producer(void *arg) {
    800027c8:	fe010113          	addi	sp,sp,-32
    800027cc:	00113c23          	sd	ra,24(sp)
    800027d0:	00813823          	sd	s0,16(sp)
    800027d4:	00913423          	sd	s1,8(sp)
    800027d8:	01213023          	sd	s2,0(sp)
    800027dc:	02010413          	addi	s0,sp,32
    800027e0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800027e4:	00000913          	li	s2,0
    800027e8:	00c0006f          	j	800027f4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800027ec:	fffff097          	auipc	ra,0xfffff
    800027f0:	bd0080e7          	jalr	-1072(ra) # 800013bc <_Z15thread_dispatchv>
    while (!threadEnd) {
    800027f4:	00008797          	auipc	a5,0x8
    800027f8:	b0c7a783          	lw	a5,-1268(a5) # 8000a300 <_ZL9threadEnd>
    800027fc:	02079e63          	bnez	a5,80002838 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002800:	0004a583          	lw	a1,0(s1)
    80002804:	0305859b          	addiw	a1,a1,48
    80002808:	0084b503          	ld	a0,8(s1)
    8000280c:	00003097          	auipc	ra,0x3
    80002810:	a94080e7          	jalr	-1388(ra) # 800052a0 <_ZN6Buffer3putEi>
        i++;
    80002814:	0019071b          	addiw	a4,s2,1
    80002818:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000281c:	0004a683          	lw	a3,0(s1)
    80002820:	0026979b          	slliw	a5,a3,0x2
    80002824:	00d787bb          	addw	a5,a5,a3
    80002828:	0017979b          	slliw	a5,a5,0x1
    8000282c:	02f767bb          	remw	a5,a4,a5
    80002830:	fc0792e3          	bnez	a5,800027f4 <_ZL8producerPv+0x2c>
    80002834:	fb9ff06f          	j	800027ec <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002838:	0104b503          	ld	a0,16(s1)
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	c80080e7          	jalr	-896(ra) # 800014bc <_Z10sem_signalP4_sem>
}
    80002844:	01813083          	ld	ra,24(sp)
    80002848:	01013403          	ld	s0,16(sp)
    8000284c:	00813483          	ld	s1,8(sp)
    80002850:	00013903          	ld	s2,0(sp)
    80002854:	02010113          	addi	sp,sp,32
    80002858:	00008067          	ret

000000008000285c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000285c:	fd010113          	addi	sp,sp,-48
    80002860:	02113423          	sd	ra,40(sp)
    80002864:	02813023          	sd	s0,32(sp)
    80002868:	00913c23          	sd	s1,24(sp)
    8000286c:	01213823          	sd	s2,16(sp)
    80002870:	01313423          	sd	s3,8(sp)
    80002874:	03010413          	addi	s0,sp,48
    80002878:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000287c:	00000993          	li	s3,0
    80002880:	01c0006f          	j	8000289c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002884:	fffff097          	auipc	ra,0xfffff
    80002888:	b38080e7          	jalr	-1224(ra) # 800013bc <_Z15thread_dispatchv>
    8000288c:	0500006f          	j	800028dc <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002890:	00a00513          	li	a0,10
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	ca8080e7          	jalr	-856(ra) # 8000153c <_Z4putcc>
    while (!threadEnd) {
    8000289c:	00008797          	auipc	a5,0x8
    800028a0:	a647a783          	lw	a5,-1436(a5) # 8000a300 <_ZL9threadEnd>
    800028a4:	06079063          	bnez	a5,80002904 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800028a8:	00893503          	ld	a0,8(s2)
    800028ac:	00003097          	auipc	ra,0x3
    800028b0:	a84080e7          	jalr	-1404(ra) # 80005330 <_ZN6Buffer3getEv>
        i++;
    800028b4:	0019849b          	addiw	s1,s3,1
    800028b8:	0004899b          	sext.w	s3,s1
        putc(key);
    800028bc:	0ff57513          	andi	a0,a0,255
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	c7c080e7          	jalr	-900(ra) # 8000153c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800028c8:	00092703          	lw	a4,0(s2)
    800028cc:	0027179b          	slliw	a5,a4,0x2
    800028d0:	00e787bb          	addw	a5,a5,a4
    800028d4:	02f4e7bb          	remw	a5,s1,a5
    800028d8:	fa0786e3          	beqz	a5,80002884 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800028dc:	05000793          	li	a5,80
    800028e0:	02f4e4bb          	remw	s1,s1,a5
    800028e4:	fa049ce3          	bnez	s1,8000289c <_ZL8consumerPv+0x40>
    800028e8:	fa9ff06f          	j	80002890 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800028ec:	00893503          	ld	a0,8(s2)
    800028f0:	00003097          	auipc	ra,0x3
    800028f4:	a40080e7          	jalr	-1472(ra) # 80005330 <_ZN6Buffer3getEv>
        putc(key);
    800028f8:	0ff57513          	andi	a0,a0,255
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	c40080e7          	jalr	-960(ra) # 8000153c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002904:	00893503          	ld	a0,8(s2)
    80002908:	00003097          	auipc	ra,0x3
    8000290c:	ab4080e7          	jalr	-1356(ra) # 800053bc <_ZN6Buffer6getCntEv>
    80002910:	fca04ee3          	bgtz	a0,800028ec <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002914:	01093503          	ld	a0,16(s2)
    80002918:	fffff097          	auipc	ra,0xfffff
    8000291c:	ba4080e7          	jalr	-1116(ra) # 800014bc <_Z10sem_signalP4_sem>
}
    80002920:	02813083          	ld	ra,40(sp)
    80002924:	02013403          	ld	s0,32(sp)
    80002928:	01813483          	ld	s1,24(sp)
    8000292c:	01013903          	ld	s2,16(sp)
    80002930:	00813983          	ld	s3,8(sp)
    80002934:	03010113          	addi	sp,sp,48
    80002938:	00008067          	ret

000000008000293c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000293c:	f9010113          	addi	sp,sp,-112
    80002940:	06113423          	sd	ra,104(sp)
    80002944:	06813023          	sd	s0,96(sp)
    80002948:	04913c23          	sd	s1,88(sp)
    8000294c:	05213823          	sd	s2,80(sp)
    80002950:	05313423          	sd	s3,72(sp)
    80002954:	05413023          	sd	s4,64(sp)
    80002958:	03513c23          	sd	s5,56(sp)
    8000295c:	03613823          	sd	s6,48(sp)
    80002960:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002964:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002968:	00006517          	auipc	a0,0x6
    8000296c:	80050513          	addi	a0,a0,-2048 # 80008168 <CONSOLE_STATUS+0x158>
    80002970:	00002097          	auipc	ra,0x2
    80002974:	a9c080e7          	jalr	-1380(ra) # 8000440c <_Z11printStringPKc>
    getString(input, 30);
    80002978:	01e00593          	li	a1,30
    8000297c:	fa040493          	addi	s1,s0,-96
    80002980:	00048513          	mv	a0,s1
    80002984:	00002097          	auipc	ra,0x2
    80002988:	b10080e7          	jalr	-1264(ra) # 80004494 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000298c:	00048513          	mv	a0,s1
    80002990:	00002097          	auipc	ra,0x2
    80002994:	bdc080e7          	jalr	-1060(ra) # 8000456c <_Z11stringToIntPKc>
    80002998:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000299c:	00005517          	auipc	a0,0x5
    800029a0:	7ec50513          	addi	a0,a0,2028 # 80008188 <CONSOLE_STATUS+0x178>
    800029a4:	00002097          	auipc	ra,0x2
    800029a8:	a68080e7          	jalr	-1432(ra) # 8000440c <_Z11printStringPKc>
    getString(input, 30);
    800029ac:	01e00593          	li	a1,30
    800029b0:	00048513          	mv	a0,s1
    800029b4:	00002097          	auipc	ra,0x2
    800029b8:	ae0080e7          	jalr	-1312(ra) # 80004494 <_Z9getStringPci>
    n = stringToInt(input);
    800029bc:	00048513          	mv	a0,s1
    800029c0:	00002097          	auipc	ra,0x2
    800029c4:	bac080e7          	jalr	-1108(ra) # 8000456c <_Z11stringToIntPKc>
    800029c8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800029cc:	00005517          	auipc	a0,0x5
    800029d0:	7dc50513          	addi	a0,a0,2012 # 800081a8 <CONSOLE_STATUS+0x198>
    800029d4:	00002097          	auipc	ra,0x2
    800029d8:	a38080e7          	jalr	-1480(ra) # 8000440c <_Z11printStringPKc>
    800029dc:	00000613          	li	a2,0
    800029e0:	00a00593          	li	a1,10
    800029e4:	00090513          	mv	a0,s2
    800029e8:	00002097          	auipc	ra,0x2
    800029ec:	bd4080e7          	jalr	-1068(ra) # 800045bc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800029f0:	00005517          	auipc	a0,0x5
    800029f4:	7d050513          	addi	a0,a0,2000 # 800081c0 <CONSOLE_STATUS+0x1b0>
    800029f8:	00002097          	auipc	ra,0x2
    800029fc:	a14080e7          	jalr	-1516(ra) # 8000440c <_Z11printStringPKc>
    80002a00:	00000613          	li	a2,0
    80002a04:	00a00593          	li	a1,10
    80002a08:	00048513          	mv	a0,s1
    80002a0c:	00002097          	auipc	ra,0x2
    80002a10:	bb0080e7          	jalr	-1104(ra) # 800045bc <_Z8printIntiii>
    printString(".\n");
    80002a14:	00005517          	auipc	a0,0x5
    80002a18:	7c450513          	addi	a0,a0,1988 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80002a1c:	00002097          	auipc	ra,0x2
    80002a20:	9f0080e7          	jalr	-1552(ra) # 8000440c <_Z11printStringPKc>
    if(threadNum > n) {
    80002a24:	0324c463          	blt	s1,s2,80002a4c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002a28:	03205c63          	blez	s2,80002a60 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002a2c:	03800513          	li	a0,56
    80002a30:	fffff097          	auipc	ra,0xfffff
    80002a34:	43c080e7          	jalr	1084(ra) # 80001e6c <_Znwm>
    80002a38:	00050a13          	mv	s4,a0
    80002a3c:	00048593          	mv	a1,s1
    80002a40:	00002097          	auipc	ra,0x2
    80002a44:	7c4080e7          	jalr	1988(ra) # 80005204 <_ZN6BufferC1Ei>
    80002a48:	0300006f          	j	80002a78 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002a4c:	00005517          	auipc	a0,0x5
    80002a50:	79450513          	addi	a0,a0,1940 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80002a54:	00002097          	auipc	ra,0x2
    80002a58:	9b8080e7          	jalr	-1608(ra) # 8000440c <_Z11printStringPKc>
        return;
    80002a5c:	0140006f          	j	80002a70 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002a60:	00005517          	auipc	a0,0x5
    80002a64:	7c050513          	addi	a0,a0,1984 # 80008220 <CONSOLE_STATUS+0x210>
    80002a68:	00002097          	auipc	ra,0x2
    80002a6c:	9a4080e7          	jalr	-1628(ra) # 8000440c <_Z11printStringPKc>
        return;
    80002a70:	000b0113          	mv	sp,s6
    80002a74:	1500006f          	j	80002bc4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002a78:	00000593          	li	a1,0
    80002a7c:	00008517          	auipc	a0,0x8
    80002a80:	88c50513          	addi	a0,a0,-1908 # 8000a308 <_ZL10waitForAll>
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	974080e7          	jalr	-1676(ra) # 800013f8 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80002a8c:	00391793          	slli	a5,s2,0x3
    80002a90:	00f78793          	addi	a5,a5,15
    80002a94:	ff07f793          	andi	a5,a5,-16
    80002a98:	40f10133          	sub	sp,sp,a5
    80002a9c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002aa0:	0019071b          	addiw	a4,s2,1
    80002aa4:	00171793          	slli	a5,a4,0x1
    80002aa8:	00e787b3          	add	a5,a5,a4
    80002aac:	00379793          	slli	a5,a5,0x3
    80002ab0:	00f78793          	addi	a5,a5,15
    80002ab4:	ff07f793          	andi	a5,a5,-16
    80002ab8:	40f10133          	sub	sp,sp,a5
    80002abc:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002ac0:	00191613          	slli	a2,s2,0x1
    80002ac4:	012607b3          	add	a5,a2,s2
    80002ac8:	00379793          	slli	a5,a5,0x3
    80002acc:	00f987b3          	add	a5,s3,a5
    80002ad0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002ad4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002ad8:	00008717          	auipc	a4,0x8
    80002adc:	83073703          	ld	a4,-2000(a4) # 8000a308 <_ZL10waitForAll>
    80002ae0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002ae4:	00078613          	mv	a2,a5
    80002ae8:	00000597          	auipc	a1,0x0
    80002aec:	d7458593          	addi	a1,a1,-652 # 8000285c <_ZL8consumerPv>
    80002af0:	f9840513          	addi	a0,s0,-104
    80002af4:	fffff097          	auipc	ra,0xfffff
    80002af8:	818080e7          	jalr	-2024(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002afc:	00000493          	li	s1,0
    80002b00:	0280006f          	j	80002b28 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80002b04:	00000597          	auipc	a1,0x0
    80002b08:	c1458593          	addi	a1,a1,-1004 # 80002718 <_ZL16producerKeyboardPv>
                      data + i);
    80002b0c:	00179613          	slli	a2,a5,0x1
    80002b10:	00f60633          	add	a2,a2,a5
    80002b14:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80002b18:	00c98633          	add	a2,s3,a2
    80002b1c:	ffffe097          	auipc	ra,0xffffe
    80002b20:	7f0080e7          	jalr	2032(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002b24:	0014849b          	addiw	s1,s1,1
    80002b28:	0524d263          	bge	s1,s2,80002b6c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80002b2c:	00149793          	slli	a5,s1,0x1
    80002b30:	009787b3          	add	a5,a5,s1
    80002b34:	00379793          	slli	a5,a5,0x3
    80002b38:	00f987b3          	add	a5,s3,a5
    80002b3c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002b40:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002b44:	00007717          	auipc	a4,0x7
    80002b48:	7c473703          	ld	a4,1988(a4) # 8000a308 <_ZL10waitForAll>
    80002b4c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002b50:	00048793          	mv	a5,s1
    80002b54:	00349513          	slli	a0,s1,0x3
    80002b58:	00aa8533          	add	a0,s5,a0
    80002b5c:	fa9054e3          	blez	s1,80002b04 <_Z22producerConsumer_C_APIv+0x1c8>
    80002b60:	00000597          	auipc	a1,0x0
    80002b64:	c6858593          	addi	a1,a1,-920 # 800027c8 <_ZL8producerPv>
    80002b68:	fa5ff06f          	j	80002b0c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002b6c:	fffff097          	auipc	ra,0xfffff
    80002b70:	850080e7          	jalr	-1968(ra) # 800013bc <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002b74:	00000493          	li	s1,0
    80002b78:	00994e63          	blt	s2,s1,80002b94 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002b7c:	00007517          	auipc	a0,0x7
    80002b80:	78c53503          	ld	a0,1932(a0) # 8000a308 <_ZL10waitForAll>
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	8f8080e7          	jalr	-1800(ra) # 8000147c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80002b8c:	0014849b          	addiw	s1,s1,1
    80002b90:	fe9ff06f          	j	80002b78 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002b94:	00007517          	auipc	a0,0x7
    80002b98:	77453503          	ld	a0,1908(a0) # 8000a308 <_ZL10waitForAll>
    80002b9c:	fffff097          	auipc	ra,0xfffff
    80002ba0:	8a0080e7          	jalr	-1888(ra) # 8000143c <_Z9sem_closeP4_sem>
    delete buffer;
    80002ba4:	000a0e63          	beqz	s4,80002bc0 <_Z22producerConsumer_C_APIv+0x284>
    80002ba8:	000a0513          	mv	a0,s4
    80002bac:	00003097          	auipc	ra,0x3
    80002bb0:	898080e7          	jalr	-1896(ra) # 80005444 <_ZN6BufferD1Ev>
    80002bb4:	000a0513          	mv	a0,s4
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	2dc080e7          	jalr	732(ra) # 80001e94 <_ZdlPv>
    80002bc0:	000b0113          	mv	sp,s6

}
    80002bc4:	f9040113          	addi	sp,s0,-112
    80002bc8:	06813083          	ld	ra,104(sp)
    80002bcc:	06013403          	ld	s0,96(sp)
    80002bd0:	05813483          	ld	s1,88(sp)
    80002bd4:	05013903          	ld	s2,80(sp)
    80002bd8:	04813983          	ld	s3,72(sp)
    80002bdc:	04013a03          	ld	s4,64(sp)
    80002be0:	03813a83          	ld	s5,56(sp)
    80002be4:	03013b03          	ld	s6,48(sp)
    80002be8:	07010113          	addi	sp,sp,112
    80002bec:	00008067          	ret
    80002bf0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80002bf4:	000a0513          	mv	a0,s4
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	29c080e7          	jalr	668(ra) # 80001e94 <_ZdlPv>
    80002c00:	00048513          	mv	a0,s1
    80002c04:	00009097          	auipc	ra,0x9
    80002c08:	804080e7          	jalr	-2044(ra) # 8000b408 <_Unwind_Resume>

0000000080002c0c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002c0c:	fe010113          	addi	sp,sp,-32
    80002c10:	00113c23          	sd	ra,24(sp)
    80002c14:	00813823          	sd	s0,16(sp)
    80002c18:	00913423          	sd	s1,8(sp)
    80002c1c:	01213023          	sd	s2,0(sp)
    80002c20:	02010413          	addi	s0,sp,32
    80002c24:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002c28:	00100793          	li	a5,1
    80002c2c:	02a7f863          	bgeu	a5,a0,80002c5c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002c30:	00a00793          	li	a5,10
    80002c34:	02f577b3          	remu	a5,a0,a5
    80002c38:	02078e63          	beqz	a5,80002c74 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002c3c:	fff48513          	addi	a0,s1,-1
    80002c40:	00000097          	auipc	ra,0x0
    80002c44:	fcc080e7          	jalr	-52(ra) # 80002c0c <_ZL9fibonaccim>
    80002c48:	00050913          	mv	s2,a0
    80002c4c:	ffe48513          	addi	a0,s1,-2
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	fbc080e7          	jalr	-68(ra) # 80002c0c <_ZL9fibonaccim>
    80002c58:	00a90533          	add	a0,s2,a0
}
    80002c5c:	01813083          	ld	ra,24(sp)
    80002c60:	01013403          	ld	s0,16(sp)
    80002c64:	00813483          	ld	s1,8(sp)
    80002c68:	00013903          	ld	s2,0(sp)
    80002c6c:	02010113          	addi	sp,sp,32
    80002c70:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002c74:	ffffe097          	auipc	ra,0xffffe
    80002c78:	748080e7          	jalr	1864(ra) # 800013bc <_Z15thread_dispatchv>
    80002c7c:	fc1ff06f          	j	80002c3c <_ZL9fibonaccim+0x30>

0000000080002c80 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002c80:	fe010113          	addi	sp,sp,-32
    80002c84:	00113c23          	sd	ra,24(sp)
    80002c88:	00813823          	sd	s0,16(sp)
    80002c8c:	00913423          	sd	s1,8(sp)
    80002c90:	01213023          	sd	s2,0(sp)
    80002c94:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002c98:	00000913          	li	s2,0
    80002c9c:	0380006f          	j	80002cd4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002ca0:	ffffe097          	auipc	ra,0xffffe
    80002ca4:	71c080e7          	jalr	1820(ra) # 800013bc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002ca8:	00148493          	addi	s1,s1,1
    80002cac:	000027b7          	lui	a5,0x2
    80002cb0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002cb4:	0097ee63          	bltu	a5,s1,80002cd0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002cb8:	00000713          	li	a4,0
    80002cbc:	000077b7          	lui	a5,0x7
    80002cc0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002cc4:	fce7eee3          	bltu	a5,a4,80002ca0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002cc8:	00170713          	addi	a4,a4,1
    80002ccc:	ff1ff06f          	j	80002cbc <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002cd0:	00190913          	addi	s2,s2,1
    80002cd4:	00900793          	li	a5,9
    80002cd8:	0527e063          	bltu	a5,s2,80002d18 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002cdc:	00005517          	auipc	a0,0x5
    80002ce0:	57450513          	addi	a0,a0,1396 # 80008250 <CONSOLE_STATUS+0x240>
    80002ce4:	00001097          	auipc	ra,0x1
    80002ce8:	728080e7          	jalr	1832(ra) # 8000440c <_Z11printStringPKc>
    80002cec:	00000613          	li	a2,0
    80002cf0:	00a00593          	li	a1,10
    80002cf4:	0009051b          	sext.w	a0,s2
    80002cf8:	00002097          	auipc	ra,0x2
    80002cfc:	8c4080e7          	jalr	-1852(ra) # 800045bc <_Z8printIntiii>
    80002d00:	00005517          	auipc	a0,0x5
    80002d04:	7d050513          	addi	a0,a0,2000 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002d08:	00001097          	auipc	ra,0x1
    80002d0c:	704080e7          	jalr	1796(ra) # 8000440c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002d10:	00000493          	li	s1,0
    80002d14:	f99ff06f          	j	80002cac <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002d18:	00005517          	auipc	a0,0x5
    80002d1c:	54050513          	addi	a0,a0,1344 # 80008258 <CONSOLE_STATUS+0x248>
    80002d20:	00001097          	auipc	ra,0x1
    80002d24:	6ec080e7          	jalr	1772(ra) # 8000440c <_Z11printStringPKc>
    finishedA = true;
    80002d28:	00100793          	li	a5,1
    80002d2c:	00007717          	auipc	a4,0x7
    80002d30:	5ef70223          	sb	a5,1508(a4) # 8000a310 <_ZL9finishedA>
}
    80002d34:	01813083          	ld	ra,24(sp)
    80002d38:	01013403          	ld	s0,16(sp)
    80002d3c:	00813483          	ld	s1,8(sp)
    80002d40:	00013903          	ld	s2,0(sp)
    80002d44:	02010113          	addi	sp,sp,32
    80002d48:	00008067          	ret

0000000080002d4c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80002d4c:	fe010113          	addi	sp,sp,-32
    80002d50:	00113c23          	sd	ra,24(sp)
    80002d54:	00813823          	sd	s0,16(sp)
    80002d58:	00913423          	sd	s1,8(sp)
    80002d5c:	01213023          	sd	s2,0(sp)
    80002d60:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002d64:	00000913          	li	s2,0
    80002d68:	0380006f          	j	80002da0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002d6c:	ffffe097          	auipc	ra,0xffffe
    80002d70:	650080e7          	jalr	1616(ra) # 800013bc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002d74:	00148493          	addi	s1,s1,1
    80002d78:	000027b7          	lui	a5,0x2
    80002d7c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002d80:	0097ee63          	bltu	a5,s1,80002d9c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002d84:	00000713          	li	a4,0
    80002d88:	000077b7          	lui	a5,0x7
    80002d8c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002d90:	fce7eee3          	bltu	a5,a4,80002d6c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002d94:	00170713          	addi	a4,a4,1
    80002d98:	ff1ff06f          	j	80002d88 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80002d9c:	00190913          	addi	s2,s2,1
    80002da0:	00f00793          	li	a5,15
    80002da4:	0527e063          	bltu	a5,s2,80002de4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80002da8:	00005517          	auipc	a0,0x5
    80002dac:	4c050513          	addi	a0,a0,1216 # 80008268 <CONSOLE_STATUS+0x258>
    80002db0:	00001097          	auipc	ra,0x1
    80002db4:	65c080e7          	jalr	1628(ra) # 8000440c <_Z11printStringPKc>
    80002db8:	00000613          	li	a2,0
    80002dbc:	00a00593          	li	a1,10
    80002dc0:	0009051b          	sext.w	a0,s2
    80002dc4:	00001097          	auipc	ra,0x1
    80002dc8:	7f8080e7          	jalr	2040(ra) # 800045bc <_Z8printIntiii>
    80002dcc:	00005517          	auipc	a0,0x5
    80002dd0:	70450513          	addi	a0,a0,1796 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002dd4:	00001097          	auipc	ra,0x1
    80002dd8:	638080e7          	jalr	1592(ra) # 8000440c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002ddc:	00000493          	li	s1,0
    80002de0:	f99ff06f          	j	80002d78 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80002de4:	00005517          	auipc	a0,0x5
    80002de8:	48c50513          	addi	a0,a0,1164 # 80008270 <CONSOLE_STATUS+0x260>
    80002dec:	00001097          	auipc	ra,0x1
    80002df0:	620080e7          	jalr	1568(ra) # 8000440c <_Z11printStringPKc>
    finishedB = true;
    80002df4:	00100793          	li	a5,1
    80002df8:	00007717          	auipc	a4,0x7
    80002dfc:	50f70ca3          	sb	a5,1305(a4) # 8000a311 <_ZL9finishedB>
    thread_dispatch();
    80002e00:	ffffe097          	auipc	ra,0xffffe
    80002e04:	5bc080e7          	jalr	1468(ra) # 800013bc <_Z15thread_dispatchv>
}
    80002e08:	01813083          	ld	ra,24(sp)
    80002e0c:	01013403          	ld	s0,16(sp)
    80002e10:	00813483          	ld	s1,8(sp)
    80002e14:	00013903          	ld	s2,0(sp)
    80002e18:	02010113          	addi	sp,sp,32
    80002e1c:	00008067          	ret

0000000080002e20 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002e20:	fe010113          	addi	sp,sp,-32
    80002e24:	00113c23          	sd	ra,24(sp)
    80002e28:	00813823          	sd	s0,16(sp)
    80002e2c:	00913423          	sd	s1,8(sp)
    80002e30:	01213023          	sd	s2,0(sp)
    80002e34:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002e38:	00000493          	li	s1,0
    80002e3c:	0400006f          	j	80002e7c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002e40:	00005517          	auipc	a0,0x5
    80002e44:	44050513          	addi	a0,a0,1088 # 80008280 <CONSOLE_STATUS+0x270>
    80002e48:	00001097          	auipc	ra,0x1
    80002e4c:	5c4080e7          	jalr	1476(ra) # 8000440c <_Z11printStringPKc>
    80002e50:	00000613          	li	a2,0
    80002e54:	00a00593          	li	a1,10
    80002e58:	00048513          	mv	a0,s1
    80002e5c:	00001097          	auipc	ra,0x1
    80002e60:	760080e7          	jalr	1888(ra) # 800045bc <_Z8printIntiii>
    80002e64:	00005517          	auipc	a0,0x5
    80002e68:	66c50513          	addi	a0,a0,1644 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002e6c:	00001097          	auipc	ra,0x1
    80002e70:	5a0080e7          	jalr	1440(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002e74:	0014849b          	addiw	s1,s1,1
    80002e78:	0ff4f493          	andi	s1,s1,255
    80002e7c:	00200793          	li	a5,2
    80002e80:	fc97f0e3          	bgeu	a5,s1,80002e40 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80002e84:	00005517          	auipc	a0,0x5
    80002e88:	40450513          	addi	a0,a0,1028 # 80008288 <CONSOLE_STATUS+0x278>
    80002e8c:	00001097          	auipc	ra,0x1
    80002e90:	580080e7          	jalr	1408(ra) # 8000440c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002e94:	00700313          	li	t1,7
    thread_dispatch();
    80002e98:	ffffe097          	auipc	ra,0xffffe
    80002e9c:	524080e7          	jalr	1316(ra) # 800013bc <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002ea0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80002ea4:	00005517          	auipc	a0,0x5
    80002ea8:	3f450513          	addi	a0,a0,1012 # 80008298 <CONSOLE_STATUS+0x288>
    80002eac:	00001097          	auipc	ra,0x1
    80002eb0:	560080e7          	jalr	1376(ra) # 8000440c <_Z11printStringPKc>
    80002eb4:	00000613          	li	a2,0
    80002eb8:	00a00593          	li	a1,10
    80002ebc:	0009051b          	sext.w	a0,s2
    80002ec0:	00001097          	auipc	ra,0x1
    80002ec4:	6fc080e7          	jalr	1788(ra) # 800045bc <_Z8printIntiii>
    80002ec8:	00005517          	auipc	a0,0x5
    80002ecc:	60850513          	addi	a0,a0,1544 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002ed0:	00001097          	auipc	ra,0x1
    80002ed4:	53c080e7          	jalr	1340(ra) # 8000440c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80002ed8:	00c00513          	li	a0,12
    80002edc:	00000097          	auipc	ra,0x0
    80002ee0:	d30080e7          	jalr	-720(ra) # 80002c0c <_ZL9fibonaccim>
    80002ee4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002ee8:	00005517          	auipc	a0,0x5
    80002eec:	3b850513          	addi	a0,a0,952 # 800082a0 <CONSOLE_STATUS+0x290>
    80002ef0:	00001097          	auipc	ra,0x1
    80002ef4:	51c080e7          	jalr	1308(ra) # 8000440c <_Z11printStringPKc>
    80002ef8:	00000613          	li	a2,0
    80002efc:	00a00593          	li	a1,10
    80002f00:	0009051b          	sext.w	a0,s2
    80002f04:	00001097          	auipc	ra,0x1
    80002f08:	6b8080e7          	jalr	1720(ra) # 800045bc <_Z8printIntiii>
    80002f0c:	00005517          	auipc	a0,0x5
    80002f10:	5c450513          	addi	a0,a0,1476 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002f14:	00001097          	auipc	ra,0x1
    80002f18:	4f8080e7          	jalr	1272(ra) # 8000440c <_Z11printStringPKc>
    80002f1c:	0400006f          	j	80002f5c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002f20:	00005517          	auipc	a0,0x5
    80002f24:	36050513          	addi	a0,a0,864 # 80008280 <CONSOLE_STATUS+0x270>
    80002f28:	00001097          	auipc	ra,0x1
    80002f2c:	4e4080e7          	jalr	1252(ra) # 8000440c <_Z11printStringPKc>
    80002f30:	00000613          	li	a2,0
    80002f34:	00a00593          	li	a1,10
    80002f38:	00048513          	mv	a0,s1
    80002f3c:	00001097          	auipc	ra,0x1
    80002f40:	680080e7          	jalr	1664(ra) # 800045bc <_Z8printIntiii>
    80002f44:	00005517          	auipc	a0,0x5
    80002f48:	58c50513          	addi	a0,a0,1420 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002f4c:	00001097          	auipc	ra,0x1
    80002f50:	4c0080e7          	jalr	1216(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80002f54:	0014849b          	addiw	s1,s1,1
    80002f58:	0ff4f493          	andi	s1,s1,255
    80002f5c:	00500793          	li	a5,5
    80002f60:	fc97f0e3          	bgeu	a5,s1,80002f20 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80002f64:	00005517          	auipc	a0,0x5
    80002f68:	2f450513          	addi	a0,a0,756 # 80008258 <CONSOLE_STATUS+0x248>
    80002f6c:	00001097          	auipc	ra,0x1
    80002f70:	4a0080e7          	jalr	1184(ra) # 8000440c <_Z11printStringPKc>
    finishedC = true;
    80002f74:	00100793          	li	a5,1
    80002f78:	00007717          	auipc	a4,0x7
    80002f7c:	38f70d23          	sb	a5,922(a4) # 8000a312 <_ZL9finishedC>
    thread_dispatch();
    80002f80:	ffffe097          	auipc	ra,0xffffe
    80002f84:	43c080e7          	jalr	1084(ra) # 800013bc <_Z15thread_dispatchv>
}
    80002f88:	01813083          	ld	ra,24(sp)
    80002f8c:	01013403          	ld	s0,16(sp)
    80002f90:	00813483          	ld	s1,8(sp)
    80002f94:	00013903          	ld	s2,0(sp)
    80002f98:	02010113          	addi	sp,sp,32
    80002f9c:	00008067          	ret

0000000080002fa0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80002fa0:	fe010113          	addi	sp,sp,-32
    80002fa4:	00113c23          	sd	ra,24(sp)
    80002fa8:	00813823          	sd	s0,16(sp)
    80002fac:	00913423          	sd	s1,8(sp)
    80002fb0:	01213023          	sd	s2,0(sp)
    80002fb4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002fb8:	00a00493          	li	s1,10
    80002fbc:	0400006f          	j	80002ffc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002fc0:	00005517          	auipc	a0,0x5
    80002fc4:	2f050513          	addi	a0,a0,752 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80002fc8:	00001097          	auipc	ra,0x1
    80002fcc:	444080e7          	jalr	1092(ra) # 8000440c <_Z11printStringPKc>
    80002fd0:	00000613          	li	a2,0
    80002fd4:	00a00593          	li	a1,10
    80002fd8:	00048513          	mv	a0,s1
    80002fdc:	00001097          	auipc	ra,0x1
    80002fe0:	5e0080e7          	jalr	1504(ra) # 800045bc <_Z8printIntiii>
    80002fe4:	00005517          	auipc	a0,0x5
    80002fe8:	4ec50513          	addi	a0,a0,1260 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002fec:	00001097          	auipc	ra,0x1
    80002ff0:	420080e7          	jalr	1056(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002ff4:	0014849b          	addiw	s1,s1,1
    80002ff8:	0ff4f493          	andi	s1,s1,255
    80002ffc:	00c00793          	li	a5,12
    80003000:	fc97f0e3          	bgeu	a5,s1,80002fc0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003004:	00005517          	auipc	a0,0x5
    80003008:	2b450513          	addi	a0,a0,692 # 800082b8 <CONSOLE_STATUS+0x2a8>
    8000300c:	00001097          	auipc	ra,0x1
    80003010:	400080e7          	jalr	1024(ra) # 8000440c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003014:	00500313          	li	t1,5
    thread_dispatch();
    80003018:	ffffe097          	auipc	ra,0xffffe
    8000301c:	3a4080e7          	jalr	932(ra) # 800013bc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003020:	01000513          	li	a0,16
    80003024:	00000097          	auipc	ra,0x0
    80003028:	be8080e7          	jalr	-1048(ra) # 80002c0c <_ZL9fibonaccim>
    8000302c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003030:	00005517          	auipc	a0,0x5
    80003034:	29850513          	addi	a0,a0,664 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80003038:	00001097          	auipc	ra,0x1
    8000303c:	3d4080e7          	jalr	980(ra) # 8000440c <_Z11printStringPKc>
    80003040:	00000613          	li	a2,0
    80003044:	00a00593          	li	a1,10
    80003048:	0009051b          	sext.w	a0,s2
    8000304c:	00001097          	auipc	ra,0x1
    80003050:	570080e7          	jalr	1392(ra) # 800045bc <_Z8printIntiii>
    80003054:	00005517          	auipc	a0,0x5
    80003058:	47c50513          	addi	a0,a0,1148 # 800084d0 <CONSOLE_STATUS+0x4c0>
    8000305c:	00001097          	auipc	ra,0x1
    80003060:	3b0080e7          	jalr	944(ra) # 8000440c <_Z11printStringPKc>
    80003064:	0400006f          	j	800030a4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003068:	00005517          	auipc	a0,0x5
    8000306c:	24850513          	addi	a0,a0,584 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80003070:	00001097          	auipc	ra,0x1
    80003074:	39c080e7          	jalr	924(ra) # 8000440c <_Z11printStringPKc>
    80003078:	00000613          	li	a2,0
    8000307c:	00a00593          	li	a1,10
    80003080:	00048513          	mv	a0,s1
    80003084:	00001097          	auipc	ra,0x1
    80003088:	538080e7          	jalr	1336(ra) # 800045bc <_Z8printIntiii>
    8000308c:	00005517          	auipc	a0,0x5
    80003090:	44450513          	addi	a0,a0,1092 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003094:	00001097          	auipc	ra,0x1
    80003098:	378080e7          	jalr	888(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000309c:	0014849b          	addiw	s1,s1,1
    800030a0:	0ff4f493          	andi	s1,s1,255
    800030a4:	00f00793          	li	a5,15
    800030a8:	fc97f0e3          	bgeu	a5,s1,80003068 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800030ac:	00005517          	auipc	a0,0x5
    800030b0:	22c50513          	addi	a0,a0,556 # 800082d8 <CONSOLE_STATUS+0x2c8>
    800030b4:	00001097          	auipc	ra,0x1
    800030b8:	358080e7          	jalr	856(ra) # 8000440c <_Z11printStringPKc>
    finishedD = true;
    800030bc:	00100793          	li	a5,1
    800030c0:	00007717          	auipc	a4,0x7
    800030c4:	24f709a3          	sb	a5,595(a4) # 8000a313 <_ZL9finishedD>
    thread_dispatch();
    800030c8:	ffffe097          	auipc	ra,0xffffe
    800030cc:	2f4080e7          	jalr	756(ra) # 800013bc <_Z15thread_dispatchv>
}
    800030d0:	01813083          	ld	ra,24(sp)
    800030d4:	01013403          	ld	s0,16(sp)
    800030d8:	00813483          	ld	s1,8(sp)
    800030dc:	00013903          	ld	s2,0(sp)
    800030e0:	02010113          	addi	sp,sp,32
    800030e4:	00008067          	ret

00000000800030e8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800030e8:	fc010113          	addi	sp,sp,-64
    800030ec:	02113c23          	sd	ra,56(sp)
    800030f0:	02813823          	sd	s0,48(sp)
    800030f4:	02913423          	sd	s1,40(sp)
    800030f8:	03213023          	sd	s2,32(sp)
    800030fc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003100:	02000513          	li	a0,32
    80003104:	fffff097          	auipc	ra,0xfffff
    80003108:	d68080e7          	jalr	-664(ra) # 80001e6c <_Znwm>
    8000310c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003110:	fffff097          	auipc	ra,0xfffff
    80003114:	e74080e7          	jalr	-396(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80003118:	00007797          	auipc	a5,0x7
    8000311c:	02078793          	addi	a5,a5,32 # 8000a138 <_ZTV7WorkerA+0x10>
    80003120:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003124:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003128:	00005517          	auipc	a0,0x5
    8000312c:	1c050513          	addi	a0,a0,448 # 800082e8 <CONSOLE_STATUS+0x2d8>
    80003130:	00001097          	auipc	ra,0x1
    80003134:	2dc080e7          	jalr	732(ra) # 8000440c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003138:	02000513          	li	a0,32
    8000313c:	fffff097          	auipc	ra,0xfffff
    80003140:	d30080e7          	jalr	-720(ra) # 80001e6c <_Znwm>
    80003144:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003148:	fffff097          	auipc	ra,0xfffff
    8000314c:	e3c080e7          	jalr	-452(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80003150:	00007797          	auipc	a5,0x7
    80003154:	01078793          	addi	a5,a5,16 # 8000a160 <_ZTV7WorkerB+0x10>
    80003158:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000315c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003160:	00005517          	auipc	a0,0x5
    80003164:	1a050513          	addi	a0,a0,416 # 80008300 <CONSOLE_STATUS+0x2f0>
    80003168:	00001097          	auipc	ra,0x1
    8000316c:	2a4080e7          	jalr	676(ra) # 8000440c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003170:	02000513          	li	a0,32
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	cf8080e7          	jalr	-776(ra) # 80001e6c <_Znwm>
    8000317c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003180:	fffff097          	auipc	ra,0xfffff
    80003184:	e04080e7          	jalr	-508(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80003188:	00007797          	auipc	a5,0x7
    8000318c:	00078793          	mv	a5,a5
    80003190:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003194:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003198:	00005517          	auipc	a0,0x5
    8000319c:	18050513          	addi	a0,a0,384 # 80008318 <CONSOLE_STATUS+0x308>
    800031a0:	00001097          	auipc	ra,0x1
    800031a4:	26c080e7          	jalr	620(ra) # 8000440c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800031a8:	02000513          	li	a0,32
    800031ac:	fffff097          	auipc	ra,0xfffff
    800031b0:	cc0080e7          	jalr	-832(ra) # 80001e6c <_Znwm>
    800031b4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800031b8:	fffff097          	auipc	ra,0xfffff
    800031bc:	dcc080e7          	jalr	-564(ra) # 80001f84 <_ZN6ThreadC1Ev>
    800031c0:	00007797          	auipc	a5,0x7
    800031c4:	ff078793          	addi	a5,a5,-16 # 8000a1b0 <_ZTV7WorkerD+0x10>
    800031c8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800031cc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800031d0:	00005517          	auipc	a0,0x5
    800031d4:	16050513          	addi	a0,a0,352 # 80008330 <CONSOLE_STATUS+0x320>
    800031d8:	00001097          	auipc	ra,0x1
    800031dc:	234080e7          	jalr	564(ra) # 8000440c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800031e0:	00000493          	li	s1,0
    800031e4:	00300793          	li	a5,3
    800031e8:	0297c663          	blt	a5,s1,80003214 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800031ec:	00349793          	slli	a5,s1,0x3
    800031f0:	fe040713          	addi	a4,s0,-32
    800031f4:	00f707b3          	add	a5,a4,a5
    800031f8:	fe07b503          	ld	a0,-32(a5)
    800031fc:	fffff097          	auipc	ra,0xfffff
    80003200:	d54080e7          	jalr	-684(ra) # 80001f50 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003204:	0014849b          	addiw	s1,s1,1
    80003208:	fddff06f          	j	800031e4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000320c:	fffff097          	auipc	ra,0xfffff
    80003210:	dac080e7          	jalr	-596(ra) # 80001fb8 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003214:	00007797          	auipc	a5,0x7
    80003218:	0fc7c783          	lbu	a5,252(a5) # 8000a310 <_ZL9finishedA>
    8000321c:	fe0788e3          	beqz	a5,8000320c <_Z20Threads_CPP_API_testv+0x124>
    80003220:	00007797          	auipc	a5,0x7
    80003224:	0f17c783          	lbu	a5,241(a5) # 8000a311 <_ZL9finishedB>
    80003228:	fe0782e3          	beqz	a5,8000320c <_Z20Threads_CPP_API_testv+0x124>
    8000322c:	00007797          	auipc	a5,0x7
    80003230:	0e67c783          	lbu	a5,230(a5) # 8000a312 <_ZL9finishedC>
    80003234:	fc078ce3          	beqz	a5,8000320c <_Z20Threads_CPP_API_testv+0x124>
    80003238:	00007797          	auipc	a5,0x7
    8000323c:	0db7c783          	lbu	a5,219(a5) # 8000a313 <_ZL9finishedD>
    80003240:	fc0786e3          	beqz	a5,8000320c <_Z20Threads_CPP_API_testv+0x124>
    80003244:	fc040493          	addi	s1,s0,-64
    80003248:	0080006f          	j	80003250 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000324c:	00848493          	addi	s1,s1,8
    80003250:	fe040793          	addi	a5,s0,-32
    80003254:	08f48663          	beq	s1,a5,800032e0 <_Z20Threads_CPP_API_testv+0x1f8>
    80003258:	0004b503          	ld	a0,0(s1)
    8000325c:	fe0508e3          	beqz	a0,8000324c <_Z20Threads_CPP_API_testv+0x164>
    80003260:	00053783          	ld	a5,0(a0)
    80003264:	0087b783          	ld	a5,8(a5)
    80003268:	000780e7          	jalr	a5
    8000326c:	fe1ff06f          	j	8000324c <_Z20Threads_CPP_API_testv+0x164>
    80003270:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003274:	00048513          	mv	a0,s1
    80003278:	fffff097          	auipc	ra,0xfffff
    8000327c:	c1c080e7          	jalr	-996(ra) # 80001e94 <_ZdlPv>
    80003280:	00090513          	mv	a0,s2
    80003284:	00008097          	auipc	ra,0x8
    80003288:	184080e7          	jalr	388(ra) # 8000b408 <_Unwind_Resume>
    8000328c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003290:	00048513          	mv	a0,s1
    80003294:	fffff097          	auipc	ra,0xfffff
    80003298:	c00080e7          	jalr	-1024(ra) # 80001e94 <_ZdlPv>
    8000329c:	00090513          	mv	a0,s2
    800032a0:	00008097          	auipc	ra,0x8
    800032a4:	168080e7          	jalr	360(ra) # 8000b408 <_Unwind_Resume>
    800032a8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800032ac:	00048513          	mv	a0,s1
    800032b0:	fffff097          	auipc	ra,0xfffff
    800032b4:	be4080e7          	jalr	-1052(ra) # 80001e94 <_ZdlPv>
    800032b8:	00090513          	mv	a0,s2
    800032bc:	00008097          	auipc	ra,0x8
    800032c0:	14c080e7          	jalr	332(ra) # 8000b408 <_Unwind_Resume>
    800032c4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800032c8:	00048513          	mv	a0,s1
    800032cc:	fffff097          	auipc	ra,0xfffff
    800032d0:	bc8080e7          	jalr	-1080(ra) # 80001e94 <_ZdlPv>
    800032d4:	00090513          	mv	a0,s2
    800032d8:	00008097          	auipc	ra,0x8
    800032dc:	130080e7          	jalr	304(ra) # 8000b408 <_Unwind_Resume>
}
    800032e0:	03813083          	ld	ra,56(sp)
    800032e4:	03013403          	ld	s0,48(sp)
    800032e8:	02813483          	ld	s1,40(sp)
    800032ec:	02013903          	ld	s2,32(sp)
    800032f0:	04010113          	addi	sp,sp,64
    800032f4:	00008067          	ret

00000000800032f8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800032f8:	ff010113          	addi	sp,sp,-16
    800032fc:	00113423          	sd	ra,8(sp)
    80003300:	00813023          	sd	s0,0(sp)
    80003304:	01010413          	addi	s0,sp,16
    80003308:	00007797          	auipc	a5,0x7
    8000330c:	e3078793          	addi	a5,a5,-464 # 8000a138 <_ZTV7WorkerA+0x10>
    80003310:	00f53023          	sd	a5,0(a0)
    80003314:	fffff097          	auipc	ra,0xfffff
    80003318:	b08080e7          	jalr	-1272(ra) # 80001e1c <_ZN6ThreadD1Ev>
    8000331c:	00813083          	ld	ra,8(sp)
    80003320:	00013403          	ld	s0,0(sp)
    80003324:	01010113          	addi	sp,sp,16
    80003328:	00008067          	ret

000000008000332c <_ZN7WorkerAD0Ev>:
    8000332c:	fe010113          	addi	sp,sp,-32
    80003330:	00113c23          	sd	ra,24(sp)
    80003334:	00813823          	sd	s0,16(sp)
    80003338:	00913423          	sd	s1,8(sp)
    8000333c:	02010413          	addi	s0,sp,32
    80003340:	00050493          	mv	s1,a0
    80003344:	00007797          	auipc	a5,0x7
    80003348:	df478793          	addi	a5,a5,-524 # 8000a138 <_ZTV7WorkerA+0x10>
    8000334c:	00f53023          	sd	a5,0(a0)
    80003350:	fffff097          	auipc	ra,0xfffff
    80003354:	acc080e7          	jalr	-1332(ra) # 80001e1c <_ZN6ThreadD1Ev>
    80003358:	00048513          	mv	a0,s1
    8000335c:	fffff097          	auipc	ra,0xfffff
    80003360:	b38080e7          	jalr	-1224(ra) # 80001e94 <_ZdlPv>
    80003364:	01813083          	ld	ra,24(sp)
    80003368:	01013403          	ld	s0,16(sp)
    8000336c:	00813483          	ld	s1,8(sp)
    80003370:	02010113          	addi	sp,sp,32
    80003374:	00008067          	ret

0000000080003378 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003378:	ff010113          	addi	sp,sp,-16
    8000337c:	00113423          	sd	ra,8(sp)
    80003380:	00813023          	sd	s0,0(sp)
    80003384:	01010413          	addi	s0,sp,16
    80003388:	00007797          	auipc	a5,0x7
    8000338c:	dd878793          	addi	a5,a5,-552 # 8000a160 <_ZTV7WorkerB+0x10>
    80003390:	00f53023          	sd	a5,0(a0)
    80003394:	fffff097          	auipc	ra,0xfffff
    80003398:	a88080e7          	jalr	-1400(ra) # 80001e1c <_ZN6ThreadD1Ev>
    8000339c:	00813083          	ld	ra,8(sp)
    800033a0:	00013403          	ld	s0,0(sp)
    800033a4:	01010113          	addi	sp,sp,16
    800033a8:	00008067          	ret

00000000800033ac <_ZN7WorkerBD0Ev>:
    800033ac:	fe010113          	addi	sp,sp,-32
    800033b0:	00113c23          	sd	ra,24(sp)
    800033b4:	00813823          	sd	s0,16(sp)
    800033b8:	00913423          	sd	s1,8(sp)
    800033bc:	02010413          	addi	s0,sp,32
    800033c0:	00050493          	mv	s1,a0
    800033c4:	00007797          	auipc	a5,0x7
    800033c8:	d9c78793          	addi	a5,a5,-612 # 8000a160 <_ZTV7WorkerB+0x10>
    800033cc:	00f53023          	sd	a5,0(a0)
    800033d0:	fffff097          	auipc	ra,0xfffff
    800033d4:	a4c080e7          	jalr	-1460(ra) # 80001e1c <_ZN6ThreadD1Ev>
    800033d8:	00048513          	mv	a0,s1
    800033dc:	fffff097          	auipc	ra,0xfffff
    800033e0:	ab8080e7          	jalr	-1352(ra) # 80001e94 <_ZdlPv>
    800033e4:	01813083          	ld	ra,24(sp)
    800033e8:	01013403          	ld	s0,16(sp)
    800033ec:	00813483          	ld	s1,8(sp)
    800033f0:	02010113          	addi	sp,sp,32
    800033f4:	00008067          	ret

00000000800033f8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800033f8:	ff010113          	addi	sp,sp,-16
    800033fc:	00113423          	sd	ra,8(sp)
    80003400:	00813023          	sd	s0,0(sp)
    80003404:	01010413          	addi	s0,sp,16
    80003408:	00007797          	auipc	a5,0x7
    8000340c:	d8078793          	addi	a5,a5,-640 # 8000a188 <_ZTV7WorkerC+0x10>
    80003410:	00f53023          	sd	a5,0(a0)
    80003414:	fffff097          	auipc	ra,0xfffff
    80003418:	a08080e7          	jalr	-1528(ra) # 80001e1c <_ZN6ThreadD1Ev>
    8000341c:	00813083          	ld	ra,8(sp)
    80003420:	00013403          	ld	s0,0(sp)
    80003424:	01010113          	addi	sp,sp,16
    80003428:	00008067          	ret

000000008000342c <_ZN7WorkerCD0Ev>:
    8000342c:	fe010113          	addi	sp,sp,-32
    80003430:	00113c23          	sd	ra,24(sp)
    80003434:	00813823          	sd	s0,16(sp)
    80003438:	00913423          	sd	s1,8(sp)
    8000343c:	02010413          	addi	s0,sp,32
    80003440:	00050493          	mv	s1,a0
    80003444:	00007797          	auipc	a5,0x7
    80003448:	d4478793          	addi	a5,a5,-700 # 8000a188 <_ZTV7WorkerC+0x10>
    8000344c:	00f53023          	sd	a5,0(a0)
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	9cc080e7          	jalr	-1588(ra) # 80001e1c <_ZN6ThreadD1Ev>
    80003458:	00048513          	mv	a0,s1
    8000345c:	fffff097          	auipc	ra,0xfffff
    80003460:	a38080e7          	jalr	-1480(ra) # 80001e94 <_ZdlPv>
    80003464:	01813083          	ld	ra,24(sp)
    80003468:	01013403          	ld	s0,16(sp)
    8000346c:	00813483          	ld	s1,8(sp)
    80003470:	02010113          	addi	sp,sp,32
    80003474:	00008067          	ret

0000000080003478 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003478:	ff010113          	addi	sp,sp,-16
    8000347c:	00113423          	sd	ra,8(sp)
    80003480:	00813023          	sd	s0,0(sp)
    80003484:	01010413          	addi	s0,sp,16
    80003488:	00007797          	auipc	a5,0x7
    8000348c:	d2878793          	addi	a5,a5,-728 # 8000a1b0 <_ZTV7WorkerD+0x10>
    80003490:	00f53023          	sd	a5,0(a0)
    80003494:	fffff097          	auipc	ra,0xfffff
    80003498:	988080e7          	jalr	-1656(ra) # 80001e1c <_ZN6ThreadD1Ev>
    8000349c:	00813083          	ld	ra,8(sp)
    800034a0:	00013403          	ld	s0,0(sp)
    800034a4:	01010113          	addi	sp,sp,16
    800034a8:	00008067          	ret

00000000800034ac <_ZN7WorkerDD0Ev>:
    800034ac:	fe010113          	addi	sp,sp,-32
    800034b0:	00113c23          	sd	ra,24(sp)
    800034b4:	00813823          	sd	s0,16(sp)
    800034b8:	00913423          	sd	s1,8(sp)
    800034bc:	02010413          	addi	s0,sp,32
    800034c0:	00050493          	mv	s1,a0
    800034c4:	00007797          	auipc	a5,0x7
    800034c8:	cec78793          	addi	a5,a5,-788 # 8000a1b0 <_ZTV7WorkerD+0x10>
    800034cc:	00f53023          	sd	a5,0(a0)
    800034d0:	fffff097          	auipc	ra,0xfffff
    800034d4:	94c080e7          	jalr	-1716(ra) # 80001e1c <_ZN6ThreadD1Ev>
    800034d8:	00048513          	mv	a0,s1
    800034dc:	fffff097          	auipc	ra,0xfffff
    800034e0:	9b8080e7          	jalr	-1608(ra) # 80001e94 <_ZdlPv>
    800034e4:	01813083          	ld	ra,24(sp)
    800034e8:	01013403          	ld	s0,16(sp)
    800034ec:	00813483          	ld	s1,8(sp)
    800034f0:	02010113          	addi	sp,sp,32
    800034f4:	00008067          	ret

00000000800034f8 <_ZN7WorkerA3runEv>:
    void run() override {
    800034f8:	ff010113          	addi	sp,sp,-16
    800034fc:	00113423          	sd	ra,8(sp)
    80003500:	00813023          	sd	s0,0(sp)
    80003504:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003508:	00000593          	li	a1,0
    8000350c:	fffff097          	auipc	ra,0xfffff
    80003510:	774080e7          	jalr	1908(ra) # 80002c80 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003514:	00813083          	ld	ra,8(sp)
    80003518:	00013403          	ld	s0,0(sp)
    8000351c:	01010113          	addi	sp,sp,16
    80003520:	00008067          	ret

0000000080003524 <_ZN7WorkerB3runEv>:
    void run() override {
    80003524:	ff010113          	addi	sp,sp,-16
    80003528:	00113423          	sd	ra,8(sp)
    8000352c:	00813023          	sd	s0,0(sp)
    80003530:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003534:	00000593          	li	a1,0
    80003538:	00000097          	auipc	ra,0x0
    8000353c:	814080e7          	jalr	-2028(ra) # 80002d4c <_ZN7WorkerB11workerBodyBEPv>
    }
    80003540:	00813083          	ld	ra,8(sp)
    80003544:	00013403          	ld	s0,0(sp)
    80003548:	01010113          	addi	sp,sp,16
    8000354c:	00008067          	ret

0000000080003550 <_ZN7WorkerC3runEv>:
    void run() override {
    80003550:	ff010113          	addi	sp,sp,-16
    80003554:	00113423          	sd	ra,8(sp)
    80003558:	00813023          	sd	s0,0(sp)
    8000355c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003560:	00000593          	li	a1,0
    80003564:	00000097          	auipc	ra,0x0
    80003568:	8bc080e7          	jalr	-1860(ra) # 80002e20 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000356c:	00813083          	ld	ra,8(sp)
    80003570:	00013403          	ld	s0,0(sp)
    80003574:	01010113          	addi	sp,sp,16
    80003578:	00008067          	ret

000000008000357c <_ZN7WorkerD3runEv>:
    void run() override {
    8000357c:	ff010113          	addi	sp,sp,-16
    80003580:	00113423          	sd	ra,8(sp)
    80003584:	00813023          	sd	s0,0(sp)
    80003588:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000358c:	00000593          	li	a1,0
    80003590:	00000097          	auipc	ra,0x0
    80003594:	a10080e7          	jalr	-1520(ra) # 80002fa0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003598:	00813083          	ld	ra,8(sp)
    8000359c:	00013403          	ld	s0,0(sp)
    800035a0:	01010113          	addi	sp,sp,16
    800035a4:	00008067          	ret

00000000800035a8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800035a8:	fe010113          	addi	sp,sp,-32
    800035ac:	00113c23          	sd	ra,24(sp)
    800035b0:	00813823          	sd	s0,16(sp)
    800035b4:	00913423          	sd	s1,8(sp)
    800035b8:	01213023          	sd	s2,0(sp)
    800035bc:	02010413          	addi	s0,sp,32
    800035c0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800035c4:	00100793          	li	a5,1
    800035c8:	02a7f863          	bgeu	a5,a0,800035f8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800035cc:	00a00793          	li	a5,10
    800035d0:	02f577b3          	remu	a5,a0,a5
    800035d4:	02078e63          	beqz	a5,80003610 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800035d8:	fff48513          	addi	a0,s1,-1
    800035dc:	00000097          	auipc	ra,0x0
    800035e0:	fcc080e7          	jalr	-52(ra) # 800035a8 <_ZL9fibonaccim>
    800035e4:	00050913          	mv	s2,a0
    800035e8:	ffe48513          	addi	a0,s1,-2
    800035ec:	00000097          	auipc	ra,0x0
    800035f0:	fbc080e7          	jalr	-68(ra) # 800035a8 <_ZL9fibonaccim>
    800035f4:	00a90533          	add	a0,s2,a0
}
    800035f8:	01813083          	ld	ra,24(sp)
    800035fc:	01013403          	ld	s0,16(sp)
    80003600:	00813483          	ld	s1,8(sp)
    80003604:	00013903          	ld	s2,0(sp)
    80003608:	02010113          	addi	sp,sp,32
    8000360c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	dac080e7          	jalr	-596(ra) # 800013bc <_Z15thread_dispatchv>
    80003618:	fc1ff06f          	j	800035d8 <_ZL9fibonaccim+0x30>

000000008000361c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000361c:	fe010113          	addi	sp,sp,-32
    80003620:	00113c23          	sd	ra,24(sp)
    80003624:	00813823          	sd	s0,16(sp)
    80003628:	00913423          	sd	s1,8(sp)
    8000362c:	01213023          	sd	s2,0(sp)
    80003630:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003634:	00a00493          	li	s1,10
    80003638:	0400006f          	j	80003678 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000363c:	00005517          	auipc	a0,0x5
    80003640:	c7450513          	addi	a0,a0,-908 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80003644:	00001097          	auipc	ra,0x1
    80003648:	dc8080e7          	jalr	-568(ra) # 8000440c <_Z11printStringPKc>
    8000364c:	00000613          	li	a2,0
    80003650:	00a00593          	li	a1,10
    80003654:	00048513          	mv	a0,s1
    80003658:	00001097          	auipc	ra,0x1
    8000365c:	f64080e7          	jalr	-156(ra) # 800045bc <_Z8printIntiii>
    80003660:	00005517          	auipc	a0,0x5
    80003664:	e7050513          	addi	a0,a0,-400 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003668:	00001097          	auipc	ra,0x1
    8000366c:	da4080e7          	jalr	-604(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003670:	0014849b          	addiw	s1,s1,1
    80003674:	0ff4f493          	andi	s1,s1,255
    80003678:	00c00793          	li	a5,12
    8000367c:	fc97f0e3          	bgeu	a5,s1,8000363c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003680:	00005517          	auipc	a0,0x5
    80003684:	c3850513          	addi	a0,a0,-968 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80003688:	00001097          	auipc	ra,0x1
    8000368c:	d84080e7          	jalr	-636(ra) # 8000440c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003690:	00500313          	li	t1,5
    thread_dispatch();
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	d28080e7          	jalr	-728(ra) # 800013bc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000369c:	01000513          	li	a0,16
    800036a0:	00000097          	auipc	ra,0x0
    800036a4:	f08080e7          	jalr	-248(ra) # 800035a8 <_ZL9fibonaccim>
    800036a8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800036ac:	00005517          	auipc	a0,0x5
    800036b0:	c1c50513          	addi	a0,a0,-996 # 800082c8 <CONSOLE_STATUS+0x2b8>
    800036b4:	00001097          	auipc	ra,0x1
    800036b8:	d58080e7          	jalr	-680(ra) # 8000440c <_Z11printStringPKc>
    800036bc:	00000613          	li	a2,0
    800036c0:	00a00593          	li	a1,10
    800036c4:	0009051b          	sext.w	a0,s2
    800036c8:	00001097          	auipc	ra,0x1
    800036cc:	ef4080e7          	jalr	-268(ra) # 800045bc <_Z8printIntiii>
    800036d0:	00005517          	auipc	a0,0x5
    800036d4:	e0050513          	addi	a0,a0,-512 # 800084d0 <CONSOLE_STATUS+0x4c0>
    800036d8:	00001097          	auipc	ra,0x1
    800036dc:	d34080e7          	jalr	-716(ra) # 8000440c <_Z11printStringPKc>
    800036e0:	0400006f          	j	80003720 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800036e4:	00005517          	auipc	a0,0x5
    800036e8:	bcc50513          	addi	a0,a0,-1076 # 800082b0 <CONSOLE_STATUS+0x2a0>
    800036ec:	00001097          	auipc	ra,0x1
    800036f0:	d20080e7          	jalr	-736(ra) # 8000440c <_Z11printStringPKc>
    800036f4:	00000613          	li	a2,0
    800036f8:	00a00593          	li	a1,10
    800036fc:	00048513          	mv	a0,s1
    80003700:	00001097          	auipc	ra,0x1
    80003704:	ebc080e7          	jalr	-324(ra) # 800045bc <_Z8printIntiii>
    80003708:	00005517          	auipc	a0,0x5
    8000370c:	dc850513          	addi	a0,a0,-568 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003710:	00001097          	auipc	ra,0x1
    80003714:	cfc080e7          	jalr	-772(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003718:	0014849b          	addiw	s1,s1,1
    8000371c:	0ff4f493          	andi	s1,s1,255
    80003720:	00f00793          	li	a5,15
    80003724:	fc97f0e3          	bgeu	a5,s1,800036e4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003728:	00005517          	auipc	a0,0x5
    8000372c:	bb050513          	addi	a0,a0,-1104 # 800082d8 <CONSOLE_STATUS+0x2c8>
    80003730:	00001097          	auipc	ra,0x1
    80003734:	cdc080e7          	jalr	-804(ra) # 8000440c <_Z11printStringPKc>
    finishedD = true;
    80003738:	00100793          	li	a5,1
    8000373c:	00007717          	auipc	a4,0x7
    80003740:	bcf70c23          	sb	a5,-1064(a4) # 8000a314 <_ZL9finishedD>
    thread_dispatch();
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	c78080e7          	jalr	-904(ra) # 800013bc <_Z15thread_dispatchv>
}
    8000374c:	01813083          	ld	ra,24(sp)
    80003750:	01013403          	ld	s0,16(sp)
    80003754:	00813483          	ld	s1,8(sp)
    80003758:	00013903          	ld	s2,0(sp)
    8000375c:	02010113          	addi	sp,sp,32
    80003760:	00008067          	ret

0000000080003764 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003764:	fe010113          	addi	sp,sp,-32
    80003768:	00113c23          	sd	ra,24(sp)
    8000376c:	00813823          	sd	s0,16(sp)
    80003770:	00913423          	sd	s1,8(sp)
    80003774:	01213023          	sd	s2,0(sp)
    80003778:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000377c:	00000493          	li	s1,0
    80003780:	0400006f          	j	800037c0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003784:	00005517          	auipc	a0,0x5
    80003788:	afc50513          	addi	a0,a0,-1284 # 80008280 <CONSOLE_STATUS+0x270>
    8000378c:	00001097          	auipc	ra,0x1
    80003790:	c80080e7          	jalr	-896(ra) # 8000440c <_Z11printStringPKc>
    80003794:	00000613          	li	a2,0
    80003798:	00a00593          	li	a1,10
    8000379c:	00048513          	mv	a0,s1
    800037a0:	00001097          	auipc	ra,0x1
    800037a4:	e1c080e7          	jalr	-484(ra) # 800045bc <_Z8printIntiii>
    800037a8:	00005517          	auipc	a0,0x5
    800037ac:	d2850513          	addi	a0,a0,-728 # 800084d0 <CONSOLE_STATUS+0x4c0>
    800037b0:	00001097          	auipc	ra,0x1
    800037b4:	c5c080e7          	jalr	-932(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800037b8:	0014849b          	addiw	s1,s1,1
    800037bc:	0ff4f493          	andi	s1,s1,255
    800037c0:	00200793          	li	a5,2
    800037c4:	fc97f0e3          	bgeu	a5,s1,80003784 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800037c8:	00005517          	auipc	a0,0x5
    800037cc:	ac050513          	addi	a0,a0,-1344 # 80008288 <CONSOLE_STATUS+0x278>
    800037d0:	00001097          	auipc	ra,0x1
    800037d4:	c3c080e7          	jalr	-964(ra) # 8000440c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800037d8:	00700313          	li	t1,7
    thread_dispatch();
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	be0080e7          	jalr	-1056(ra) # 800013bc <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800037e4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800037e8:	00005517          	auipc	a0,0x5
    800037ec:	ab050513          	addi	a0,a0,-1360 # 80008298 <CONSOLE_STATUS+0x288>
    800037f0:	00001097          	auipc	ra,0x1
    800037f4:	c1c080e7          	jalr	-996(ra) # 8000440c <_Z11printStringPKc>
    800037f8:	00000613          	li	a2,0
    800037fc:	00a00593          	li	a1,10
    80003800:	0009051b          	sext.w	a0,s2
    80003804:	00001097          	auipc	ra,0x1
    80003808:	db8080e7          	jalr	-584(ra) # 800045bc <_Z8printIntiii>
    8000380c:	00005517          	auipc	a0,0x5
    80003810:	cc450513          	addi	a0,a0,-828 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003814:	00001097          	auipc	ra,0x1
    80003818:	bf8080e7          	jalr	-1032(ra) # 8000440c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000381c:	00c00513          	li	a0,12
    80003820:	00000097          	auipc	ra,0x0
    80003824:	d88080e7          	jalr	-632(ra) # 800035a8 <_ZL9fibonaccim>
    80003828:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000382c:	00005517          	auipc	a0,0x5
    80003830:	a7450513          	addi	a0,a0,-1420 # 800082a0 <CONSOLE_STATUS+0x290>
    80003834:	00001097          	auipc	ra,0x1
    80003838:	bd8080e7          	jalr	-1064(ra) # 8000440c <_Z11printStringPKc>
    8000383c:	00000613          	li	a2,0
    80003840:	00a00593          	li	a1,10
    80003844:	0009051b          	sext.w	a0,s2
    80003848:	00001097          	auipc	ra,0x1
    8000384c:	d74080e7          	jalr	-652(ra) # 800045bc <_Z8printIntiii>
    80003850:	00005517          	auipc	a0,0x5
    80003854:	c8050513          	addi	a0,a0,-896 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003858:	00001097          	auipc	ra,0x1
    8000385c:	bb4080e7          	jalr	-1100(ra) # 8000440c <_Z11printStringPKc>
    80003860:	0400006f          	j	800038a0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003864:	00005517          	auipc	a0,0x5
    80003868:	a1c50513          	addi	a0,a0,-1508 # 80008280 <CONSOLE_STATUS+0x270>
    8000386c:	00001097          	auipc	ra,0x1
    80003870:	ba0080e7          	jalr	-1120(ra) # 8000440c <_Z11printStringPKc>
    80003874:	00000613          	li	a2,0
    80003878:	00a00593          	li	a1,10
    8000387c:	00048513          	mv	a0,s1
    80003880:	00001097          	auipc	ra,0x1
    80003884:	d3c080e7          	jalr	-708(ra) # 800045bc <_Z8printIntiii>
    80003888:	00005517          	auipc	a0,0x5
    8000388c:	c4850513          	addi	a0,a0,-952 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003890:	00001097          	auipc	ra,0x1
    80003894:	b7c080e7          	jalr	-1156(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003898:	0014849b          	addiw	s1,s1,1
    8000389c:	0ff4f493          	andi	s1,s1,255
    800038a0:	00500793          	li	a5,5
    800038a4:	fc97f0e3          	bgeu	a5,s1,80003864 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800038a8:	00005517          	auipc	a0,0x5
    800038ac:	9b050513          	addi	a0,a0,-1616 # 80008258 <CONSOLE_STATUS+0x248>
    800038b0:	00001097          	auipc	ra,0x1
    800038b4:	b5c080e7          	jalr	-1188(ra) # 8000440c <_Z11printStringPKc>
    finishedC = true;
    800038b8:	00100793          	li	a5,1
    800038bc:	00007717          	auipc	a4,0x7
    800038c0:	a4f70ca3          	sb	a5,-1447(a4) # 8000a315 <_ZL9finishedC>
    thread_dispatch();
    800038c4:	ffffe097          	auipc	ra,0xffffe
    800038c8:	af8080e7          	jalr	-1288(ra) # 800013bc <_Z15thread_dispatchv>
}
    800038cc:	01813083          	ld	ra,24(sp)
    800038d0:	01013403          	ld	s0,16(sp)
    800038d4:	00813483          	ld	s1,8(sp)
    800038d8:	00013903          	ld	s2,0(sp)
    800038dc:	02010113          	addi	sp,sp,32
    800038e0:	00008067          	ret

00000000800038e4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800038e4:	fe010113          	addi	sp,sp,-32
    800038e8:	00113c23          	sd	ra,24(sp)
    800038ec:	00813823          	sd	s0,16(sp)
    800038f0:	00913423          	sd	s1,8(sp)
    800038f4:	01213023          	sd	s2,0(sp)
    800038f8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800038fc:	00000913          	li	s2,0
    80003900:	0380006f          	j	80003938 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80003904:	ffffe097          	auipc	ra,0xffffe
    80003908:	ab8080e7          	jalr	-1352(ra) # 800013bc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000390c:	00148493          	addi	s1,s1,1
    80003910:	000027b7          	lui	a5,0x2
    80003914:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003918:	0097ee63          	bltu	a5,s1,80003934 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000391c:	00000713          	li	a4,0
    80003920:	000077b7          	lui	a5,0x7
    80003924:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003928:	fce7eee3          	bltu	a5,a4,80003904 <_ZL11workerBodyBPv+0x20>
    8000392c:	00170713          	addi	a4,a4,1
    80003930:	ff1ff06f          	j	80003920 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003934:	00190913          	addi	s2,s2,1
    80003938:	00f00793          	li	a5,15
    8000393c:	0527e063          	bltu	a5,s2,8000397c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003940:	00005517          	auipc	a0,0x5
    80003944:	92850513          	addi	a0,a0,-1752 # 80008268 <CONSOLE_STATUS+0x258>
    80003948:	00001097          	auipc	ra,0x1
    8000394c:	ac4080e7          	jalr	-1340(ra) # 8000440c <_Z11printStringPKc>
    80003950:	00000613          	li	a2,0
    80003954:	00a00593          	li	a1,10
    80003958:	0009051b          	sext.w	a0,s2
    8000395c:	00001097          	auipc	ra,0x1
    80003960:	c60080e7          	jalr	-928(ra) # 800045bc <_Z8printIntiii>
    80003964:	00005517          	auipc	a0,0x5
    80003968:	b6c50513          	addi	a0,a0,-1172 # 800084d0 <CONSOLE_STATUS+0x4c0>
    8000396c:	00001097          	auipc	ra,0x1
    80003970:	aa0080e7          	jalr	-1376(ra) # 8000440c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003974:	00000493          	li	s1,0
    80003978:	f99ff06f          	j	80003910 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000397c:	00005517          	auipc	a0,0x5
    80003980:	8f450513          	addi	a0,a0,-1804 # 80008270 <CONSOLE_STATUS+0x260>
    80003984:	00001097          	auipc	ra,0x1
    80003988:	a88080e7          	jalr	-1400(ra) # 8000440c <_Z11printStringPKc>
    finishedB = true;
    8000398c:	00100793          	li	a5,1
    80003990:	00007717          	auipc	a4,0x7
    80003994:	98f70323          	sb	a5,-1658(a4) # 8000a316 <_ZL9finishedB>
    thread_dispatch();
    80003998:	ffffe097          	auipc	ra,0xffffe
    8000399c:	a24080e7          	jalr	-1500(ra) # 800013bc <_Z15thread_dispatchv>
}
    800039a0:	01813083          	ld	ra,24(sp)
    800039a4:	01013403          	ld	s0,16(sp)
    800039a8:	00813483          	ld	s1,8(sp)
    800039ac:	00013903          	ld	s2,0(sp)
    800039b0:	02010113          	addi	sp,sp,32
    800039b4:	00008067          	ret

00000000800039b8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800039b8:	fe010113          	addi	sp,sp,-32
    800039bc:	00113c23          	sd	ra,24(sp)
    800039c0:	00813823          	sd	s0,16(sp)
    800039c4:	00913423          	sd	s1,8(sp)
    800039c8:	01213023          	sd	s2,0(sp)
    800039cc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800039d0:	00000913          	li	s2,0
    800039d4:	0380006f          	j	80003a0c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800039d8:	ffffe097          	auipc	ra,0xffffe
    800039dc:	9e4080e7          	jalr	-1564(ra) # 800013bc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800039e0:	00148493          	addi	s1,s1,1
    800039e4:	000027b7          	lui	a5,0x2
    800039e8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800039ec:	0097ee63          	bltu	a5,s1,80003a08 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800039f0:	00000713          	li	a4,0
    800039f4:	000077b7          	lui	a5,0x7
    800039f8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800039fc:	fce7eee3          	bltu	a5,a4,800039d8 <_ZL11workerBodyAPv+0x20>
    80003a00:	00170713          	addi	a4,a4,1
    80003a04:	ff1ff06f          	j	800039f4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003a08:	00190913          	addi	s2,s2,1
    80003a0c:	00900793          	li	a5,9
    80003a10:	0527e063          	bltu	a5,s2,80003a50 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003a14:	00005517          	auipc	a0,0x5
    80003a18:	83c50513          	addi	a0,a0,-1988 # 80008250 <CONSOLE_STATUS+0x240>
    80003a1c:	00001097          	auipc	ra,0x1
    80003a20:	9f0080e7          	jalr	-1552(ra) # 8000440c <_Z11printStringPKc>
    80003a24:	00000613          	li	a2,0
    80003a28:	00a00593          	li	a1,10
    80003a2c:	0009051b          	sext.w	a0,s2
    80003a30:	00001097          	auipc	ra,0x1
    80003a34:	b8c080e7          	jalr	-1140(ra) # 800045bc <_Z8printIntiii>
    80003a38:	00005517          	auipc	a0,0x5
    80003a3c:	a9850513          	addi	a0,a0,-1384 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003a40:	00001097          	auipc	ra,0x1
    80003a44:	9cc080e7          	jalr	-1588(ra) # 8000440c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003a48:	00000493          	li	s1,0
    80003a4c:	f99ff06f          	j	800039e4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003a50:	00005517          	auipc	a0,0x5
    80003a54:	80850513          	addi	a0,a0,-2040 # 80008258 <CONSOLE_STATUS+0x248>
    80003a58:	00001097          	auipc	ra,0x1
    80003a5c:	9b4080e7          	jalr	-1612(ra) # 8000440c <_Z11printStringPKc>
    finishedA = true;
    80003a60:	00100793          	li	a5,1
    80003a64:	00007717          	auipc	a4,0x7
    80003a68:	8af709a3          	sb	a5,-1869(a4) # 8000a317 <_ZL9finishedA>
}
    80003a6c:	01813083          	ld	ra,24(sp)
    80003a70:	01013403          	ld	s0,16(sp)
    80003a74:	00813483          	ld	s1,8(sp)
    80003a78:	00013903          	ld	s2,0(sp)
    80003a7c:	02010113          	addi	sp,sp,32
    80003a80:	00008067          	ret

0000000080003a84 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003a84:	fd010113          	addi	sp,sp,-48
    80003a88:	02113423          	sd	ra,40(sp)
    80003a8c:	02813023          	sd	s0,32(sp)
    80003a90:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003a94:	00000613          	li	a2,0
    80003a98:	00000597          	auipc	a1,0x0
    80003a9c:	f2058593          	addi	a1,a1,-224 # 800039b8 <_ZL11workerBodyAPv>
    80003aa0:	fd040513          	addi	a0,s0,-48
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	868080e7          	jalr	-1944(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80003aac:	00005517          	auipc	a0,0x5
    80003ab0:	83c50513          	addi	a0,a0,-1988 # 800082e8 <CONSOLE_STATUS+0x2d8>
    80003ab4:	00001097          	auipc	ra,0x1
    80003ab8:	958080e7          	jalr	-1704(ra) # 8000440c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003abc:	00000613          	li	a2,0
    80003ac0:	00000597          	auipc	a1,0x0
    80003ac4:	e2458593          	addi	a1,a1,-476 # 800038e4 <_ZL11workerBodyBPv>
    80003ac8:	fd840513          	addi	a0,s0,-40
    80003acc:	ffffe097          	auipc	ra,0xffffe
    80003ad0:	840080e7          	jalr	-1984(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80003ad4:	00005517          	auipc	a0,0x5
    80003ad8:	82c50513          	addi	a0,a0,-2004 # 80008300 <CONSOLE_STATUS+0x2f0>
    80003adc:	00001097          	auipc	ra,0x1
    80003ae0:	930080e7          	jalr	-1744(ra) # 8000440c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003ae4:	00000613          	li	a2,0
    80003ae8:	00000597          	auipc	a1,0x0
    80003aec:	c7c58593          	addi	a1,a1,-900 # 80003764 <_ZL11workerBodyCPv>
    80003af0:	fe040513          	addi	a0,s0,-32
    80003af4:	ffffe097          	auipc	ra,0xffffe
    80003af8:	818080e7          	jalr	-2024(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80003afc:	00005517          	auipc	a0,0x5
    80003b00:	81c50513          	addi	a0,a0,-2020 # 80008318 <CONSOLE_STATUS+0x308>
    80003b04:	00001097          	auipc	ra,0x1
    80003b08:	908080e7          	jalr	-1784(ra) # 8000440c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003b0c:	00000613          	li	a2,0
    80003b10:	00000597          	auipc	a1,0x0
    80003b14:	b0c58593          	addi	a1,a1,-1268 # 8000361c <_ZL11workerBodyDPv>
    80003b18:	fe840513          	addi	a0,s0,-24
    80003b1c:	ffffd097          	auipc	ra,0xffffd
    80003b20:	7f0080e7          	jalr	2032(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80003b24:	00005517          	auipc	a0,0x5
    80003b28:	80c50513          	addi	a0,a0,-2036 # 80008330 <CONSOLE_STATUS+0x320>
    80003b2c:	00001097          	auipc	ra,0x1
    80003b30:	8e0080e7          	jalr	-1824(ra) # 8000440c <_Z11printStringPKc>
    80003b34:	00c0006f          	j	80003b40 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003b38:	ffffe097          	auipc	ra,0xffffe
    80003b3c:	884080e7          	jalr	-1916(ra) # 800013bc <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003b40:	00006797          	auipc	a5,0x6
    80003b44:	7d77c783          	lbu	a5,2007(a5) # 8000a317 <_ZL9finishedA>
    80003b48:	fe0788e3          	beqz	a5,80003b38 <_Z18Threads_C_API_testv+0xb4>
    80003b4c:	00006797          	auipc	a5,0x6
    80003b50:	7ca7c783          	lbu	a5,1994(a5) # 8000a316 <_ZL9finishedB>
    80003b54:	fe0782e3          	beqz	a5,80003b38 <_Z18Threads_C_API_testv+0xb4>
    80003b58:	00006797          	auipc	a5,0x6
    80003b5c:	7bd7c783          	lbu	a5,1981(a5) # 8000a315 <_ZL9finishedC>
    80003b60:	fc078ce3          	beqz	a5,80003b38 <_Z18Threads_C_API_testv+0xb4>
    80003b64:	00006797          	auipc	a5,0x6
    80003b68:	7b07c783          	lbu	a5,1968(a5) # 8000a314 <_ZL9finishedD>
    80003b6c:	fc0786e3          	beqz	a5,80003b38 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80003b70:	02813083          	ld	ra,40(sp)
    80003b74:	02013403          	ld	s0,32(sp)
    80003b78:	03010113          	addi	sp,sp,48
    80003b7c:	00008067          	ret

0000000080003b80 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80003b80:	fd010113          	addi	sp,sp,-48
    80003b84:	02113423          	sd	ra,40(sp)
    80003b88:	02813023          	sd	s0,32(sp)
    80003b8c:	00913c23          	sd	s1,24(sp)
    80003b90:	01213823          	sd	s2,16(sp)
    80003b94:	01313423          	sd	s3,8(sp)
    80003b98:	03010413          	addi	s0,sp,48
    80003b9c:	00050993          	mv	s3,a0
    80003ba0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003ba4:	00000913          	li	s2,0
    80003ba8:	00c0006f          	j	80003bb4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003bac:	ffffe097          	auipc	ra,0xffffe
    80003bb0:	40c080e7          	jalr	1036(ra) # 80001fb8 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80003bb4:	ffffe097          	auipc	ra,0xffffe
    80003bb8:	9c4080e7          	jalr	-1596(ra) # 80001578 <_Z4getcv>
    80003bbc:	0005059b          	sext.w	a1,a0
    80003bc0:	01b00793          	li	a5,27
    80003bc4:	02f58a63          	beq	a1,a5,80003bf8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80003bc8:	0084b503          	ld	a0,8(s1)
    80003bcc:	00001097          	auipc	ra,0x1
    80003bd0:	c64080e7          	jalr	-924(ra) # 80004830 <_ZN9BufferCPP3putEi>
        i++;
    80003bd4:	0019071b          	addiw	a4,s2,1
    80003bd8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003bdc:	0004a683          	lw	a3,0(s1)
    80003be0:	0026979b          	slliw	a5,a3,0x2
    80003be4:	00d787bb          	addw	a5,a5,a3
    80003be8:	0017979b          	slliw	a5,a5,0x1
    80003bec:	02f767bb          	remw	a5,a4,a5
    80003bf0:	fc0792e3          	bnez	a5,80003bb4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80003bf4:	fb9ff06f          	j	80003bac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80003bf8:	00100793          	li	a5,1
    80003bfc:	00006717          	auipc	a4,0x6
    80003c00:	70f72e23          	sw	a5,1820(a4) # 8000a318 <_ZL9threadEnd>
    td->buffer->put('!');
    80003c04:	0209b783          	ld	a5,32(s3)
    80003c08:	02100593          	li	a1,33
    80003c0c:	0087b503          	ld	a0,8(a5)
    80003c10:	00001097          	auipc	ra,0x1
    80003c14:	c20080e7          	jalr	-992(ra) # 80004830 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80003c18:	0104b503          	ld	a0,16(s1)
    80003c1c:	ffffe097          	auipc	ra,0xffffe
    80003c20:	444080e7          	jalr	1092(ra) # 80002060 <_ZN9Semaphore6signalEv>
}
    80003c24:	02813083          	ld	ra,40(sp)
    80003c28:	02013403          	ld	s0,32(sp)
    80003c2c:	01813483          	ld	s1,24(sp)
    80003c30:	01013903          	ld	s2,16(sp)
    80003c34:	00813983          	ld	s3,8(sp)
    80003c38:	03010113          	addi	sp,sp,48
    80003c3c:	00008067          	ret

0000000080003c40 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80003c40:	fe010113          	addi	sp,sp,-32
    80003c44:	00113c23          	sd	ra,24(sp)
    80003c48:	00813823          	sd	s0,16(sp)
    80003c4c:	00913423          	sd	s1,8(sp)
    80003c50:	01213023          	sd	s2,0(sp)
    80003c54:	02010413          	addi	s0,sp,32
    80003c58:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003c5c:	00000913          	li	s2,0
    80003c60:	00c0006f          	j	80003c6c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003c64:	ffffe097          	auipc	ra,0xffffe
    80003c68:	354080e7          	jalr	852(ra) # 80001fb8 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80003c6c:	00006797          	auipc	a5,0x6
    80003c70:	6ac7a783          	lw	a5,1708(a5) # 8000a318 <_ZL9threadEnd>
    80003c74:	02079e63          	bnez	a5,80003cb0 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80003c78:	0004a583          	lw	a1,0(s1)
    80003c7c:	0305859b          	addiw	a1,a1,48
    80003c80:	0084b503          	ld	a0,8(s1)
    80003c84:	00001097          	auipc	ra,0x1
    80003c88:	bac080e7          	jalr	-1108(ra) # 80004830 <_ZN9BufferCPP3putEi>
        i++;
    80003c8c:	0019071b          	addiw	a4,s2,1
    80003c90:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003c94:	0004a683          	lw	a3,0(s1)
    80003c98:	0026979b          	slliw	a5,a3,0x2
    80003c9c:	00d787bb          	addw	a5,a5,a3
    80003ca0:	0017979b          	slliw	a5,a5,0x1
    80003ca4:	02f767bb          	remw	a5,a4,a5
    80003ca8:	fc0792e3          	bnez	a5,80003c6c <_ZN12ProducerSync8producerEPv+0x2c>
    80003cac:	fb9ff06f          	j	80003c64 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80003cb0:	0104b503          	ld	a0,16(s1)
    80003cb4:	ffffe097          	auipc	ra,0xffffe
    80003cb8:	3ac080e7          	jalr	940(ra) # 80002060 <_ZN9Semaphore6signalEv>
}
    80003cbc:	01813083          	ld	ra,24(sp)
    80003cc0:	01013403          	ld	s0,16(sp)
    80003cc4:	00813483          	ld	s1,8(sp)
    80003cc8:	00013903          	ld	s2,0(sp)
    80003ccc:	02010113          	addi	sp,sp,32
    80003cd0:	00008067          	ret

0000000080003cd4 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80003cd4:	fd010113          	addi	sp,sp,-48
    80003cd8:	02113423          	sd	ra,40(sp)
    80003cdc:	02813023          	sd	s0,32(sp)
    80003ce0:	00913c23          	sd	s1,24(sp)
    80003ce4:	01213823          	sd	s2,16(sp)
    80003ce8:	01313423          	sd	s3,8(sp)
    80003cec:	01413023          	sd	s4,0(sp)
    80003cf0:	03010413          	addi	s0,sp,48
    80003cf4:	00050993          	mv	s3,a0
    80003cf8:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003cfc:	00000a13          	li	s4,0
    80003d00:	01c0006f          	j	80003d1c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80003d04:	ffffe097          	auipc	ra,0xffffe
    80003d08:	2b4080e7          	jalr	692(ra) # 80001fb8 <_ZN6Thread8dispatchEv>
    80003d0c:	0500006f          	j	80003d5c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003d10:	00a00513          	li	a0,10
    80003d14:	ffffe097          	auipc	ra,0xffffe
    80003d18:	828080e7          	jalr	-2008(ra) # 8000153c <_Z4putcc>
    while (!threadEnd) {
    80003d1c:	00006797          	auipc	a5,0x6
    80003d20:	5fc7a783          	lw	a5,1532(a5) # 8000a318 <_ZL9threadEnd>
    80003d24:	06079263          	bnez	a5,80003d88 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80003d28:	00893503          	ld	a0,8(s2)
    80003d2c:	00001097          	auipc	ra,0x1
    80003d30:	b94080e7          	jalr	-1132(ra) # 800048c0 <_ZN9BufferCPP3getEv>
        i++;
    80003d34:	001a049b          	addiw	s1,s4,1
    80003d38:	00048a1b          	sext.w	s4,s1
        putc(key);
    80003d3c:	0ff57513          	andi	a0,a0,255
    80003d40:	ffffd097          	auipc	ra,0xffffd
    80003d44:	7fc080e7          	jalr	2044(ra) # 8000153c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003d48:	00092703          	lw	a4,0(s2)
    80003d4c:	0027179b          	slliw	a5,a4,0x2
    80003d50:	00e787bb          	addw	a5,a5,a4
    80003d54:	02f4e7bb          	remw	a5,s1,a5
    80003d58:	fa0786e3          	beqz	a5,80003d04 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80003d5c:	05000793          	li	a5,80
    80003d60:	02f4e4bb          	remw	s1,s1,a5
    80003d64:	fa049ce3          	bnez	s1,80003d1c <_ZN12ConsumerSync8consumerEPv+0x48>
    80003d68:	fa9ff06f          	j	80003d10 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80003d6c:	0209b783          	ld	a5,32(s3)
    80003d70:	0087b503          	ld	a0,8(a5)
    80003d74:	00001097          	auipc	ra,0x1
    80003d78:	b4c080e7          	jalr	-1204(ra) # 800048c0 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80003d7c:	0ff57513          	andi	a0,a0,255
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	37c080e7          	jalr	892(ra) # 800020fc <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80003d88:	0209b783          	ld	a5,32(s3)
    80003d8c:	0087b503          	ld	a0,8(a5)
    80003d90:	00001097          	auipc	ra,0x1
    80003d94:	bbc080e7          	jalr	-1092(ra) # 8000494c <_ZN9BufferCPP6getCntEv>
    80003d98:	fca04ae3          	bgtz	a0,80003d6c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80003d9c:	01093503          	ld	a0,16(s2)
    80003da0:	ffffe097          	auipc	ra,0xffffe
    80003da4:	2c0080e7          	jalr	704(ra) # 80002060 <_ZN9Semaphore6signalEv>
}
    80003da8:	02813083          	ld	ra,40(sp)
    80003dac:	02013403          	ld	s0,32(sp)
    80003db0:	01813483          	ld	s1,24(sp)
    80003db4:	01013903          	ld	s2,16(sp)
    80003db8:	00813983          	ld	s3,8(sp)
    80003dbc:	00013a03          	ld	s4,0(sp)
    80003dc0:	03010113          	addi	sp,sp,48
    80003dc4:	00008067          	ret

0000000080003dc8 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80003dc8:	f8010113          	addi	sp,sp,-128
    80003dcc:	06113c23          	sd	ra,120(sp)
    80003dd0:	06813823          	sd	s0,112(sp)
    80003dd4:	06913423          	sd	s1,104(sp)
    80003dd8:	07213023          	sd	s2,96(sp)
    80003ddc:	05313c23          	sd	s3,88(sp)
    80003de0:	05413823          	sd	s4,80(sp)
    80003de4:	05513423          	sd	s5,72(sp)
    80003de8:	05613023          	sd	s6,64(sp)
    80003dec:	03713c23          	sd	s7,56(sp)
    80003df0:	03813823          	sd	s8,48(sp)
    80003df4:	03913423          	sd	s9,40(sp)
    80003df8:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80003dfc:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80003e00:	00004517          	auipc	a0,0x4
    80003e04:	36850513          	addi	a0,a0,872 # 80008168 <CONSOLE_STATUS+0x158>
    80003e08:	00000097          	auipc	ra,0x0
    80003e0c:	604080e7          	jalr	1540(ra) # 8000440c <_Z11printStringPKc>
    getString(input, 30);
    80003e10:	01e00593          	li	a1,30
    80003e14:	f8040493          	addi	s1,s0,-128
    80003e18:	00048513          	mv	a0,s1
    80003e1c:	00000097          	auipc	ra,0x0
    80003e20:	678080e7          	jalr	1656(ra) # 80004494 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003e24:	00048513          	mv	a0,s1
    80003e28:	00000097          	auipc	ra,0x0
    80003e2c:	744080e7          	jalr	1860(ra) # 8000456c <_Z11stringToIntPKc>
    80003e30:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003e34:	00004517          	auipc	a0,0x4
    80003e38:	35450513          	addi	a0,a0,852 # 80008188 <CONSOLE_STATUS+0x178>
    80003e3c:	00000097          	auipc	ra,0x0
    80003e40:	5d0080e7          	jalr	1488(ra) # 8000440c <_Z11printStringPKc>
    getString(input, 30);
    80003e44:	01e00593          	li	a1,30
    80003e48:	00048513          	mv	a0,s1
    80003e4c:	00000097          	auipc	ra,0x0
    80003e50:	648080e7          	jalr	1608(ra) # 80004494 <_Z9getStringPci>
    n = stringToInt(input);
    80003e54:	00048513          	mv	a0,s1
    80003e58:	00000097          	auipc	ra,0x0
    80003e5c:	714080e7          	jalr	1812(ra) # 8000456c <_Z11stringToIntPKc>
    80003e60:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003e64:	00004517          	auipc	a0,0x4
    80003e68:	34450513          	addi	a0,a0,836 # 800081a8 <CONSOLE_STATUS+0x198>
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	5a0080e7          	jalr	1440(ra) # 8000440c <_Z11printStringPKc>
    80003e74:	00000613          	li	a2,0
    80003e78:	00a00593          	li	a1,10
    80003e7c:	00090513          	mv	a0,s2
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	73c080e7          	jalr	1852(ra) # 800045bc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003e88:	00004517          	auipc	a0,0x4
    80003e8c:	33850513          	addi	a0,a0,824 # 800081c0 <CONSOLE_STATUS+0x1b0>
    80003e90:	00000097          	auipc	ra,0x0
    80003e94:	57c080e7          	jalr	1404(ra) # 8000440c <_Z11printStringPKc>
    80003e98:	00000613          	li	a2,0
    80003e9c:	00a00593          	li	a1,10
    80003ea0:	00048513          	mv	a0,s1
    80003ea4:	00000097          	auipc	ra,0x0
    80003ea8:	718080e7          	jalr	1816(ra) # 800045bc <_Z8printIntiii>
    printString(".\n");
    80003eac:	00004517          	auipc	a0,0x4
    80003eb0:	32c50513          	addi	a0,a0,812 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80003eb4:	00000097          	auipc	ra,0x0
    80003eb8:	558080e7          	jalr	1368(ra) # 8000440c <_Z11printStringPKc>
    if(threadNum > n) {
    80003ebc:	0324c463          	blt	s1,s2,80003ee4 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80003ec0:	03205c63          	blez	s2,80003ef8 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003ec4:	03800513          	li	a0,56
    80003ec8:	ffffe097          	auipc	ra,0xffffe
    80003ecc:	fa4080e7          	jalr	-92(ra) # 80001e6c <_Znwm>
    80003ed0:	00050a93          	mv	s5,a0
    80003ed4:	00048593          	mv	a1,s1
    80003ed8:	00001097          	auipc	ra,0x1
    80003edc:	804080e7          	jalr	-2044(ra) # 800046dc <_ZN9BufferCPPC1Ei>
    80003ee0:	0300006f          	j	80003f10 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003ee4:	00004517          	auipc	a0,0x4
    80003ee8:	2fc50513          	addi	a0,a0,764 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80003eec:	00000097          	auipc	ra,0x0
    80003ef0:	520080e7          	jalr	1312(ra) # 8000440c <_Z11printStringPKc>
        return;
    80003ef4:	0140006f          	j	80003f08 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003ef8:	00004517          	auipc	a0,0x4
    80003efc:	32850513          	addi	a0,a0,808 # 80008220 <CONSOLE_STATUS+0x210>
    80003f00:	00000097          	auipc	ra,0x0
    80003f04:	50c080e7          	jalr	1292(ra) # 8000440c <_Z11printStringPKc>
        return;
    80003f08:	000b8113          	mv	sp,s7
    80003f0c:	2380006f          	j	80004144 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80003f10:	01000513          	li	a0,16
    80003f14:	ffffe097          	auipc	ra,0xffffe
    80003f18:	f58080e7          	jalr	-168(ra) # 80001e6c <_Znwm>
    80003f1c:	00050493          	mv	s1,a0
    80003f20:	00000593          	li	a1,0
    80003f24:	ffffe097          	auipc	ra,0xffffe
    80003f28:	0d8080e7          	jalr	216(ra) # 80001ffc <_ZN9SemaphoreC1Ej>
    80003f2c:	00006797          	auipc	a5,0x6
    80003f30:	3e97ba23          	sd	s1,1012(a5) # 8000a320 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80003f34:	00391793          	slli	a5,s2,0x3
    80003f38:	00f78793          	addi	a5,a5,15
    80003f3c:	ff07f793          	andi	a5,a5,-16
    80003f40:	40f10133          	sub	sp,sp,a5
    80003f44:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80003f48:	0019071b          	addiw	a4,s2,1
    80003f4c:	00171793          	slli	a5,a4,0x1
    80003f50:	00e787b3          	add	a5,a5,a4
    80003f54:	00379793          	slli	a5,a5,0x3
    80003f58:	00f78793          	addi	a5,a5,15
    80003f5c:	ff07f793          	andi	a5,a5,-16
    80003f60:	40f10133          	sub	sp,sp,a5
    80003f64:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80003f68:	00191c13          	slli	s8,s2,0x1
    80003f6c:	012c07b3          	add	a5,s8,s2
    80003f70:	00379793          	slli	a5,a5,0x3
    80003f74:	00fa07b3          	add	a5,s4,a5
    80003f78:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003f7c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80003f80:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80003f84:	02800513          	li	a0,40
    80003f88:	ffffe097          	auipc	ra,0xffffe
    80003f8c:	ee4080e7          	jalr	-284(ra) # 80001e6c <_Znwm>
    80003f90:	00050b13          	mv	s6,a0
    80003f94:	012c0c33          	add	s8,s8,s2
    80003f98:	003c1c13          	slli	s8,s8,0x3
    80003f9c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80003fa0:	ffffe097          	auipc	ra,0xffffe
    80003fa4:	fe4080e7          	jalr	-28(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80003fa8:	00006797          	auipc	a5,0x6
    80003fac:	28078793          	addi	a5,a5,640 # 8000a228 <_ZTV12ConsumerSync+0x10>
    80003fb0:	00fb3023          	sd	a5,0(s6)
    80003fb4:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80003fb8:	000b0513          	mv	a0,s6
    80003fbc:	ffffe097          	auipc	ra,0xffffe
    80003fc0:	f94080e7          	jalr	-108(ra) # 80001f50 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003fc4:	00000493          	li	s1,0
    80003fc8:	0380006f          	j	80004000 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80003fcc:	00006797          	auipc	a5,0x6
    80003fd0:	23478793          	addi	a5,a5,564 # 8000a200 <_ZTV12ProducerSync+0x10>
    80003fd4:	00fcb023          	sd	a5,0(s9)
    80003fd8:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80003fdc:	00349793          	slli	a5,s1,0x3
    80003fe0:	00f987b3          	add	a5,s3,a5
    80003fe4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80003fe8:	00349793          	slli	a5,s1,0x3
    80003fec:	00f987b3          	add	a5,s3,a5
    80003ff0:	0007b503          	ld	a0,0(a5)
    80003ff4:	ffffe097          	auipc	ra,0xffffe
    80003ff8:	f5c080e7          	jalr	-164(ra) # 80001f50 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003ffc:	0014849b          	addiw	s1,s1,1
    80004000:	0b24d063          	bge	s1,s2,800040a0 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004004:	00149793          	slli	a5,s1,0x1
    80004008:	009787b3          	add	a5,a5,s1
    8000400c:	00379793          	slli	a5,a5,0x3
    80004010:	00fa07b3          	add	a5,s4,a5
    80004014:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004018:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    8000401c:	00006717          	auipc	a4,0x6
    80004020:	30473703          	ld	a4,772(a4) # 8000a320 <_ZL10waitForAll>
    80004024:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80004028:	02905863          	blez	s1,80004058 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    8000402c:	02800513          	li	a0,40
    80004030:	ffffe097          	auipc	ra,0xffffe
    80004034:	e3c080e7          	jalr	-452(ra) # 80001e6c <_Znwm>
    80004038:	00050c93          	mv	s9,a0
    8000403c:	00149c13          	slli	s8,s1,0x1
    80004040:	009c0c33          	add	s8,s8,s1
    80004044:	003c1c13          	slli	s8,s8,0x3
    80004048:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000404c:	ffffe097          	auipc	ra,0xffffe
    80004050:	f38080e7          	jalr	-200(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80004054:	f79ff06f          	j	80003fcc <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80004058:	02800513          	li	a0,40
    8000405c:	ffffe097          	auipc	ra,0xffffe
    80004060:	e10080e7          	jalr	-496(ra) # 80001e6c <_Znwm>
    80004064:	00050c93          	mv	s9,a0
    80004068:	00149c13          	slli	s8,s1,0x1
    8000406c:	009c0c33          	add	s8,s8,s1
    80004070:	003c1c13          	slli	s8,s8,0x3
    80004074:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80004078:	ffffe097          	auipc	ra,0xffffe
    8000407c:	f0c080e7          	jalr	-244(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80004080:	00006797          	auipc	a5,0x6
    80004084:	15878793          	addi	a5,a5,344 # 8000a1d8 <_ZTV16ProducerKeyboard+0x10>
    80004088:	00fcb023          	sd	a5,0(s9)
    8000408c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004090:	00349793          	slli	a5,s1,0x3
    80004094:	00f987b3          	add	a5,s3,a5
    80004098:	0197b023          	sd	s9,0(a5)
    8000409c:	f4dff06f          	j	80003fe8 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800040a0:	ffffe097          	auipc	ra,0xffffe
    800040a4:	f18080e7          	jalr	-232(ra) # 80001fb8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800040a8:	00000493          	li	s1,0
    800040ac:	00994e63          	blt	s2,s1,800040c8 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800040b0:	00006517          	auipc	a0,0x6
    800040b4:	27053503          	ld	a0,624(a0) # 8000a320 <_ZL10waitForAll>
    800040b8:	ffffe097          	auipc	ra,0xffffe
    800040bc:	f7c080e7          	jalr	-132(ra) # 80002034 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800040c0:	0014849b          	addiw	s1,s1,1
    800040c4:	fe9ff06f          	j	800040ac <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800040c8:	00000493          	li	s1,0
    800040cc:	0080006f          	j	800040d4 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800040d0:	0014849b          	addiw	s1,s1,1
    800040d4:	0324d263          	bge	s1,s2,800040f8 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800040d8:	00349793          	slli	a5,s1,0x3
    800040dc:	00f987b3          	add	a5,s3,a5
    800040e0:	0007b503          	ld	a0,0(a5)
    800040e4:	fe0506e3          	beqz	a0,800040d0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800040e8:	00053783          	ld	a5,0(a0)
    800040ec:	0087b783          	ld	a5,8(a5)
    800040f0:	000780e7          	jalr	a5
    800040f4:	fddff06f          	j	800040d0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800040f8:	000b0a63          	beqz	s6,8000410c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800040fc:	000b3783          	ld	a5,0(s6)
    80004100:	0087b783          	ld	a5,8(a5)
    80004104:	000b0513          	mv	a0,s6
    80004108:	000780e7          	jalr	a5
    delete waitForAll;
    8000410c:	00006517          	auipc	a0,0x6
    80004110:	21453503          	ld	a0,532(a0) # 8000a320 <_ZL10waitForAll>
    80004114:	00050863          	beqz	a0,80004124 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80004118:	00053783          	ld	a5,0(a0)
    8000411c:	0087b783          	ld	a5,8(a5)
    80004120:	000780e7          	jalr	a5
    delete buffer;
    80004124:	000a8e63          	beqz	s5,80004140 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80004128:	000a8513          	mv	a0,s5
    8000412c:	00001097          	auipc	ra,0x1
    80004130:	8a8080e7          	jalr	-1880(ra) # 800049d4 <_ZN9BufferCPPD1Ev>
    80004134:	000a8513          	mv	a0,s5
    80004138:	ffffe097          	auipc	ra,0xffffe
    8000413c:	d5c080e7          	jalr	-676(ra) # 80001e94 <_ZdlPv>
    80004140:	000b8113          	mv	sp,s7

}
    80004144:	f8040113          	addi	sp,s0,-128
    80004148:	07813083          	ld	ra,120(sp)
    8000414c:	07013403          	ld	s0,112(sp)
    80004150:	06813483          	ld	s1,104(sp)
    80004154:	06013903          	ld	s2,96(sp)
    80004158:	05813983          	ld	s3,88(sp)
    8000415c:	05013a03          	ld	s4,80(sp)
    80004160:	04813a83          	ld	s5,72(sp)
    80004164:	04013b03          	ld	s6,64(sp)
    80004168:	03813b83          	ld	s7,56(sp)
    8000416c:	03013c03          	ld	s8,48(sp)
    80004170:	02813c83          	ld	s9,40(sp)
    80004174:	08010113          	addi	sp,sp,128
    80004178:	00008067          	ret
    8000417c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004180:	000a8513          	mv	a0,s5
    80004184:	ffffe097          	auipc	ra,0xffffe
    80004188:	d10080e7          	jalr	-752(ra) # 80001e94 <_ZdlPv>
    8000418c:	00048513          	mv	a0,s1
    80004190:	00007097          	auipc	ra,0x7
    80004194:	278080e7          	jalr	632(ra) # 8000b408 <_Unwind_Resume>
    80004198:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000419c:	00048513          	mv	a0,s1
    800041a0:	ffffe097          	auipc	ra,0xffffe
    800041a4:	cf4080e7          	jalr	-780(ra) # 80001e94 <_ZdlPv>
    800041a8:	00090513          	mv	a0,s2
    800041ac:	00007097          	auipc	ra,0x7
    800041b0:	25c080e7          	jalr	604(ra) # 8000b408 <_Unwind_Resume>
    800041b4:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800041b8:	000b0513          	mv	a0,s6
    800041bc:	ffffe097          	auipc	ra,0xffffe
    800041c0:	cd8080e7          	jalr	-808(ra) # 80001e94 <_ZdlPv>
    800041c4:	00048513          	mv	a0,s1
    800041c8:	00007097          	auipc	ra,0x7
    800041cc:	240080e7          	jalr	576(ra) # 8000b408 <_Unwind_Resume>
    800041d0:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800041d4:	000c8513          	mv	a0,s9
    800041d8:	ffffe097          	auipc	ra,0xffffe
    800041dc:	cbc080e7          	jalr	-836(ra) # 80001e94 <_ZdlPv>
    800041e0:	00048513          	mv	a0,s1
    800041e4:	00007097          	auipc	ra,0x7
    800041e8:	224080e7          	jalr	548(ra) # 8000b408 <_Unwind_Resume>
    800041ec:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800041f0:	000c8513          	mv	a0,s9
    800041f4:	ffffe097          	auipc	ra,0xffffe
    800041f8:	ca0080e7          	jalr	-864(ra) # 80001e94 <_ZdlPv>
    800041fc:	00048513          	mv	a0,s1
    80004200:	00007097          	auipc	ra,0x7
    80004204:	208080e7          	jalr	520(ra) # 8000b408 <_Unwind_Resume>

0000000080004208 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004208:	ff010113          	addi	sp,sp,-16
    8000420c:	00113423          	sd	ra,8(sp)
    80004210:	00813023          	sd	s0,0(sp)
    80004214:	01010413          	addi	s0,sp,16
    80004218:	00006797          	auipc	a5,0x6
    8000421c:	01078793          	addi	a5,a5,16 # 8000a228 <_ZTV12ConsumerSync+0x10>
    80004220:	00f53023          	sd	a5,0(a0)
    80004224:	ffffe097          	auipc	ra,0xffffe
    80004228:	bf8080e7          	jalr	-1032(ra) # 80001e1c <_ZN6ThreadD1Ev>
    8000422c:	00813083          	ld	ra,8(sp)
    80004230:	00013403          	ld	s0,0(sp)
    80004234:	01010113          	addi	sp,sp,16
    80004238:	00008067          	ret

000000008000423c <_ZN12ConsumerSyncD0Ev>:
    8000423c:	fe010113          	addi	sp,sp,-32
    80004240:	00113c23          	sd	ra,24(sp)
    80004244:	00813823          	sd	s0,16(sp)
    80004248:	00913423          	sd	s1,8(sp)
    8000424c:	02010413          	addi	s0,sp,32
    80004250:	00050493          	mv	s1,a0
    80004254:	00006797          	auipc	a5,0x6
    80004258:	fd478793          	addi	a5,a5,-44 # 8000a228 <_ZTV12ConsumerSync+0x10>
    8000425c:	00f53023          	sd	a5,0(a0)
    80004260:	ffffe097          	auipc	ra,0xffffe
    80004264:	bbc080e7          	jalr	-1092(ra) # 80001e1c <_ZN6ThreadD1Ev>
    80004268:	00048513          	mv	a0,s1
    8000426c:	ffffe097          	auipc	ra,0xffffe
    80004270:	c28080e7          	jalr	-984(ra) # 80001e94 <_ZdlPv>
    80004274:	01813083          	ld	ra,24(sp)
    80004278:	01013403          	ld	s0,16(sp)
    8000427c:	00813483          	ld	s1,8(sp)
    80004280:	02010113          	addi	sp,sp,32
    80004284:	00008067          	ret

0000000080004288 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004288:	ff010113          	addi	sp,sp,-16
    8000428c:	00113423          	sd	ra,8(sp)
    80004290:	00813023          	sd	s0,0(sp)
    80004294:	01010413          	addi	s0,sp,16
    80004298:	00006797          	auipc	a5,0x6
    8000429c:	f6878793          	addi	a5,a5,-152 # 8000a200 <_ZTV12ProducerSync+0x10>
    800042a0:	00f53023          	sd	a5,0(a0)
    800042a4:	ffffe097          	auipc	ra,0xffffe
    800042a8:	b78080e7          	jalr	-1160(ra) # 80001e1c <_ZN6ThreadD1Ev>
    800042ac:	00813083          	ld	ra,8(sp)
    800042b0:	00013403          	ld	s0,0(sp)
    800042b4:	01010113          	addi	sp,sp,16
    800042b8:	00008067          	ret

00000000800042bc <_ZN12ProducerSyncD0Ev>:
    800042bc:	fe010113          	addi	sp,sp,-32
    800042c0:	00113c23          	sd	ra,24(sp)
    800042c4:	00813823          	sd	s0,16(sp)
    800042c8:	00913423          	sd	s1,8(sp)
    800042cc:	02010413          	addi	s0,sp,32
    800042d0:	00050493          	mv	s1,a0
    800042d4:	00006797          	auipc	a5,0x6
    800042d8:	f2c78793          	addi	a5,a5,-212 # 8000a200 <_ZTV12ProducerSync+0x10>
    800042dc:	00f53023          	sd	a5,0(a0)
    800042e0:	ffffe097          	auipc	ra,0xffffe
    800042e4:	b3c080e7          	jalr	-1220(ra) # 80001e1c <_ZN6ThreadD1Ev>
    800042e8:	00048513          	mv	a0,s1
    800042ec:	ffffe097          	auipc	ra,0xffffe
    800042f0:	ba8080e7          	jalr	-1112(ra) # 80001e94 <_ZdlPv>
    800042f4:	01813083          	ld	ra,24(sp)
    800042f8:	01013403          	ld	s0,16(sp)
    800042fc:	00813483          	ld	s1,8(sp)
    80004300:	02010113          	addi	sp,sp,32
    80004304:	00008067          	ret

0000000080004308 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004308:	ff010113          	addi	sp,sp,-16
    8000430c:	00113423          	sd	ra,8(sp)
    80004310:	00813023          	sd	s0,0(sp)
    80004314:	01010413          	addi	s0,sp,16
    80004318:	00006797          	auipc	a5,0x6
    8000431c:	ec078793          	addi	a5,a5,-320 # 8000a1d8 <_ZTV16ProducerKeyboard+0x10>
    80004320:	00f53023          	sd	a5,0(a0)
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	af8080e7          	jalr	-1288(ra) # 80001e1c <_ZN6ThreadD1Ev>
    8000432c:	00813083          	ld	ra,8(sp)
    80004330:	00013403          	ld	s0,0(sp)
    80004334:	01010113          	addi	sp,sp,16
    80004338:	00008067          	ret

000000008000433c <_ZN16ProducerKeyboardD0Ev>:
    8000433c:	fe010113          	addi	sp,sp,-32
    80004340:	00113c23          	sd	ra,24(sp)
    80004344:	00813823          	sd	s0,16(sp)
    80004348:	00913423          	sd	s1,8(sp)
    8000434c:	02010413          	addi	s0,sp,32
    80004350:	00050493          	mv	s1,a0
    80004354:	00006797          	auipc	a5,0x6
    80004358:	e8478793          	addi	a5,a5,-380 # 8000a1d8 <_ZTV16ProducerKeyboard+0x10>
    8000435c:	00f53023          	sd	a5,0(a0)
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	abc080e7          	jalr	-1348(ra) # 80001e1c <_ZN6ThreadD1Ev>
    80004368:	00048513          	mv	a0,s1
    8000436c:	ffffe097          	auipc	ra,0xffffe
    80004370:	b28080e7          	jalr	-1240(ra) # 80001e94 <_ZdlPv>
    80004374:	01813083          	ld	ra,24(sp)
    80004378:	01013403          	ld	s0,16(sp)
    8000437c:	00813483          	ld	s1,8(sp)
    80004380:	02010113          	addi	sp,sp,32
    80004384:	00008067          	ret

0000000080004388 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004388:	ff010113          	addi	sp,sp,-16
    8000438c:	00113423          	sd	ra,8(sp)
    80004390:	00813023          	sd	s0,0(sp)
    80004394:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004398:	02053583          	ld	a1,32(a0)
    8000439c:	fffff097          	auipc	ra,0xfffff
    800043a0:	7e4080e7          	jalr	2020(ra) # 80003b80 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800043a4:	00813083          	ld	ra,8(sp)
    800043a8:	00013403          	ld	s0,0(sp)
    800043ac:	01010113          	addi	sp,sp,16
    800043b0:	00008067          	ret

00000000800043b4 <_ZN12ProducerSync3runEv>:
    void run() override {
    800043b4:	ff010113          	addi	sp,sp,-16
    800043b8:	00113423          	sd	ra,8(sp)
    800043bc:	00813023          	sd	s0,0(sp)
    800043c0:	01010413          	addi	s0,sp,16
        producer(td);
    800043c4:	02053583          	ld	a1,32(a0)
    800043c8:	00000097          	auipc	ra,0x0
    800043cc:	878080e7          	jalr	-1928(ra) # 80003c40 <_ZN12ProducerSync8producerEPv>
    }
    800043d0:	00813083          	ld	ra,8(sp)
    800043d4:	00013403          	ld	s0,0(sp)
    800043d8:	01010113          	addi	sp,sp,16
    800043dc:	00008067          	ret

00000000800043e0 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800043e0:	ff010113          	addi	sp,sp,-16
    800043e4:	00113423          	sd	ra,8(sp)
    800043e8:	00813023          	sd	s0,0(sp)
    800043ec:	01010413          	addi	s0,sp,16
        consumer(td);
    800043f0:	02053583          	ld	a1,32(a0)
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	8e0080e7          	jalr	-1824(ra) # 80003cd4 <_ZN12ConsumerSync8consumerEPv>
    }
    800043fc:	00813083          	ld	ra,8(sp)
    80004400:	00013403          	ld	s0,0(sp)
    80004404:	01010113          	addi	sp,sp,16
    80004408:	00008067          	ret

000000008000440c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000440c:	fe010113          	addi	sp,sp,-32
    80004410:	00113c23          	sd	ra,24(sp)
    80004414:	00813823          	sd	s0,16(sp)
    80004418:	00913423          	sd	s1,8(sp)
    8000441c:	02010413          	addi	s0,sp,32
    80004420:	00050493          	mv	s1,a0
    LOCK();
    80004424:	00100613          	li	a2,1
    80004428:	00000593          	li	a1,0
    8000442c:	00006517          	auipc	a0,0x6
    80004430:	efc50513          	addi	a0,a0,-260 # 8000a328 <lockPrint>
    80004434:	ffffd097          	auipc	ra,0xffffd
    80004438:	e28080e7          	jalr	-472(ra) # 8000125c <copy_and_swap>
    8000443c:	00050863          	beqz	a0,8000444c <_Z11printStringPKc+0x40>
    80004440:	ffffd097          	auipc	ra,0xffffd
    80004444:	f7c080e7          	jalr	-132(ra) # 800013bc <_Z15thread_dispatchv>
    80004448:	fddff06f          	j	80004424 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000444c:	0004c503          	lbu	a0,0(s1)
    80004450:	00050a63          	beqz	a0,80004464 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004454:	ffffd097          	auipc	ra,0xffffd
    80004458:	0e8080e7          	jalr	232(ra) # 8000153c <_Z4putcc>
        string++;
    8000445c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004460:	fedff06f          	j	8000444c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004464:	00000613          	li	a2,0
    80004468:	00100593          	li	a1,1
    8000446c:	00006517          	auipc	a0,0x6
    80004470:	ebc50513          	addi	a0,a0,-324 # 8000a328 <lockPrint>
    80004474:	ffffd097          	auipc	ra,0xffffd
    80004478:	de8080e7          	jalr	-536(ra) # 8000125c <copy_and_swap>
    8000447c:	fe0514e3          	bnez	a0,80004464 <_Z11printStringPKc+0x58>
}
    80004480:	01813083          	ld	ra,24(sp)
    80004484:	01013403          	ld	s0,16(sp)
    80004488:	00813483          	ld	s1,8(sp)
    8000448c:	02010113          	addi	sp,sp,32
    80004490:	00008067          	ret

0000000080004494 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004494:	fd010113          	addi	sp,sp,-48
    80004498:	02113423          	sd	ra,40(sp)
    8000449c:	02813023          	sd	s0,32(sp)
    800044a0:	00913c23          	sd	s1,24(sp)
    800044a4:	01213823          	sd	s2,16(sp)
    800044a8:	01313423          	sd	s3,8(sp)
    800044ac:	01413023          	sd	s4,0(sp)
    800044b0:	03010413          	addi	s0,sp,48
    800044b4:	00050993          	mv	s3,a0
    800044b8:	00058a13          	mv	s4,a1
    LOCK();
    800044bc:	00100613          	li	a2,1
    800044c0:	00000593          	li	a1,0
    800044c4:	00006517          	auipc	a0,0x6
    800044c8:	e6450513          	addi	a0,a0,-412 # 8000a328 <lockPrint>
    800044cc:	ffffd097          	auipc	ra,0xffffd
    800044d0:	d90080e7          	jalr	-624(ra) # 8000125c <copy_and_swap>
    800044d4:	00050863          	beqz	a0,800044e4 <_Z9getStringPci+0x50>
    800044d8:	ffffd097          	auipc	ra,0xffffd
    800044dc:	ee4080e7          	jalr	-284(ra) # 800013bc <_Z15thread_dispatchv>
    800044e0:	fddff06f          	j	800044bc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800044e4:	00000913          	li	s2,0
    800044e8:	00090493          	mv	s1,s2
    800044ec:	0019091b          	addiw	s2,s2,1
    800044f0:	03495a63          	bge	s2,s4,80004524 <_Z9getStringPci+0x90>
        cc = getc();
    800044f4:	ffffd097          	auipc	ra,0xffffd
    800044f8:	084080e7          	jalr	132(ra) # 80001578 <_Z4getcv>
        if(cc < 1)
    800044fc:	02050463          	beqz	a0,80004524 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80004500:	009984b3          	add	s1,s3,s1
    80004504:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004508:	00a00793          	li	a5,10
    8000450c:	00f50a63          	beq	a0,a5,80004520 <_Z9getStringPci+0x8c>
    80004510:	00d00793          	li	a5,13
    80004514:	fcf51ae3          	bne	a0,a5,800044e8 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80004518:	00090493          	mv	s1,s2
    8000451c:	0080006f          	j	80004524 <_Z9getStringPci+0x90>
    80004520:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004524:	009984b3          	add	s1,s3,s1
    80004528:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000452c:	00000613          	li	a2,0
    80004530:	00100593          	li	a1,1
    80004534:	00006517          	auipc	a0,0x6
    80004538:	df450513          	addi	a0,a0,-524 # 8000a328 <lockPrint>
    8000453c:	ffffd097          	auipc	ra,0xffffd
    80004540:	d20080e7          	jalr	-736(ra) # 8000125c <copy_and_swap>
    80004544:	fe0514e3          	bnez	a0,8000452c <_Z9getStringPci+0x98>
    return buf;
}
    80004548:	00098513          	mv	a0,s3
    8000454c:	02813083          	ld	ra,40(sp)
    80004550:	02013403          	ld	s0,32(sp)
    80004554:	01813483          	ld	s1,24(sp)
    80004558:	01013903          	ld	s2,16(sp)
    8000455c:	00813983          	ld	s3,8(sp)
    80004560:	00013a03          	ld	s4,0(sp)
    80004564:	03010113          	addi	sp,sp,48
    80004568:	00008067          	ret

000000008000456c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000456c:	ff010113          	addi	sp,sp,-16
    80004570:	00813423          	sd	s0,8(sp)
    80004574:	01010413          	addi	s0,sp,16
    80004578:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000457c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004580:	0006c603          	lbu	a2,0(a3)
    80004584:	fd06071b          	addiw	a4,a2,-48
    80004588:	0ff77713          	andi	a4,a4,255
    8000458c:	00900793          	li	a5,9
    80004590:	02e7e063          	bltu	a5,a4,800045b0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004594:	0025179b          	slliw	a5,a0,0x2
    80004598:	00a787bb          	addw	a5,a5,a0
    8000459c:	0017979b          	slliw	a5,a5,0x1
    800045a0:	00168693          	addi	a3,a3,1
    800045a4:	00c787bb          	addw	a5,a5,a2
    800045a8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800045ac:	fd5ff06f          	j	80004580 <_Z11stringToIntPKc+0x14>
    return n;
}
    800045b0:	00813403          	ld	s0,8(sp)
    800045b4:	01010113          	addi	sp,sp,16
    800045b8:	00008067          	ret

00000000800045bc <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800045bc:	fc010113          	addi	sp,sp,-64
    800045c0:	02113c23          	sd	ra,56(sp)
    800045c4:	02813823          	sd	s0,48(sp)
    800045c8:	02913423          	sd	s1,40(sp)
    800045cc:	03213023          	sd	s2,32(sp)
    800045d0:	01313c23          	sd	s3,24(sp)
    800045d4:	04010413          	addi	s0,sp,64
    800045d8:	00050493          	mv	s1,a0
    800045dc:	00058913          	mv	s2,a1
    800045e0:	00060993          	mv	s3,a2
    LOCK();
    800045e4:	00100613          	li	a2,1
    800045e8:	00000593          	li	a1,0
    800045ec:	00006517          	auipc	a0,0x6
    800045f0:	d3c50513          	addi	a0,a0,-708 # 8000a328 <lockPrint>
    800045f4:	ffffd097          	auipc	ra,0xffffd
    800045f8:	c68080e7          	jalr	-920(ra) # 8000125c <copy_and_swap>
    800045fc:	00050863          	beqz	a0,8000460c <_Z8printIntiii+0x50>
    80004600:	ffffd097          	auipc	ra,0xffffd
    80004604:	dbc080e7          	jalr	-580(ra) # 800013bc <_Z15thread_dispatchv>
    80004608:	fddff06f          	j	800045e4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000460c:	00098463          	beqz	s3,80004614 <_Z8printIntiii+0x58>
    80004610:	0804c463          	bltz	s1,80004698 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004614:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004618:	00000593          	li	a1,0
    }

    i = 0;
    8000461c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80004620:	0009079b          	sext.w	a5,s2
    80004624:	0325773b          	remuw	a4,a0,s2
    80004628:	00048613          	mv	a2,s1
    8000462c:	0014849b          	addiw	s1,s1,1
    80004630:	02071693          	slli	a3,a4,0x20
    80004634:	0206d693          	srli	a3,a3,0x20
    80004638:	00006717          	auipc	a4,0x6
    8000463c:	c0870713          	addi	a4,a4,-1016 # 8000a240 <digits>
    80004640:	00d70733          	add	a4,a4,a3
    80004644:	00074683          	lbu	a3,0(a4)
    80004648:	fd040713          	addi	a4,s0,-48
    8000464c:	00c70733          	add	a4,a4,a2
    80004650:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004654:	0005071b          	sext.w	a4,a0
    80004658:	0325553b          	divuw	a0,a0,s2
    8000465c:	fcf772e3          	bgeu	a4,a5,80004620 <_Z8printIntiii+0x64>
    if(neg)
    80004660:	00058c63          	beqz	a1,80004678 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004664:	fd040793          	addi	a5,s0,-48
    80004668:	009784b3          	add	s1,a5,s1
    8000466c:	02d00793          	li	a5,45
    80004670:	fef48823          	sb	a5,-16(s1)
    80004674:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004678:	fff4849b          	addiw	s1,s1,-1
    8000467c:	0204c463          	bltz	s1,800046a4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80004680:	fd040793          	addi	a5,s0,-48
    80004684:	009787b3          	add	a5,a5,s1
    80004688:	ff07c503          	lbu	a0,-16(a5)
    8000468c:	ffffd097          	auipc	ra,0xffffd
    80004690:	eb0080e7          	jalr	-336(ra) # 8000153c <_Z4putcc>
    80004694:	fe5ff06f          	j	80004678 <_Z8printIntiii+0xbc>
        x = -xx;
    80004698:	4090053b          	negw	a0,s1
        neg = 1;
    8000469c:	00100593          	li	a1,1
        x = -xx;
    800046a0:	f7dff06f          	j	8000461c <_Z8printIntiii+0x60>

    UNLOCK();
    800046a4:	00000613          	li	a2,0
    800046a8:	00100593          	li	a1,1
    800046ac:	00006517          	auipc	a0,0x6
    800046b0:	c7c50513          	addi	a0,a0,-900 # 8000a328 <lockPrint>
    800046b4:	ffffd097          	auipc	ra,0xffffd
    800046b8:	ba8080e7          	jalr	-1112(ra) # 8000125c <copy_and_swap>
    800046bc:	fe0514e3          	bnez	a0,800046a4 <_Z8printIntiii+0xe8>
    800046c0:	03813083          	ld	ra,56(sp)
    800046c4:	03013403          	ld	s0,48(sp)
    800046c8:	02813483          	ld	s1,40(sp)
    800046cc:	02013903          	ld	s2,32(sp)
    800046d0:	01813983          	ld	s3,24(sp)
    800046d4:	04010113          	addi	sp,sp,64
    800046d8:	00008067          	ret

00000000800046dc <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800046dc:	fd010113          	addi	sp,sp,-48
    800046e0:	02113423          	sd	ra,40(sp)
    800046e4:	02813023          	sd	s0,32(sp)
    800046e8:	00913c23          	sd	s1,24(sp)
    800046ec:	01213823          	sd	s2,16(sp)
    800046f0:	01313423          	sd	s3,8(sp)
    800046f4:	03010413          	addi	s0,sp,48
    800046f8:	00050493          	mv	s1,a0
    800046fc:	00058913          	mv	s2,a1
    80004700:	0015879b          	addiw	a5,a1,1
    80004704:	0007851b          	sext.w	a0,a5
    80004708:	00f4a023          	sw	a5,0(s1)
    8000470c:	0004a823          	sw	zero,16(s1)
    80004710:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004714:	00251513          	slli	a0,a0,0x2
    80004718:	ffffd097          	auipc	ra,0xffffd
    8000471c:	b64080e7          	jalr	-1180(ra) # 8000127c <_Z9mem_allocm>
    80004720:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004724:	01000513          	li	a0,16
    80004728:	ffffd097          	auipc	ra,0xffffd
    8000472c:	744080e7          	jalr	1860(ra) # 80001e6c <_Znwm>
    80004730:	00050993          	mv	s3,a0
    80004734:	00000593          	li	a1,0
    80004738:	ffffe097          	auipc	ra,0xffffe
    8000473c:	8c4080e7          	jalr	-1852(ra) # 80001ffc <_ZN9SemaphoreC1Ej>
    80004740:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80004744:	01000513          	li	a0,16
    80004748:	ffffd097          	auipc	ra,0xffffd
    8000474c:	724080e7          	jalr	1828(ra) # 80001e6c <_Znwm>
    80004750:	00050993          	mv	s3,a0
    80004754:	00090593          	mv	a1,s2
    80004758:	ffffe097          	auipc	ra,0xffffe
    8000475c:	8a4080e7          	jalr	-1884(ra) # 80001ffc <_ZN9SemaphoreC1Ej>
    80004760:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004764:	01000513          	li	a0,16
    80004768:	ffffd097          	auipc	ra,0xffffd
    8000476c:	704080e7          	jalr	1796(ra) # 80001e6c <_Znwm>
    80004770:	00050913          	mv	s2,a0
    80004774:	00100593          	li	a1,1
    80004778:	ffffe097          	auipc	ra,0xffffe
    8000477c:	884080e7          	jalr	-1916(ra) # 80001ffc <_ZN9SemaphoreC1Ej>
    80004780:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004784:	01000513          	li	a0,16
    80004788:	ffffd097          	auipc	ra,0xffffd
    8000478c:	6e4080e7          	jalr	1764(ra) # 80001e6c <_Znwm>
    80004790:	00050913          	mv	s2,a0
    80004794:	00100593          	li	a1,1
    80004798:	ffffe097          	auipc	ra,0xffffe
    8000479c:	864080e7          	jalr	-1948(ra) # 80001ffc <_ZN9SemaphoreC1Ej>
    800047a0:	0324b823          	sd	s2,48(s1)
}
    800047a4:	02813083          	ld	ra,40(sp)
    800047a8:	02013403          	ld	s0,32(sp)
    800047ac:	01813483          	ld	s1,24(sp)
    800047b0:	01013903          	ld	s2,16(sp)
    800047b4:	00813983          	ld	s3,8(sp)
    800047b8:	03010113          	addi	sp,sp,48
    800047bc:	00008067          	ret
    800047c0:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800047c4:	00098513          	mv	a0,s3
    800047c8:	ffffd097          	auipc	ra,0xffffd
    800047cc:	6cc080e7          	jalr	1740(ra) # 80001e94 <_ZdlPv>
    800047d0:	00048513          	mv	a0,s1
    800047d4:	00007097          	auipc	ra,0x7
    800047d8:	c34080e7          	jalr	-972(ra) # 8000b408 <_Unwind_Resume>
    800047dc:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800047e0:	00098513          	mv	a0,s3
    800047e4:	ffffd097          	auipc	ra,0xffffd
    800047e8:	6b0080e7          	jalr	1712(ra) # 80001e94 <_ZdlPv>
    800047ec:	00048513          	mv	a0,s1
    800047f0:	00007097          	auipc	ra,0x7
    800047f4:	c18080e7          	jalr	-1000(ra) # 8000b408 <_Unwind_Resume>
    800047f8:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800047fc:	00090513          	mv	a0,s2
    80004800:	ffffd097          	auipc	ra,0xffffd
    80004804:	694080e7          	jalr	1684(ra) # 80001e94 <_ZdlPv>
    80004808:	00048513          	mv	a0,s1
    8000480c:	00007097          	auipc	ra,0x7
    80004810:	bfc080e7          	jalr	-1028(ra) # 8000b408 <_Unwind_Resume>
    80004814:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004818:	00090513          	mv	a0,s2
    8000481c:	ffffd097          	auipc	ra,0xffffd
    80004820:	678080e7          	jalr	1656(ra) # 80001e94 <_ZdlPv>
    80004824:	00048513          	mv	a0,s1
    80004828:	00007097          	auipc	ra,0x7
    8000482c:	be0080e7          	jalr	-1056(ra) # 8000b408 <_Unwind_Resume>

0000000080004830 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004830:	fe010113          	addi	sp,sp,-32
    80004834:	00113c23          	sd	ra,24(sp)
    80004838:	00813823          	sd	s0,16(sp)
    8000483c:	00913423          	sd	s1,8(sp)
    80004840:	01213023          	sd	s2,0(sp)
    80004844:	02010413          	addi	s0,sp,32
    80004848:	00050493          	mv	s1,a0
    8000484c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004850:	01853503          	ld	a0,24(a0)
    80004854:	ffffd097          	auipc	ra,0xffffd
    80004858:	7e0080e7          	jalr	2016(ra) # 80002034 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    8000485c:	0304b503          	ld	a0,48(s1)
    80004860:	ffffd097          	auipc	ra,0xffffd
    80004864:	7d4080e7          	jalr	2004(ra) # 80002034 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004868:	0084b783          	ld	a5,8(s1)
    8000486c:	0144a703          	lw	a4,20(s1)
    80004870:	00271713          	slli	a4,a4,0x2
    80004874:	00e787b3          	add	a5,a5,a4
    80004878:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000487c:	0144a783          	lw	a5,20(s1)
    80004880:	0017879b          	addiw	a5,a5,1
    80004884:	0004a703          	lw	a4,0(s1)
    80004888:	02e7e7bb          	remw	a5,a5,a4
    8000488c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004890:	0304b503          	ld	a0,48(s1)
    80004894:	ffffd097          	auipc	ra,0xffffd
    80004898:	7cc080e7          	jalr	1996(ra) # 80002060 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000489c:	0204b503          	ld	a0,32(s1)
    800048a0:	ffffd097          	auipc	ra,0xffffd
    800048a4:	7c0080e7          	jalr	1984(ra) # 80002060 <_ZN9Semaphore6signalEv>

}
    800048a8:	01813083          	ld	ra,24(sp)
    800048ac:	01013403          	ld	s0,16(sp)
    800048b0:	00813483          	ld	s1,8(sp)
    800048b4:	00013903          	ld	s2,0(sp)
    800048b8:	02010113          	addi	sp,sp,32
    800048bc:	00008067          	ret

00000000800048c0 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800048c0:	fe010113          	addi	sp,sp,-32
    800048c4:	00113c23          	sd	ra,24(sp)
    800048c8:	00813823          	sd	s0,16(sp)
    800048cc:	00913423          	sd	s1,8(sp)
    800048d0:	01213023          	sd	s2,0(sp)
    800048d4:	02010413          	addi	s0,sp,32
    800048d8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800048dc:	02053503          	ld	a0,32(a0)
    800048e0:	ffffd097          	auipc	ra,0xffffd
    800048e4:	754080e7          	jalr	1876(ra) # 80002034 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800048e8:	0284b503          	ld	a0,40(s1)
    800048ec:	ffffd097          	auipc	ra,0xffffd
    800048f0:	748080e7          	jalr	1864(ra) # 80002034 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800048f4:	0084b703          	ld	a4,8(s1)
    800048f8:	0104a783          	lw	a5,16(s1)
    800048fc:	00279693          	slli	a3,a5,0x2
    80004900:	00d70733          	add	a4,a4,a3
    80004904:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004908:	0017879b          	addiw	a5,a5,1
    8000490c:	0004a703          	lw	a4,0(s1)
    80004910:	02e7e7bb          	remw	a5,a5,a4
    80004914:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004918:	0284b503          	ld	a0,40(s1)
    8000491c:	ffffd097          	auipc	ra,0xffffd
    80004920:	744080e7          	jalr	1860(ra) # 80002060 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80004924:	0184b503          	ld	a0,24(s1)
    80004928:	ffffd097          	auipc	ra,0xffffd
    8000492c:	738080e7          	jalr	1848(ra) # 80002060 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004930:	00090513          	mv	a0,s2
    80004934:	01813083          	ld	ra,24(sp)
    80004938:	01013403          	ld	s0,16(sp)
    8000493c:	00813483          	ld	s1,8(sp)
    80004940:	00013903          	ld	s2,0(sp)
    80004944:	02010113          	addi	sp,sp,32
    80004948:	00008067          	ret

000000008000494c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000494c:	fe010113          	addi	sp,sp,-32
    80004950:	00113c23          	sd	ra,24(sp)
    80004954:	00813823          	sd	s0,16(sp)
    80004958:	00913423          	sd	s1,8(sp)
    8000495c:	01213023          	sd	s2,0(sp)
    80004960:	02010413          	addi	s0,sp,32
    80004964:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004968:	02853503          	ld	a0,40(a0)
    8000496c:	ffffd097          	auipc	ra,0xffffd
    80004970:	6c8080e7          	jalr	1736(ra) # 80002034 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004974:	0304b503          	ld	a0,48(s1)
    80004978:	ffffd097          	auipc	ra,0xffffd
    8000497c:	6bc080e7          	jalr	1724(ra) # 80002034 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80004980:	0144a783          	lw	a5,20(s1)
    80004984:	0104a903          	lw	s2,16(s1)
    80004988:	0327ce63          	blt	a5,s2,800049c4 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    8000498c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004990:	0304b503          	ld	a0,48(s1)
    80004994:	ffffd097          	auipc	ra,0xffffd
    80004998:	6cc080e7          	jalr	1740(ra) # 80002060 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000499c:	0284b503          	ld	a0,40(s1)
    800049a0:	ffffd097          	auipc	ra,0xffffd
    800049a4:	6c0080e7          	jalr	1728(ra) # 80002060 <_ZN9Semaphore6signalEv>

    return ret;
}
    800049a8:	00090513          	mv	a0,s2
    800049ac:	01813083          	ld	ra,24(sp)
    800049b0:	01013403          	ld	s0,16(sp)
    800049b4:	00813483          	ld	s1,8(sp)
    800049b8:	00013903          	ld	s2,0(sp)
    800049bc:	02010113          	addi	sp,sp,32
    800049c0:	00008067          	ret
        ret = cap - head + tail;
    800049c4:	0004a703          	lw	a4,0(s1)
    800049c8:	4127093b          	subw	s2,a4,s2
    800049cc:	00f9093b          	addw	s2,s2,a5
    800049d0:	fc1ff06f          	j	80004990 <_ZN9BufferCPP6getCntEv+0x44>

00000000800049d4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800049d4:	fe010113          	addi	sp,sp,-32
    800049d8:	00113c23          	sd	ra,24(sp)
    800049dc:	00813823          	sd	s0,16(sp)
    800049e0:	00913423          	sd	s1,8(sp)
    800049e4:	02010413          	addi	s0,sp,32
    800049e8:	00050493          	mv	s1,a0
    Console::putc('\n');
    800049ec:	00a00513          	li	a0,10
    800049f0:	ffffd097          	auipc	ra,0xffffd
    800049f4:	70c080e7          	jalr	1804(ra) # 800020fc <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800049f8:	00004517          	auipc	a0,0x4
    800049fc:	95050513          	addi	a0,a0,-1712 # 80008348 <CONSOLE_STATUS+0x338>
    80004a00:	00000097          	auipc	ra,0x0
    80004a04:	a0c080e7          	jalr	-1524(ra) # 8000440c <_Z11printStringPKc>
    while (getCnt()) {
    80004a08:	00048513          	mv	a0,s1
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	f40080e7          	jalr	-192(ra) # 8000494c <_ZN9BufferCPP6getCntEv>
    80004a14:	02050c63          	beqz	a0,80004a4c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004a18:	0084b783          	ld	a5,8(s1)
    80004a1c:	0104a703          	lw	a4,16(s1)
    80004a20:	00271713          	slli	a4,a4,0x2
    80004a24:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004a28:	0007c503          	lbu	a0,0(a5)
    80004a2c:	ffffd097          	auipc	ra,0xffffd
    80004a30:	6d0080e7          	jalr	1744(ra) # 800020fc <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80004a34:	0104a783          	lw	a5,16(s1)
    80004a38:	0017879b          	addiw	a5,a5,1
    80004a3c:	0004a703          	lw	a4,0(s1)
    80004a40:	02e7e7bb          	remw	a5,a5,a4
    80004a44:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004a48:	fc1ff06f          	j	80004a08 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80004a4c:	02100513          	li	a0,33
    80004a50:	ffffd097          	auipc	ra,0xffffd
    80004a54:	6ac080e7          	jalr	1708(ra) # 800020fc <_ZN7Console4putcEc>
    Console::putc('\n');
    80004a58:	00a00513          	li	a0,10
    80004a5c:	ffffd097          	auipc	ra,0xffffd
    80004a60:	6a0080e7          	jalr	1696(ra) # 800020fc <_ZN7Console4putcEc>
    mem_free(buffer);
    80004a64:	0084b503          	ld	a0,8(s1)
    80004a68:	ffffd097          	auipc	ra,0xffffd
    80004a6c:	864080e7          	jalr	-1948(ra) # 800012cc <_Z8mem_freePv>
    delete itemAvailable;
    80004a70:	0204b503          	ld	a0,32(s1)
    80004a74:	00050863          	beqz	a0,80004a84 <_ZN9BufferCPPD1Ev+0xb0>
    80004a78:	00053783          	ld	a5,0(a0)
    80004a7c:	0087b783          	ld	a5,8(a5)
    80004a80:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004a84:	0184b503          	ld	a0,24(s1)
    80004a88:	00050863          	beqz	a0,80004a98 <_ZN9BufferCPPD1Ev+0xc4>
    80004a8c:	00053783          	ld	a5,0(a0)
    80004a90:	0087b783          	ld	a5,8(a5)
    80004a94:	000780e7          	jalr	a5
    delete mutexTail;
    80004a98:	0304b503          	ld	a0,48(s1)
    80004a9c:	00050863          	beqz	a0,80004aac <_ZN9BufferCPPD1Ev+0xd8>
    80004aa0:	00053783          	ld	a5,0(a0)
    80004aa4:	0087b783          	ld	a5,8(a5)
    80004aa8:	000780e7          	jalr	a5
    delete mutexHead;
    80004aac:	0284b503          	ld	a0,40(s1)
    80004ab0:	00050863          	beqz	a0,80004ac0 <_ZN9BufferCPPD1Ev+0xec>
    80004ab4:	00053783          	ld	a5,0(a0)
    80004ab8:	0087b783          	ld	a5,8(a5)
    80004abc:	000780e7          	jalr	a5
}
    80004ac0:	01813083          	ld	ra,24(sp)
    80004ac4:	01013403          	ld	s0,16(sp)
    80004ac8:	00813483          	ld	s1,8(sp)
    80004acc:	02010113          	addi	sp,sp,32
    80004ad0:	00008067          	ret

0000000080004ad4 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80004ad4:	fe010113          	addi	sp,sp,-32
    80004ad8:	00113c23          	sd	ra,24(sp)
    80004adc:	00813823          	sd	s0,16(sp)
    80004ae0:	00913423          	sd	s1,8(sp)
    80004ae4:	01213023          	sd	s2,0(sp)
    80004ae8:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80004aec:	00004517          	auipc	a0,0x4
    80004af0:	87450513          	addi	a0,a0,-1932 # 80008360 <CONSOLE_STATUS+0x350>
    80004af4:	00000097          	auipc	ra,0x0
    80004af8:	918080e7          	jalr	-1768(ra) # 8000440c <_Z11printStringPKc>
    int test = getc() - '0';
    80004afc:	ffffd097          	auipc	ra,0xffffd
    80004b00:	a7c080e7          	jalr	-1412(ra) # 80001578 <_Z4getcv>
    80004b04:	00050913          	mv	s2,a0
    80004b08:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80004b0c:	ffffd097          	auipc	ra,0xffffd
    80004b10:	a6c080e7          	jalr	-1428(ra) # 80001578 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    80004b14:	fcb9091b          	addiw	s2,s2,-53
    80004b18:	00100793          	li	a5,1
    80004b1c:	0327f463          	bgeu	a5,s2,80004b44 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80004b20:	00700793          	li	a5,7
    80004b24:	0e97e263          	bltu	a5,s1,80004c08 <_Z8userMainv+0x134>
    80004b28:	00249493          	slli	s1,s1,0x2
    80004b2c:	00004717          	auipc	a4,0x4
    80004b30:	a4c70713          	addi	a4,a4,-1460 # 80008578 <CONSOLE_STATUS+0x568>
    80004b34:	00e484b3          	add	s1,s1,a4
    80004b38:	0004a783          	lw	a5,0(s1)
    80004b3c:	00e787b3          	add	a5,a5,a4
    80004b40:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    80004b44:	00004517          	auipc	a0,0x4
    80004b48:	83c50513          	addi	a0,a0,-1988 # 80008380 <CONSOLE_STATUS+0x370>
    80004b4c:	00000097          	auipc	ra,0x0
    80004b50:	8c0080e7          	jalr	-1856(ra) # 8000440c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80004b54:	01813083          	ld	ra,24(sp)
    80004b58:	01013403          	ld	s0,16(sp)
    80004b5c:	00813483          	ld	s1,8(sp)
    80004b60:	00013903          	ld	s2,0(sp)
    80004b64:	02010113          	addi	sp,sp,32
    80004b68:	00008067          	ret
            Threads_C_API_test();
    80004b6c:	fffff097          	auipc	ra,0xfffff
    80004b70:	f18080e7          	jalr	-232(ra) # 80003a84 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80004b74:	00004517          	auipc	a0,0x4
    80004b78:	83c50513          	addi	a0,a0,-1988 # 800083b0 <CONSOLE_STATUS+0x3a0>
    80004b7c:	00000097          	auipc	ra,0x0
    80004b80:	890080e7          	jalr	-1904(ra) # 8000440c <_Z11printStringPKc>
            break;
    80004b84:	fd1ff06f          	j	80004b54 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    80004b88:	ffffe097          	auipc	ra,0xffffe
    80004b8c:	560080e7          	jalr	1376(ra) # 800030e8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80004b90:	00004517          	auipc	a0,0x4
    80004b94:	86050513          	addi	a0,a0,-1952 # 800083f0 <CONSOLE_STATUS+0x3e0>
    80004b98:	00000097          	auipc	ra,0x0
    80004b9c:	874080e7          	jalr	-1932(ra) # 8000440c <_Z11printStringPKc>
            break;
    80004ba0:	fb5ff06f          	j	80004b54 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    80004ba4:	ffffe097          	auipc	ra,0xffffe
    80004ba8:	d98080e7          	jalr	-616(ra) # 8000293c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80004bac:	00004517          	auipc	a0,0x4
    80004bb0:	88450513          	addi	a0,a0,-1916 # 80008430 <CONSOLE_STATUS+0x420>
    80004bb4:	00000097          	auipc	ra,0x0
    80004bb8:	858080e7          	jalr	-1960(ra) # 8000440c <_Z11printStringPKc>
            break;
    80004bbc:	f99ff06f          	j	80004b54 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    80004bc0:	fffff097          	auipc	ra,0xfffff
    80004bc4:	208080e7          	jalr	520(ra) # 80003dc8 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80004bc8:	00004517          	auipc	a0,0x4
    80004bcc:	8b850513          	addi	a0,a0,-1864 # 80008480 <CONSOLE_STATUS+0x470>
    80004bd0:	00000097          	auipc	ra,0x0
    80004bd4:	83c080e7          	jalr	-1988(ra) # 8000440c <_Z11printStringPKc>
            break;
    80004bd8:	f7dff06f          	j	80004b54 <_Z8userMainv+0x80>
            System_Mode_test();
    80004bdc:	00000097          	auipc	ra,0x0
    80004be0:	52c080e7          	jalr	1324(ra) # 80005108 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80004be4:	00004517          	auipc	a0,0x4
    80004be8:	8f450513          	addi	a0,a0,-1804 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80004bec:	00000097          	auipc	ra,0x0
    80004bf0:	820080e7          	jalr	-2016(ra) # 8000440c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80004bf4:	00004517          	auipc	a0,0x4
    80004bf8:	90450513          	addi	a0,a0,-1788 # 800084f8 <CONSOLE_STATUS+0x4e8>
    80004bfc:	00000097          	auipc	ra,0x0
    80004c00:	810080e7          	jalr	-2032(ra) # 8000440c <_Z11printStringPKc>
            break;
    80004c04:	f51ff06f          	j	80004b54 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    80004c08:	00004517          	auipc	a0,0x4
    80004c0c:	94850513          	addi	a0,a0,-1720 # 80008550 <CONSOLE_STATUS+0x540>
    80004c10:	fffff097          	auipc	ra,0xfffff
    80004c14:	7fc080e7          	jalr	2044(ra) # 8000440c <_Z11printStringPKc>
    80004c18:	f3dff06f          	j	80004b54 <_Z8userMainv+0x80>

0000000080004c1c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004c1c:	fe010113          	addi	sp,sp,-32
    80004c20:	00113c23          	sd	ra,24(sp)
    80004c24:	00813823          	sd	s0,16(sp)
    80004c28:	00913423          	sd	s1,8(sp)
    80004c2c:	01213023          	sd	s2,0(sp)
    80004c30:	02010413          	addi	s0,sp,32
    80004c34:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004c38:	00100793          	li	a5,1
    80004c3c:	02a7f863          	bgeu	a5,a0,80004c6c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004c40:	00a00793          	li	a5,10
    80004c44:	02f577b3          	remu	a5,a0,a5
    80004c48:	02078e63          	beqz	a5,80004c84 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004c4c:	fff48513          	addi	a0,s1,-1
    80004c50:	00000097          	auipc	ra,0x0
    80004c54:	fcc080e7          	jalr	-52(ra) # 80004c1c <_ZL9fibonaccim>
    80004c58:	00050913          	mv	s2,a0
    80004c5c:	ffe48513          	addi	a0,s1,-2
    80004c60:	00000097          	auipc	ra,0x0
    80004c64:	fbc080e7          	jalr	-68(ra) # 80004c1c <_ZL9fibonaccim>
    80004c68:	00a90533          	add	a0,s2,a0
}
    80004c6c:	01813083          	ld	ra,24(sp)
    80004c70:	01013403          	ld	s0,16(sp)
    80004c74:	00813483          	ld	s1,8(sp)
    80004c78:	00013903          	ld	s2,0(sp)
    80004c7c:	02010113          	addi	sp,sp,32
    80004c80:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004c84:	ffffc097          	auipc	ra,0xffffc
    80004c88:	738080e7          	jalr	1848(ra) # 800013bc <_Z15thread_dispatchv>
    80004c8c:	fc1ff06f          	j	80004c4c <_ZL9fibonaccim+0x30>

0000000080004c90 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004c90:	fe010113          	addi	sp,sp,-32
    80004c94:	00113c23          	sd	ra,24(sp)
    80004c98:	00813823          	sd	s0,16(sp)
    80004c9c:	00913423          	sd	s1,8(sp)
    80004ca0:	01213023          	sd	s2,0(sp)
    80004ca4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004ca8:	00a00493          	li	s1,10
    80004cac:	0400006f          	j	80004cec <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cb0:	00003517          	auipc	a0,0x3
    80004cb4:	60050513          	addi	a0,a0,1536 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80004cb8:	fffff097          	auipc	ra,0xfffff
    80004cbc:	754080e7          	jalr	1876(ra) # 8000440c <_Z11printStringPKc>
    80004cc0:	00000613          	li	a2,0
    80004cc4:	00a00593          	li	a1,10
    80004cc8:	00048513          	mv	a0,s1
    80004ccc:	00000097          	auipc	ra,0x0
    80004cd0:	8f0080e7          	jalr	-1808(ra) # 800045bc <_Z8printIntiii>
    80004cd4:	00003517          	auipc	a0,0x3
    80004cd8:	7fc50513          	addi	a0,a0,2044 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004cdc:	fffff097          	auipc	ra,0xfffff
    80004ce0:	730080e7          	jalr	1840(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004ce4:	0014849b          	addiw	s1,s1,1
    80004ce8:	0ff4f493          	andi	s1,s1,255
    80004cec:	00c00793          	li	a5,12
    80004cf0:	fc97f0e3          	bgeu	a5,s1,80004cb0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004cf4:	00003517          	auipc	a0,0x3
    80004cf8:	5c450513          	addi	a0,a0,1476 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80004cfc:	fffff097          	auipc	ra,0xfffff
    80004d00:	710080e7          	jalr	1808(ra) # 8000440c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004d04:	00500313          	li	t1,5
    thread_dispatch();
    80004d08:	ffffc097          	auipc	ra,0xffffc
    80004d0c:	6b4080e7          	jalr	1716(ra) # 800013bc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004d10:	01000513          	li	a0,16
    80004d14:	00000097          	auipc	ra,0x0
    80004d18:	f08080e7          	jalr	-248(ra) # 80004c1c <_ZL9fibonaccim>
    80004d1c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004d20:	00003517          	auipc	a0,0x3
    80004d24:	5a850513          	addi	a0,a0,1448 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80004d28:	fffff097          	auipc	ra,0xfffff
    80004d2c:	6e4080e7          	jalr	1764(ra) # 8000440c <_Z11printStringPKc>
    80004d30:	00000613          	li	a2,0
    80004d34:	00a00593          	li	a1,10
    80004d38:	0009051b          	sext.w	a0,s2
    80004d3c:	00000097          	auipc	ra,0x0
    80004d40:	880080e7          	jalr	-1920(ra) # 800045bc <_Z8printIntiii>
    80004d44:	00003517          	auipc	a0,0x3
    80004d48:	78c50513          	addi	a0,a0,1932 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004d4c:	fffff097          	auipc	ra,0xfffff
    80004d50:	6c0080e7          	jalr	1728(ra) # 8000440c <_Z11printStringPKc>
    80004d54:	0400006f          	j	80004d94 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d58:	00003517          	auipc	a0,0x3
    80004d5c:	55850513          	addi	a0,a0,1368 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80004d60:	fffff097          	auipc	ra,0xfffff
    80004d64:	6ac080e7          	jalr	1708(ra) # 8000440c <_Z11printStringPKc>
    80004d68:	00000613          	li	a2,0
    80004d6c:	00a00593          	li	a1,10
    80004d70:	00048513          	mv	a0,s1
    80004d74:	00000097          	auipc	ra,0x0
    80004d78:	848080e7          	jalr	-1976(ra) # 800045bc <_Z8printIntiii>
    80004d7c:	00003517          	auipc	a0,0x3
    80004d80:	75450513          	addi	a0,a0,1876 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004d84:	fffff097          	auipc	ra,0xfffff
    80004d88:	688080e7          	jalr	1672(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d8c:	0014849b          	addiw	s1,s1,1
    80004d90:	0ff4f493          	andi	s1,s1,255
    80004d94:	00f00793          	li	a5,15
    80004d98:	fc97f0e3          	bgeu	a5,s1,80004d58 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004d9c:	00003517          	auipc	a0,0x3
    80004da0:	53c50513          	addi	a0,a0,1340 # 800082d8 <CONSOLE_STATUS+0x2c8>
    80004da4:	fffff097          	auipc	ra,0xfffff
    80004da8:	668080e7          	jalr	1640(ra) # 8000440c <_Z11printStringPKc>
    finishedD = true;
    80004dac:	00100793          	li	a5,1
    80004db0:	00005717          	auipc	a4,0x5
    80004db4:	58f70023          	sb	a5,1408(a4) # 8000a330 <_ZL9finishedD>
    thread_dispatch();
    80004db8:	ffffc097          	auipc	ra,0xffffc
    80004dbc:	604080e7          	jalr	1540(ra) # 800013bc <_Z15thread_dispatchv>
}
    80004dc0:	01813083          	ld	ra,24(sp)
    80004dc4:	01013403          	ld	s0,16(sp)
    80004dc8:	00813483          	ld	s1,8(sp)
    80004dcc:	00013903          	ld	s2,0(sp)
    80004dd0:	02010113          	addi	sp,sp,32
    80004dd4:	00008067          	ret

0000000080004dd8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004dd8:	fe010113          	addi	sp,sp,-32
    80004ddc:	00113c23          	sd	ra,24(sp)
    80004de0:	00813823          	sd	s0,16(sp)
    80004de4:	00913423          	sd	s1,8(sp)
    80004de8:	01213023          	sd	s2,0(sp)
    80004dec:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004df0:	00000493          	li	s1,0
    80004df4:	0400006f          	j	80004e34 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004df8:	00003517          	auipc	a0,0x3
    80004dfc:	48850513          	addi	a0,a0,1160 # 80008280 <CONSOLE_STATUS+0x270>
    80004e00:	fffff097          	auipc	ra,0xfffff
    80004e04:	60c080e7          	jalr	1548(ra) # 8000440c <_Z11printStringPKc>
    80004e08:	00000613          	li	a2,0
    80004e0c:	00a00593          	li	a1,10
    80004e10:	00048513          	mv	a0,s1
    80004e14:	fffff097          	auipc	ra,0xfffff
    80004e18:	7a8080e7          	jalr	1960(ra) # 800045bc <_Z8printIntiii>
    80004e1c:	00003517          	auipc	a0,0x3
    80004e20:	6b450513          	addi	a0,a0,1716 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004e24:	fffff097          	auipc	ra,0xfffff
    80004e28:	5e8080e7          	jalr	1512(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004e2c:	0014849b          	addiw	s1,s1,1
    80004e30:	0ff4f493          	andi	s1,s1,255
    80004e34:	00200793          	li	a5,2
    80004e38:	fc97f0e3          	bgeu	a5,s1,80004df8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004e3c:	00003517          	auipc	a0,0x3
    80004e40:	44c50513          	addi	a0,a0,1100 # 80008288 <CONSOLE_STATUS+0x278>
    80004e44:	fffff097          	auipc	ra,0xfffff
    80004e48:	5c8080e7          	jalr	1480(ra) # 8000440c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004e4c:	00700313          	li	t1,7
    thread_dispatch();
    80004e50:	ffffc097          	auipc	ra,0xffffc
    80004e54:	56c080e7          	jalr	1388(ra) # 800013bc <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004e58:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004e5c:	00003517          	auipc	a0,0x3
    80004e60:	43c50513          	addi	a0,a0,1084 # 80008298 <CONSOLE_STATUS+0x288>
    80004e64:	fffff097          	auipc	ra,0xfffff
    80004e68:	5a8080e7          	jalr	1448(ra) # 8000440c <_Z11printStringPKc>
    80004e6c:	00000613          	li	a2,0
    80004e70:	00a00593          	li	a1,10
    80004e74:	0009051b          	sext.w	a0,s2
    80004e78:	fffff097          	auipc	ra,0xfffff
    80004e7c:	744080e7          	jalr	1860(ra) # 800045bc <_Z8printIntiii>
    80004e80:	00003517          	auipc	a0,0x3
    80004e84:	65050513          	addi	a0,a0,1616 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004e88:	fffff097          	auipc	ra,0xfffff
    80004e8c:	584080e7          	jalr	1412(ra) # 8000440c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004e90:	00c00513          	li	a0,12
    80004e94:	00000097          	auipc	ra,0x0
    80004e98:	d88080e7          	jalr	-632(ra) # 80004c1c <_ZL9fibonaccim>
    80004e9c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004ea0:	00003517          	auipc	a0,0x3
    80004ea4:	40050513          	addi	a0,a0,1024 # 800082a0 <CONSOLE_STATUS+0x290>
    80004ea8:	fffff097          	auipc	ra,0xfffff
    80004eac:	564080e7          	jalr	1380(ra) # 8000440c <_Z11printStringPKc>
    80004eb0:	00000613          	li	a2,0
    80004eb4:	00a00593          	li	a1,10
    80004eb8:	0009051b          	sext.w	a0,s2
    80004ebc:	fffff097          	auipc	ra,0xfffff
    80004ec0:	700080e7          	jalr	1792(ra) # 800045bc <_Z8printIntiii>
    80004ec4:	00003517          	auipc	a0,0x3
    80004ec8:	60c50513          	addi	a0,a0,1548 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004ecc:	fffff097          	auipc	ra,0xfffff
    80004ed0:	540080e7          	jalr	1344(ra) # 8000440c <_Z11printStringPKc>
    80004ed4:	0400006f          	j	80004f14 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004ed8:	00003517          	auipc	a0,0x3
    80004edc:	3a850513          	addi	a0,a0,936 # 80008280 <CONSOLE_STATUS+0x270>
    80004ee0:	fffff097          	auipc	ra,0xfffff
    80004ee4:	52c080e7          	jalr	1324(ra) # 8000440c <_Z11printStringPKc>
    80004ee8:	00000613          	li	a2,0
    80004eec:	00a00593          	li	a1,10
    80004ef0:	00048513          	mv	a0,s1
    80004ef4:	fffff097          	auipc	ra,0xfffff
    80004ef8:	6c8080e7          	jalr	1736(ra) # 800045bc <_Z8printIntiii>
    80004efc:	00003517          	auipc	a0,0x3
    80004f00:	5d450513          	addi	a0,a0,1492 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004f04:	fffff097          	auipc	ra,0xfffff
    80004f08:	508080e7          	jalr	1288(ra) # 8000440c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004f0c:	0014849b          	addiw	s1,s1,1
    80004f10:	0ff4f493          	andi	s1,s1,255
    80004f14:	00500793          	li	a5,5
    80004f18:	fc97f0e3          	bgeu	a5,s1,80004ed8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004f1c:	00003517          	auipc	a0,0x3
    80004f20:	33c50513          	addi	a0,a0,828 # 80008258 <CONSOLE_STATUS+0x248>
    80004f24:	fffff097          	auipc	ra,0xfffff
    80004f28:	4e8080e7          	jalr	1256(ra) # 8000440c <_Z11printStringPKc>
    finishedC = true;
    80004f2c:	00100793          	li	a5,1
    80004f30:	00005717          	auipc	a4,0x5
    80004f34:	40f700a3          	sb	a5,1025(a4) # 8000a331 <_ZL9finishedC>
    thread_dispatch();
    80004f38:	ffffc097          	auipc	ra,0xffffc
    80004f3c:	484080e7          	jalr	1156(ra) # 800013bc <_Z15thread_dispatchv>
}
    80004f40:	01813083          	ld	ra,24(sp)
    80004f44:	01013403          	ld	s0,16(sp)
    80004f48:	00813483          	ld	s1,8(sp)
    80004f4c:	00013903          	ld	s2,0(sp)
    80004f50:	02010113          	addi	sp,sp,32
    80004f54:	00008067          	ret

0000000080004f58 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004f58:	fe010113          	addi	sp,sp,-32
    80004f5c:	00113c23          	sd	ra,24(sp)
    80004f60:	00813823          	sd	s0,16(sp)
    80004f64:	00913423          	sd	s1,8(sp)
    80004f68:	01213023          	sd	s2,0(sp)
    80004f6c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004f70:	00000913          	li	s2,0
    80004f74:	0400006f          	j	80004fb4 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80004f78:	ffffc097          	auipc	ra,0xffffc
    80004f7c:	444080e7          	jalr	1092(ra) # 800013bc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f80:	00148493          	addi	s1,s1,1
    80004f84:	000027b7          	lui	a5,0x2
    80004f88:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f8c:	0097ee63          	bltu	a5,s1,80004fa8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f90:	00000713          	li	a4,0
    80004f94:	000077b7          	lui	a5,0x7
    80004f98:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004f9c:	fce7eee3          	bltu	a5,a4,80004f78 <_ZL11workerBodyBPv+0x20>
    80004fa0:	00170713          	addi	a4,a4,1
    80004fa4:	ff1ff06f          	j	80004f94 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80004fa8:	00a00793          	li	a5,10
    80004fac:	04f90663          	beq	s2,a5,80004ff8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80004fb0:	00190913          	addi	s2,s2,1
    80004fb4:	00f00793          	li	a5,15
    80004fb8:	0527e463          	bltu	a5,s2,80005000 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80004fbc:	00003517          	auipc	a0,0x3
    80004fc0:	2ac50513          	addi	a0,a0,684 # 80008268 <CONSOLE_STATUS+0x258>
    80004fc4:	fffff097          	auipc	ra,0xfffff
    80004fc8:	448080e7          	jalr	1096(ra) # 8000440c <_Z11printStringPKc>
    80004fcc:	00000613          	li	a2,0
    80004fd0:	00a00593          	li	a1,10
    80004fd4:	0009051b          	sext.w	a0,s2
    80004fd8:	fffff097          	auipc	ra,0xfffff
    80004fdc:	5e4080e7          	jalr	1508(ra) # 800045bc <_Z8printIntiii>
    80004fe0:	00003517          	auipc	a0,0x3
    80004fe4:	4f050513          	addi	a0,a0,1264 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004fe8:	fffff097          	auipc	ra,0xfffff
    80004fec:	424080e7          	jalr	1060(ra) # 8000440c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004ff0:	00000493          	li	s1,0
    80004ff4:	f91ff06f          	j	80004f84 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80004ff8:	14102ff3          	csrr	t6,sepc
    80004ffc:	fb5ff06f          	j	80004fb0 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005000:	00003517          	auipc	a0,0x3
    80005004:	27050513          	addi	a0,a0,624 # 80008270 <CONSOLE_STATUS+0x260>
    80005008:	fffff097          	auipc	ra,0xfffff
    8000500c:	404080e7          	jalr	1028(ra) # 8000440c <_Z11printStringPKc>
    finishedB = true;
    80005010:	00100793          	li	a5,1
    80005014:	00005717          	auipc	a4,0x5
    80005018:	30f70f23          	sb	a5,798(a4) # 8000a332 <_ZL9finishedB>
    thread_dispatch();
    8000501c:	ffffc097          	auipc	ra,0xffffc
    80005020:	3a0080e7          	jalr	928(ra) # 800013bc <_Z15thread_dispatchv>
}
    80005024:	01813083          	ld	ra,24(sp)
    80005028:	01013403          	ld	s0,16(sp)
    8000502c:	00813483          	ld	s1,8(sp)
    80005030:	00013903          	ld	s2,0(sp)
    80005034:	02010113          	addi	sp,sp,32
    80005038:	00008067          	ret

000000008000503c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000503c:	fe010113          	addi	sp,sp,-32
    80005040:	00113c23          	sd	ra,24(sp)
    80005044:	00813823          	sd	s0,16(sp)
    80005048:	00913423          	sd	s1,8(sp)
    8000504c:	01213023          	sd	s2,0(sp)
    80005050:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005054:	00000913          	li	s2,0
    80005058:	0380006f          	j	80005090 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000505c:	ffffc097          	auipc	ra,0xffffc
    80005060:	360080e7          	jalr	864(ra) # 800013bc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005064:	00148493          	addi	s1,s1,1
    80005068:	000027b7          	lui	a5,0x2
    8000506c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005070:	0097ee63          	bltu	a5,s1,8000508c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005074:	00000713          	li	a4,0
    80005078:	000077b7          	lui	a5,0x7
    8000507c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005080:	fce7eee3          	bltu	a5,a4,8000505c <_ZL11workerBodyAPv+0x20>
    80005084:	00170713          	addi	a4,a4,1
    80005088:	ff1ff06f          	j	80005078 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000508c:	00190913          	addi	s2,s2,1
    80005090:	00900793          	li	a5,9
    80005094:	0527e063          	bltu	a5,s2,800050d4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005098:	00003517          	auipc	a0,0x3
    8000509c:	1b850513          	addi	a0,a0,440 # 80008250 <CONSOLE_STATUS+0x240>
    800050a0:	fffff097          	auipc	ra,0xfffff
    800050a4:	36c080e7          	jalr	876(ra) # 8000440c <_Z11printStringPKc>
    800050a8:	00000613          	li	a2,0
    800050ac:	00a00593          	li	a1,10
    800050b0:	0009051b          	sext.w	a0,s2
    800050b4:	fffff097          	auipc	ra,0xfffff
    800050b8:	508080e7          	jalr	1288(ra) # 800045bc <_Z8printIntiii>
    800050bc:	00003517          	auipc	a0,0x3
    800050c0:	41450513          	addi	a0,a0,1044 # 800084d0 <CONSOLE_STATUS+0x4c0>
    800050c4:	fffff097          	auipc	ra,0xfffff
    800050c8:	348080e7          	jalr	840(ra) # 8000440c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800050cc:	00000493          	li	s1,0
    800050d0:	f99ff06f          	j	80005068 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800050d4:	00003517          	auipc	a0,0x3
    800050d8:	18450513          	addi	a0,a0,388 # 80008258 <CONSOLE_STATUS+0x248>
    800050dc:	fffff097          	auipc	ra,0xfffff
    800050e0:	330080e7          	jalr	816(ra) # 8000440c <_Z11printStringPKc>
    finishedA = true;
    800050e4:	00100793          	li	a5,1
    800050e8:	00005717          	auipc	a4,0x5
    800050ec:	24f705a3          	sb	a5,587(a4) # 8000a333 <_ZL9finishedA>
}
    800050f0:	01813083          	ld	ra,24(sp)
    800050f4:	01013403          	ld	s0,16(sp)
    800050f8:	00813483          	ld	s1,8(sp)
    800050fc:	00013903          	ld	s2,0(sp)
    80005100:	02010113          	addi	sp,sp,32
    80005104:	00008067          	ret

0000000080005108 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005108:	fd010113          	addi	sp,sp,-48
    8000510c:	02113423          	sd	ra,40(sp)
    80005110:	02813023          	sd	s0,32(sp)
    80005114:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005118:	00000613          	li	a2,0
    8000511c:	00000597          	auipc	a1,0x0
    80005120:	f2058593          	addi	a1,a1,-224 # 8000503c <_ZL11workerBodyAPv>
    80005124:	fd040513          	addi	a0,s0,-48
    80005128:	ffffc097          	auipc	ra,0xffffc
    8000512c:	1e4080e7          	jalr	484(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80005130:	00003517          	auipc	a0,0x3
    80005134:	1b850513          	addi	a0,a0,440 # 800082e8 <CONSOLE_STATUS+0x2d8>
    80005138:	fffff097          	auipc	ra,0xfffff
    8000513c:	2d4080e7          	jalr	724(ra) # 8000440c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005140:	00000613          	li	a2,0
    80005144:	00000597          	auipc	a1,0x0
    80005148:	e1458593          	addi	a1,a1,-492 # 80004f58 <_ZL11workerBodyBPv>
    8000514c:	fd840513          	addi	a0,s0,-40
    80005150:	ffffc097          	auipc	ra,0xffffc
    80005154:	1bc080e7          	jalr	444(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80005158:	00003517          	auipc	a0,0x3
    8000515c:	1a850513          	addi	a0,a0,424 # 80008300 <CONSOLE_STATUS+0x2f0>
    80005160:	fffff097          	auipc	ra,0xfffff
    80005164:	2ac080e7          	jalr	684(ra) # 8000440c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005168:	00000613          	li	a2,0
    8000516c:	00000597          	auipc	a1,0x0
    80005170:	c6c58593          	addi	a1,a1,-916 # 80004dd8 <_ZL11workerBodyCPv>
    80005174:	fe040513          	addi	a0,s0,-32
    80005178:	ffffc097          	auipc	ra,0xffffc
    8000517c:	194080e7          	jalr	404(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80005180:	00003517          	auipc	a0,0x3
    80005184:	19850513          	addi	a0,a0,408 # 80008318 <CONSOLE_STATUS+0x308>
    80005188:	fffff097          	auipc	ra,0xfffff
    8000518c:	284080e7          	jalr	644(ra) # 8000440c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005190:	00000613          	li	a2,0
    80005194:	00000597          	auipc	a1,0x0
    80005198:	afc58593          	addi	a1,a1,-1284 # 80004c90 <_ZL11workerBodyDPv>
    8000519c:	fe840513          	addi	a0,s0,-24
    800051a0:	ffffc097          	auipc	ra,0xffffc
    800051a4:	16c080e7          	jalr	364(ra) # 8000130c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    800051a8:	00003517          	auipc	a0,0x3
    800051ac:	18850513          	addi	a0,a0,392 # 80008330 <CONSOLE_STATUS+0x320>
    800051b0:	fffff097          	auipc	ra,0xfffff
    800051b4:	25c080e7          	jalr	604(ra) # 8000440c <_Z11printStringPKc>
    800051b8:	00c0006f          	j	800051c4 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800051bc:	ffffc097          	auipc	ra,0xffffc
    800051c0:	200080e7          	jalr	512(ra) # 800013bc <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800051c4:	00005797          	auipc	a5,0x5
    800051c8:	16f7c783          	lbu	a5,367(a5) # 8000a333 <_ZL9finishedA>
    800051cc:	fe0788e3          	beqz	a5,800051bc <_Z16System_Mode_testv+0xb4>
    800051d0:	00005797          	auipc	a5,0x5
    800051d4:	1627c783          	lbu	a5,354(a5) # 8000a332 <_ZL9finishedB>
    800051d8:	fe0782e3          	beqz	a5,800051bc <_Z16System_Mode_testv+0xb4>
    800051dc:	00005797          	auipc	a5,0x5
    800051e0:	1557c783          	lbu	a5,341(a5) # 8000a331 <_ZL9finishedC>
    800051e4:	fc078ce3          	beqz	a5,800051bc <_Z16System_Mode_testv+0xb4>
    800051e8:	00005797          	auipc	a5,0x5
    800051ec:	1487c783          	lbu	a5,328(a5) # 8000a330 <_ZL9finishedD>
    800051f0:	fc0786e3          	beqz	a5,800051bc <_Z16System_Mode_testv+0xb4>
    }

}
    800051f4:	02813083          	ld	ra,40(sp)
    800051f8:	02013403          	ld	s0,32(sp)
    800051fc:	03010113          	addi	sp,sp,48
    80005200:	00008067          	ret

0000000080005204 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005204:	fe010113          	addi	sp,sp,-32
    80005208:	00113c23          	sd	ra,24(sp)
    8000520c:	00813823          	sd	s0,16(sp)
    80005210:	00913423          	sd	s1,8(sp)
    80005214:	01213023          	sd	s2,0(sp)
    80005218:	02010413          	addi	s0,sp,32
    8000521c:	00050493          	mv	s1,a0
    80005220:	00058913          	mv	s2,a1
    80005224:	0015879b          	addiw	a5,a1,1
    80005228:	0007851b          	sext.w	a0,a5
    8000522c:	00f4a023          	sw	a5,0(s1)
    80005230:	0004a823          	sw	zero,16(s1)
    80005234:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005238:	00251513          	slli	a0,a0,0x2
    8000523c:	ffffc097          	auipc	ra,0xffffc
    80005240:	040080e7          	jalr	64(ra) # 8000127c <_Z9mem_allocm>
    80005244:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005248:	00000593          	li	a1,0
    8000524c:	02048513          	addi	a0,s1,32
    80005250:	ffffc097          	auipc	ra,0xffffc
    80005254:	1a8080e7          	jalr	424(ra) # 800013f8 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80005258:	00090593          	mv	a1,s2
    8000525c:	01848513          	addi	a0,s1,24
    80005260:	ffffc097          	auipc	ra,0xffffc
    80005264:	198080e7          	jalr	408(ra) # 800013f8 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80005268:	00100593          	li	a1,1
    8000526c:	02848513          	addi	a0,s1,40
    80005270:	ffffc097          	auipc	ra,0xffffc
    80005274:	188080e7          	jalr	392(ra) # 800013f8 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80005278:	00100593          	li	a1,1
    8000527c:	03048513          	addi	a0,s1,48
    80005280:	ffffc097          	auipc	ra,0xffffc
    80005284:	178080e7          	jalr	376(ra) # 800013f8 <_Z8sem_openPP4_semj>
}
    80005288:	01813083          	ld	ra,24(sp)
    8000528c:	01013403          	ld	s0,16(sp)
    80005290:	00813483          	ld	s1,8(sp)
    80005294:	00013903          	ld	s2,0(sp)
    80005298:	02010113          	addi	sp,sp,32
    8000529c:	00008067          	ret

00000000800052a0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800052a0:	fe010113          	addi	sp,sp,-32
    800052a4:	00113c23          	sd	ra,24(sp)
    800052a8:	00813823          	sd	s0,16(sp)
    800052ac:	00913423          	sd	s1,8(sp)
    800052b0:	01213023          	sd	s2,0(sp)
    800052b4:	02010413          	addi	s0,sp,32
    800052b8:	00050493          	mv	s1,a0
    800052bc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800052c0:	01853503          	ld	a0,24(a0)
    800052c4:	ffffc097          	auipc	ra,0xffffc
    800052c8:	1b8080e7          	jalr	440(ra) # 8000147c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800052cc:	0304b503          	ld	a0,48(s1)
    800052d0:	ffffc097          	auipc	ra,0xffffc
    800052d4:	1ac080e7          	jalr	428(ra) # 8000147c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800052d8:	0084b783          	ld	a5,8(s1)
    800052dc:	0144a703          	lw	a4,20(s1)
    800052e0:	00271713          	slli	a4,a4,0x2
    800052e4:	00e787b3          	add	a5,a5,a4
    800052e8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800052ec:	0144a783          	lw	a5,20(s1)
    800052f0:	0017879b          	addiw	a5,a5,1
    800052f4:	0004a703          	lw	a4,0(s1)
    800052f8:	02e7e7bb          	remw	a5,a5,a4
    800052fc:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005300:	0304b503          	ld	a0,48(s1)
    80005304:	ffffc097          	auipc	ra,0xffffc
    80005308:	1b8080e7          	jalr	440(ra) # 800014bc <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    8000530c:	0204b503          	ld	a0,32(s1)
    80005310:	ffffc097          	auipc	ra,0xffffc
    80005314:	1ac080e7          	jalr	428(ra) # 800014bc <_Z10sem_signalP4_sem>

}
    80005318:	01813083          	ld	ra,24(sp)
    8000531c:	01013403          	ld	s0,16(sp)
    80005320:	00813483          	ld	s1,8(sp)
    80005324:	00013903          	ld	s2,0(sp)
    80005328:	02010113          	addi	sp,sp,32
    8000532c:	00008067          	ret

0000000080005330 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005330:	fe010113          	addi	sp,sp,-32
    80005334:	00113c23          	sd	ra,24(sp)
    80005338:	00813823          	sd	s0,16(sp)
    8000533c:	00913423          	sd	s1,8(sp)
    80005340:	01213023          	sd	s2,0(sp)
    80005344:	02010413          	addi	s0,sp,32
    80005348:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000534c:	02053503          	ld	a0,32(a0)
    80005350:	ffffc097          	auipc	ra,0xffffc
    80005354:	12c080e7          	jalr	300(ra) # 8000147c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80005358:	0284b503          	ld	a0,40(s1)
    8000535c:	ffffc097          	auipc	ra,0xffffc
    80005360:	120080e7          	jalr	288(ra) # 8000147c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80005364:	0084b703          	ld	a4,8(s1)
    80005368:	0104a783          	lw	a5,16(s1)
    8000536c:	00279693          	slli	a3,a5,0x2
    80005370:	00d70733          	add	a4,a4,a3
    80005374:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005378:	0017879b          	addiw	a5,a5,1
    8000537c:	0004a703          	lw	a4,0(s1)
    80005380:	02e7e7bb          	remw	a5,a5,a4
    80005384:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005388:	0284b503          	ld	a0,40(s1)
    8000538c:	ffffc097          	auipc	ra,0xffffc
    80005390:	130080e7          	jalr	304(ra) # 800014bc <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80005394:	0184b503          	ld	a0,24(s1)
    80005398:	ffffc097          	auipc	ra,0xffffc
    8000539c:	124080e7          	jalr	292(ra) # 800014bc <_Z10sem_signalP4_sem>

    return ret;
}
    800053a0:	00090513          	mv	a0,s2
    800053a4:	01813083          	ld	ra,24(sp)
    800053a8:	01013403          	ld	s0,16(sp)
    800053ac:	00813483          	ld	s1,8(sp)
    800053b0:	00013903          	ld	s2,0(sp)
    800053b4:	02010113          	addi	sp,sp,32
    800053b8:	00008067          	ret

00000000800053bc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800053bc:	fe010113          	addi	sp,sp,-32
    800053c0:	00113c23          	sd	ra,24(sp)
    800053c4:	00813823          	sd	s0,16(sp)
    800053c8:	00913423          	sd	s1,8(sp)
    800053cc:	01213023          	sd	s2,0(sp)
    800053d0:	02010413          	addi	s0,sp,32
    800053d4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800053d8:	02853503          	ld	a0,40(a0)
    800053dc:	ffffc097          	auipc	ra,0xffffc
    800053e0:	0a0080e7          	jalr	160(ra) # 8000147c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800053e4:	0304b503          	ld	a0,48(s1)
    800053e8:	ffffc097          	auipc	ra,0xffffc
    800053ec:	094080e7          	jalr	148(ra) # 8000147c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    800053f0:	0144a783          	lw	a5,20(s1)
    800053f4:	0104a903          	lw	s2,16(s1)
    800053f8:	0327ce63          	blt	a5,s2,80005434 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800053fc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005400:	0304b503          	ld	a0,48(s1)
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	0b8080e7          	jalr	184(ra) # 800014bc <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    8000540c:	0284b503          	ld	a0,40(s1)
    80005410:	ffffc097          	auipc	ra,0xffffc
    80005414:	0ac080e7          	jalr	172(ra) # 800014bc <_Z10sem_signalP4_sem>

    return ret;
}
    80005418:	00090513          	mv	a0,s2
    8000541c:	01813083          	ld	ra,24(sp)
    80005420:	01013403          	ld	s0,16(sp)
    80005424:	00813483          	ld	s1,8(sp)
    80005428:	00013903          	ld	s2,0(sp)
    8000542c:	02010113          	addi	sp,sp,32
    80005430:	00008067          	ret
        ret = cap - head + tail;
    80005434:	0004a703          	lw	a4,0(s1)
    80005438:	4127093b          	subw	s2,a4,s2
    8000543c:	00f9093b          	addw	s2,s2,a5
    80005440:	fc1ff06f          	j	80005400 <_ZN6Buffer6getCntEv+0x44>

0000000080005444 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80005444:	fe010113          	addi	sp,sp,-32
    80005448:	00113c23          	sd	ra,24(sp)
    8000544c:	00813823          	sd	s0,16(sp)
    80005450:	00913423          	sd	s1,8(sp)
    80005454:	02010413          	addi	s0,sp,32
    80005458:	00050493          	mv	s1,a0
    putc('\n');
    8000545c:	00a00513          	li	a0,10
    80005460:	ffffc097          	auipc	ra,0xffffc
    80005464:	0dc080e7          	jalr	220(ra) # 8000153c <_Z4putcc>
    printString("Buffer deleted!\n");
    80005468:	00003517          	auipc	a0,0x3
    8000546c:	ee050513          	addi	a0,a0,-288 # 80008348 <CONSOLE_STATUS+0x338>
    80005470:	fffff097          	auipc	ra,0xfffff
    80005474:	f9c080e7          	jalr	-100(ra) # 8000440c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005478:	00048513          	mv	a0,s1
    8000547c:	00000097          	auipc	ra,0x0
    80005480:	f40080e7          	jalr	-192(ra) # 800053bc <_ZN6Buffer6getCntEv>
    80005484:	02a05c63          	blez	a0,800054bc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005488:	0084b783          	ld	a5,8(s1)
    8000548c:	0104a703          	lw	a4,16(s1)
    80005490:	00271713          	slli	a4,a4,0x2
    80005494:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005498:	0007c503          	lbu	a0,0(a5)
    8000549c:	ffffc097          	auipc	ra,0xffffc
    800054a0:	0a0080e7          	jalr	160(ra) # 8000153c <_Z4putcc>
        head = (head + 1) % cap;
    800054a4:	0104a783          	lw	a5,16(s1)
    800054a8:	0017879b          	addiw	a5,a5,1
    800054ac:	0004a703          	lw	a4,0(s1)
    800054b0:	02e7e7bb          	remw	a5,a5,a4
    800054b4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800054b8:	fc1ff06f          	j	80005478 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800054bc:	02100513          	li	a0,33
    800054c0:	ffffc097          	auipc	ra,0xffffc
    800054c4:	07c080e7          	jalr	124(ra) # 8000153c <_Z4putcc>
    putc('\n');
    800054c8:	00a00513          	li	a0,10
    800054cc:	ffffc097          	auipc	ra,0xffffc
    800054d0:	070080e7          	jalr	112(ra) # 8000153c <_Z4putcc>
    mem_free(buffer);
    800054d4:	0084b503          	ld	a0,8(s1)
    800054d8:	ffffc097          	auipc	ra,0xffffc
    800054dc:	df4080e7          	jalr	-524(ra) # 800012cc <_Z8mem_freePv>
    sem_close(itemAvailable);
    800054e0:	0204b503          	ld	a0,32(s1)
    800054e4:	ffffc097          	auipc	ra,0xffffc
    800054e8:	f58080e7          	jalr	-168(ra) # 8000143c <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800054ec:	0184b503          	ld	a0,24(s1)
    800054f0:	ffffc097          	auipc	ra,0xffffc
    800054f4:	f4c080e7          	jalr	-180(ra) # 8000143c <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800054f8:	0304b503          	ld	a0,48(s1)
    800054fc:	ffffc097          	auipc	ra,0xffffc
    80005500:	f40080e7          	jalr	-192(ra) # 8000143c <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80005504:	0284b503          	ld	a0,40(s1)
    80005508:	ffffc097          	auipc	ra,0xffffc
    8000550c:	f34080e7          	jalr	-204(ra) # 8000143c <_Z9sem_closeP4_sem>
}
    80005510:	01813083          	ld	ra,24(sp)
    80005514:	01013403          	ld	s0,16(sp)
    80005518:	00813483          	ld	s1,8(sp)
    8000551c:	02010113          	addi	sp,sp,32
    80005520:	00008067          	ret

0000000080005524 <start>:
    80005524:	ff010113          	addi	sp,sp,-16
    80005528:	00813423          	sd	s0,8(sp)
    8000552c:	01010413          	addi	s0,sp,16
    80005530:	300027f3          	csrr	a5,mstatus
    80005534:	ffffe737          	lui	a4,0xffffe
    80005538:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff325f>
    8000553c:	00e7f7b3          	and	a5,a5,a4
    80005540:	00001737          	lui	a4,0x1
    80005544:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005548:	00e7e7b3          	or	a5,a5,a4
    8000554c:	30079073          	csrw	mstatus,a5
    80005550:	00000797          	auipc	a5,0x0
    80005554:	16078793          	addi	a5,a5,352 # 800056b0 <system_main>
    80005558:	34179073          	csrw	mepc,a5
    8000555c:	00000793          	li	a5,0
    80005560:	18079073          	csrw	satp,a5
    80005564:	000107b7          	lui	a5,0x10
    80005568:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000556c:	30279073          	csrw	medeleg,a5
    80005570:	30379073          	csrw	mideleg,a5
    80005574:	104027f3          	csrr	a5,sie
    80005578:	2227e793          	ori	a5,a5,546
    8000557c:	10479073          	csrw	sie,a5
    80005580:	fff00793          	li	a5,-1
    80005584:	00a7d793          	srli	a5,a5,0xa
    80005588:	3b079073          	csrw	pmpaddr0,a5
    8000558c:	00f00793          	li	a5,15
    80005590:	3a079073          	csrw	pmpcfg0,a5
    80005594:	f14027f3          	csrr	a5,mhartid
    80005598:	0200c737          	lui	a4,0x200c
    8000559c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800055a0:	0007869b          	sext.w	a3,a5
    800055a4:	00269713          	slli	a4,a3,0x2
    800055a8:	000f4637          	lui	a2,0xf4
    800055ac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800055b0:	00d70733          	add	a4,a4,a3
    800055b4:	0037979b          	slliw	a5,a5,0x3
    800055b8:	020046b7          	lui	a3,0x2004
    800055bc:	00d787b3          	add	a5,a5,a3
    800055c0:	00c585b3          	add	a1,a1,a2
    800055c4:	00371693          	slli	a3,a4,0x3
    800055c8:	00005717          	auipc	a4,0x5
    800055cc:	d7870713          	addi	a4,a4,-648 # 8000a340 <timer_scratch>
    800055d0:	00b7b023          	sd	a1,0(a5)
    800055d4:	00d70733          	add	a4,a4,a3
    800055d8:	00f73c23          	sd	a5,24(a4)
    800055dc:	02c73023          	sd	a2,32(a4)
    800055e0:	34071073          	csrw	mscratch,a4
    800055e4:	00000797          	auipc	a5,0x0
    800055e8:	6ec78793          	addi	a5,a5,1772 # 80005cd0 <timervec>
    800055ec:	30579073          	csrw	mtvec,a5
    800055f0:	300027f3          	csrr	a5,mstatus
    800055f4:	0087e793          	ori	a5,a5,8
    800055f8:	30079073          	csrw	mstatus,a5
    800055fc:	304027f3          	csrr	a5,mie
    80005600:	0807e793          	ori	a5,a5,128
    80005604:	30479073          	csrw	mie,a5
    80005608:	f14027f3          	csrr	a5,mhartid
    8000560c:	0007879b          	sext.w	a5,a5
    80005610:	00078213          	mv	tp,a5
    80005614:	30200073          	mret
    80005618:	00813403          	ld	s0,8(sp)
    8000561c:	01010113          	addi	sp,sp,16
    80005620:	00008067          	ret

0000000080005624 <timerinit>:
    80005624:	ff010113          	addi	sp,sp,-16
    80005628:	00813423          	sd	s0,8(sp)
    8000562c:	01010413          	addi	s0,sp,16
    80005630:	f14027f3          	csrr	a5,mhartid
    80005634:	0200c737          	lui	a4,0x200c
    80005638:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000563c:	0007869b          	sext.w	a3,a5
    80005640:	00269713          	slli	a4,a3,0x2
    80005644:	000f4637          	lui	a2,0xf4
    80005648:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000564c:	00d70733          	add	a4,a4,a3
    80005650:	0037979b          	slliw	a5,a5,0x3
    80005654:	020046b7          	lui	a3,0x2004
    80005658:	00d787b3          	add	a5,a5,a3
    8000565c:	00c585b3          	add	a1,a1,a2
    80005660:	00371693          	slli	a3,a4,0x3
    80005664:	00005717          	auipc	a4,0x5
    80005668:	cdc70713          	addi	a4,a4,-804 # 8000a340 <timer_scratch>
    8000566c:	00b7b023          	sd	a1,0(a5)
    80005670:	00d70733          	add	a4,a4,a3
    80005674:	00f73c23          	sd	a5,24(a4)
    80005678:	02c73023          	sd	a2,32(a4)
    8000567c:	34071073          	csrw	mscratch,a4
    80005680:	00000797          	auipc	a5,0x0
    80005684:	65078793          	addi	a5,a5,1616 # 80005cd0 <timervec>
    80005688:	30579073          	csrw	mtvec,a5
    8000568c:	300027f3          	csrr	a5,mstatus
    80005690:	0087e793          	ori	a5,a5,8
    80005694:	30079073          	csrw	mstatus,a5
    80005698:	304027f3          	csrr	a5,mie
    8000569c:	0807e793          	ori	a5,a5,128
    800056a0:	30479073          	csrw	mie,a5
    800056a4:	00813403          	ld	s0,8(sp)
    800056a8:	01010113          	addi	sp,sp,16
    800056ac:	00008067          	ret

00000000800056b0 <system_main>:
    800056b0:	fe010113          	addi	sp,sp,-32
    800056b4:	00813823          	sd	s0,16(sp)
    800056b8:	00913423          	sd	s1,8(sp)
    800056bc:	00113c23          	sd	ra,24(sp)
    800056c0:	02010413          	addi	s0,sp,32
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	0c4080e7          	jalr	196(ra) # 80005788 <cpuid>
    800056cc:	00005497          	auipc	s1,0x5
    800056d0:	bd448493          	addi	s1,s1,-1068 # 8000a2a0 <started>
    800056d4:	02050263          	beqz	a0,800056f8 <system_main+0x48>
    800056d8:	0004a783          	lw	a5,0(s1)
    800056dc:	0007879b          	sext.w	a5,a5
    800056e0:	fe078ce3          	beqz	a5,800056d8 <system_main+0x28>
    800056e4:	0ff0000f          	fence
    800056e8:	00003517          	auipc	a0,0x3
    800056ec:	ee050513          	addi	a0,a0,-288 # 800085c8 <CONSOLE_STATUS+0x5b8>
    800056f0:	00001097          	auipc	ra,0x1
    800056f4:	a7c080e7          	jalr	-1412(ra) # 8000616c <panic>
    800056f8:	00001097          	auipc	ra,0x1
    800056fc:	9d0080e7          	jalr	-1584(ra) # 800060c8 <consoleinit>
    80005700:	00001097          	auipc	ra,0x1
    80005704:	15c080e7          	jalr	348(ra) # 8000685c <printfinit>
    80005708:	00003517          	auipc	a0,0x3
    8000570c:	dc850513          	addi	a0,a0,-568 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80005710:	00001097          	auipc	ra,0x1
    80005714:	ab8080e7          	jalr	-1352(ra) # 800061c8 <__printf>
    80005718:	00003517          	auipc	a0,0x3
    8000571c:	e8050513          	addi	a0,a0,-384 # 80008598 <CONSOLE_STATUS+0x588>
    80005720:	00001097          	auipc	ra,0x1
    80005724:	aa8080e7          	jalr	-1368(ra) # 800061c8 <__printf>
    80005728:	00003517          	auipc	a0,0x3
    8000572c:	da850513          	addi	a0,a0,-600 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80005730:	00001097          	auipc	ra,0x1
    80005734:	a98080e7          	jalr	-1384(ra) # 800061c8 <__printf>
    80005738:	00001097          	auipc	ra,0x1
    8000573c:	4b0080e7          	jalr	1200(ra) # 80006be8 <kinit>
    80005740:	00000097          	auipc	ra,0x0
    80005744:	148080e7          	jalr	328(ra) # 80005888 <trapinit>
    80005748:	00000097          	auipc	ra,0x0
    8000574c:	16c080e7          	jalr	364(ra) # 800058b4 <trapinithart>
    80005750:	00000097          	auipc	ra,0x0
    80005754:	5c0080e7          	jalr	1472(ra) # 80005d10 <plicinit>
    80005758:	00000097          	auipc	ra,0x0
    8000575c:	5e0080e7          	jalr	1504(ra) # 80005d38 <plicinithart>
    80005760:	00000097          	auipc	ra,0x0
    80005764:	078080e7          	jalr	120(ra) # 800057d8 <userinit>
    80005768:	0ff0000f          	fence
    8000576c:	00100793          	li	a5,1
    80005770:	00003517          	auipc	a0,0x3
    80005774:	e4050513          	addi	a0,a0,-448 # 800085b0 <CONSOLE_STATUS+0x5a0>
    80005778:	00f4a023          	sw	a5,0(s1)
    8000577c:	00001097          	auipc	ra,0x1
    80005780:	a4c080e7          	jalr	-1460(ra) # 800061c8 <__printf>
    80005784:	0000006f          	j	80005784 <system_main+0xd4>

0000000080005788 <cpuid>:
    80005788:	ff010113          	addi	sp,sp,-16
    8000578c:	00813423          	sd	s0,8(sp)
    80005790:	01010413          	addi	s0,sp,16
    80005794:	00020513          	mv	a0,tp
    80005798:	00813403          	ld	s0,8(sp)
    8000579c:	0005051b          	sext.w	a0,a0
    800057a0:	01010113          	addi	sp,sp,16
    800057a4:	00008067          	ret

00000000800057a8 <mycpu>:
    800057a8:	ff010113          	addi	sp,sp,-16
    800057ac:	00813423          	sd	s0,8(sp)
    800057b0:	01010413          	addi	s0,sp,16
    800057b4:	00020793          	mv	a5,tp
    800057b8:	00813403          	ld	s0,8(sp)
    800057bc:	0007879b          	sext.w	a5,a5
    800057c0:	00779793          	slli	a5,a5,0x7
    800057c4:	00006517          	auipc	a0,0x6
    800057c8:	bac50513          	addi	a0,a0,-1108 # 8000b370 <cpus>
    800057cc:	00f50533          	add	a0,a0,a5
    800057d0:	01010113          	addi	sp,sp,16
    800057d4:	00008067          	ret

00000000800057d8 <userinit>:
    800057d8:	ff010113          	addi	sp,sp,-16
    800057dc:	00813423          	sd	s0,8(sp)
    800057e0:	01010413          	addi	s0,sp,16
    800057e4:	00813403          	ld	s0,8(sp)
    800057e8:	01010113          	addi	sp,sp,16
    800057ec:	ffffc317          	auipc	t1,0xffffc
    800057f0:	15c30067          	jr	348(t1) # 80001948 <main>

00000000800057f4 <either_copyout>:
    800057f4:	ff010113          	addi	sp,sp,-16
    800057f8:	00813023          	sd	s0,0(sp)
    800057fc:	00113423          	sd	ra,8(sp)
    80005800:	01010413          	addi	s0,sp,16
    80005804:	02051663          	bnez	a0,80005830 <either_copyout+0x3c>
    80005808:	00058513          	mv	a0,a1
    8000580c:	00060593          	mv	a1,a2
    80005810:	0006861b          	sext.w	a2,a3
    80005814:	00002097          	auipc	ra,0x2
    80005818:	c60080e7          	jalr	-928(ra) # 80007474 <__memmove>
    8000581c:	00813083          	ld	ra,8(sp)
    80005820:	00013403          	ld	s0,0(sp)
    80005824:	00000513          	li	a0,0
    80005828:	01010113          	addi	sp,sp,16
    8000582c:	00008067          	ret
    80005830:	00003517          	auipc	a0,0x3
    80005834:	dc050513          	addi	a0,a0,-576 # 800085f0 <CONSOLE_STATUS+0x5e0>
    80005838:	00001097          	auipc	ra,0x1
    8000583c:	934080e7          	jalr	-1740(ra) # 8000616c <panic>

0000000080005840 <either_copyin>:
    80005840:	ff010113          	addi	sp,sp,-16
    80005844:	00813023          	sd	s0,0(sp)
    80005848:	00113423          	sd	ra,8(sp)
    8000584c:	01010413          	addi	s0,sp,16
    80005850:	02059463          	bnez	a1,80005878 <either_copyin+0x38>
    80005854:	00060593          	mv	a1,a2
    80005858:	0006861b          	sext.w	a2,a3
    8000585c:	00002097          	auipc	ra,0x2
    80005860:	c18080e7          	jalr	-1000(ra) # 80007474 <__memmove>
    80005864:	00813083          	ld	ra,8(sp)
    80005868:	00013403          	ld	s0,0(sp)
    8000586c:	00000513          	li	a0,0
    80005870:	01010113          	addi	sp,sp,16
    80005874:	00008067          	ret
    80005878:	00003517          	auipc	a0,0x3
    8000587c:	da050513          	addi	a0,a0,-608 # 80008618 <CONSOLE_STATUS+0x608>
    80005880:	00001097          	auipc	ra,0x1
    80005884:	8ec080e7          	jalr	-1812(ra) # 8000616c <panic>

0000000080005888 <trapinit>:
    80005888:	ff010113          	addi	sp,sp,-16
    8000588c:	00813423          	sd	s0,8(sp)
    80005890:	01010413          	addi	s0,sp,16
    80005894:	00813403          	ld	s0,8(sp)
    80005898:	00003597          	auipc	a1,0x3
    8000589c:	da858593          	addi	a1,a1,-600 # 80008640 <CONSOLE_STATUS+0x630>
    800058a0:	00006517          	auipc	a0,0x6
    800058a4:	b5050513          	addi	a0,a0,-1200 # 8000b3f0 <tickslock>
    800058a8:	01010113          	addi	sp,sp,16
    800058ac:	00001317          	auipc	t1,0x1
    800058b0:	5cc30067          	jr	1484(t1) # 80006e78 <initlock>

00000000800058b4 <trapinithart>:
    800058b4:	ff010113          	addi	sp,sp,-16
    800058b8:	00813423          	sd	s0,8(sp)
    800058bc:	01010413          	addi	s0,sp,16
    800058c0:	00000797          	auipc	a5,0x0
    800058c4:	30078793          	addi	a5,a5,768 # 80005bc0 <kernelvec>
    800058c8:	10579073          	csrw	stvec,a5
    800058cc:	00813403          	ld	s0,8(sp)
    800058d0:	01010113          	addi	sp,sp,16
    800058d4:	00008067          	ret

00000000800058d8 <usertrap>:
    800058d8:	ff010113          	addi	sp,sp,-16
    800058dc:	00813423          	sd	s0,8(sp)
    800058e0:	01010413          	addi	s0,sp,16
    800058e4:	00813403          	ld	s0,8(sp)
    800058e8:	01010113          	addi	sp,sp,16
    800058ec:	00008067          	ret

00000000800058f0 <usertrapret>:
    800058f0:	ff010113          	addi	sp,sp,-16
    800058f4:	00813423          	sd	s0,8(sp)
    800058f8:	01010413          	addi	s0,sp,16
    800058fc:	00813403          	ld	s0,8(sp)
    80005900:	01010113          	addi	sp,sp,16
    80005904:	00008067          	ret

0000000080005908 <kerneltrap>:
    80005908:	fe010113          	addi	sp,sp,-32
    8000590c:	00813823          	sd	s0,16(sp)
    80005910:	00113c23          	sd	ra,24(sp)
    80005914:	00913423          	sd	s1,8(sp)
    80005918:	02010413          	addi	s0,sp,32
    8000591c:	142025f3          	csrr	a1,scause
    80005920:	100027f3          	csrr	a5,sstatus
    80005924:	0027f793          	andi	a5,a5,2
    80005928:	10079c63          	bnez	a5,80005a40 <kerneltrap+0x138>
    8000592c:	142027f3          	csrr	a5,scause
    80005930:	0207ce63          	bltz	a5,8000596c <kerneltrap+0x64>
    80005934:	00003517          	auipc	a0,0x3
    80005938:	d5450513          	addi	a0,a0,-684 # 80008688 <CONSOLE_STATUS+0x678>
    8000593c:	00001097          	auipc	ra,0x1
    80005940:	88c080e7          	jalr	-1908(ra) # 800061c8 <__printf>
    80005944:	141025f3          	csrr	a1,sepc
    80005948:	14302673          	csrr	a2,stval
    8000594c:	00003517          	auipc	a0,0x3
    80005950:	d4c50513          	addi	a0,a0,-692 # 80008698 <CONSOLE_STATUS+0x688>
    80005954:	00001097          	auipc	ra,0x1
    80005958:	874080e7          	jalr	-1932(ra) # 800061c8 <__printf>
    8000595c:	00003517          	auipc	a0,0x3
    80005960:	d5450513          	addi	a0,a0,-684 # 800086b0 <CONSOLE_STATUS+0x6a0>
    80005964:	00001097          	auipc	ra,0x1
    80005968:	808080e7          	jalr	-2040(ra) # 8000616c <panic>
    8000596c:	0ff7f713          	andi	a4,a5,255
    80005970:	00900693          	li	a3,9
    80005974:	04d70063          	beq	a4,a3,800059b4 <kerneltrap+0xac>
    80005978:	fff00713          	li	a4,-1
    8000597c:	03f71713          	slli	a4,a4,0x3f
    80005980:	00170713          	addi	a4,a4,1
    80005984:	fae798e3          	bne	a5,a4,80005934 <kerneltrap+0x2c>
    80005988:	00000097          	auipc	ra,0x0
    8000598c:	e00080e7          	jalr	-512(ra) # 80005788 <cpuid>
    80005990:	06050663          	beqz	a0,800059fc <kerneltrap+0xf4>
    80005994:	144027f3          	csrr	a5,sip
    80005998:	ffd7f793          	andi	a5,a5,-3
    8000599c:	14479073          	csrw	sip,a5
    800059a0:	01813083          	ld	ra,24(sp)
    800059a4:	01013403          	ld	s0,16(sp)
    800059a8:	00813483          	ld	s1,8(sp)
    800059ac:	02010113          	addi	sp,sp,32
    800059b0:	00008067          	ret
    800059b4:	00000097          	auipc	ra,0x0
    800059b8:	3d0080e7          	jalr	976(ra) # 80005d84 <plic_claim>
    800059bc:	00a00793          	li	a5,10
    800059c0:	00050493          	mv	s1,a0
    800059c4:	06f50863          	beq	a0,a5,80005a34 <kerneltrap+0x12c>
    800059c8:	fc050ce3          	beqz	a0,800059a0 <kerneltrap+0x98>
    800059cc:	00050593          	mv	a1,a0
    800059d0:	00003517          	auipc	a0,0x3
    800059d4:	c9850513          	addi	a0,a0,-872 # 80008668 <CONSOLE_STATUS+0x658>
    800059d8:	00000097          	auipc	ra,0x0
    800059dc:	7f0080e7          	jalr	2032(ra) # 800061c8 <__printf>
    800059e0:	01013403          	ld	s0,16(sp)
    800059e4:	01813083          	ld	ra,24(sp)
    800059e8:	00048513          	mv	a0,s1
    800059ec:	00813483          	ld	s1,8(sp)
    800059f0:	02010113          	addi	sp,sp,32
    800059f4:	00000317          	auipc	t1,0x0
    800059f8:	3c830067          	jr	968(t1) # 80005dbc <plic_complete>
    800059fc:	00006517          	auipc	a0,0x6
    80005a00:	9f450513          	addi	a0,a0,-1548 # 8000b3f0 <tickslock>
    80005a04:	00001097          	auipc	ra,0x1
    80005a08:	498080e7          	jalr	1176(ra) # 80006e9c <acquire>
    80005a0c:	00005717          	auipc	a4,0x5
    80005a10:	89870713          	addi	a4,a4,-1896 # 8000a2a4 <ticks>
    80005a14:	00072783          	lw	a5,0(a4)
    80005a18:	00006517          	auipc	a0,0x6
    80005a1c:	9d850513          	addi	a0,a0,-1576 # 8000b3f0 <tickslock>
    80005a20:	0017879b          	addiw	a5,a5,1
    80005a24:	00f72023          	sw	a5,0(a4)
    80005a28:	00001097          	auipc	ra,0x1
    80005a2c:	540080e7          	jalr	1344(ra) # 80006f68 <release>
    80005a30:	f65ff06f          	j	80005994 <kerneltrap+0x8c>
    80005a34:	00001097          	auipc	ra,0x1
    80005a38:	09c080e7          	jalr	156(ra) # 80006ad0 <uartintr>
    80005a3c:	fa5ff06f          	j	800059e0 <kerneltrap+0xd8>
    80005a40:	00003517          	auipc	a0,0x3
    80005a44:	c0850513          	addi	a0,a0,-1016 # 80008648 <CONSOLE_STATUS+0x638>
    80005a48:	00000097          	auipc	ra,0x0
    80005a4c:	724080e7          	jalr	1828(ra) # 8000616c <panic>

0000000080005a50 <clockintr>:
    80005a50:	fe010113          	addi	sp,sp,-32
    80005a54:	00813823          	sd	s0,16(sp)
    80005a58:	00913423          	sd	s1,8(sp)
    80005a5c:	00113c23          	sd	ra,24(sp)
    80005a60:	02010413          	addi	s0,sp,32
    80005a64:	00006497          	auipc	s1,0x6
    80005a68:	98c48493          	addi	s1,s1,-1652 # 8000b3f0 <tickslock>
    80005a6c:	00048513          	mv	a0,s1
    80005a70:	00001097          	auipc	ra,0x1
    80005a74:	42c080e7          	jalr	1068(ra) # 80006e9c <acquire>
    80005a78:	00005717          	auipc	a4,0x5
    80005a7c:	82c70713          	addi	a4,a4,-2004 # 8000a2a4 <ticks>
    80005a80:	00072783          	lw	a5,0(a4)
    80005a84:	01013403          	ld	s0,16(sp)
    80005a88:	01813083          	ld	ra,24(sp)
    80005a8c:	00048513          	mv	a0,s1
    80005a90:	0017879b          	addiw	a5,a5,1
    80005a94:	00813483          	ld	s1,8(sp)
    80005a98:	00f72023          	sw	a5,0(a4)
    80005a9c:	02010113          	addi	sp,sp,32
    80005aa0:	00001317          	auipc	t1,0x1
    80005aa4:	4c830067          	jr	1224(t1) # 80006f68 <release>

0000000080005aa8 <devintr>:
    80005aa8:	142027f3          	csrr	a5,scause
    80005aac:	00000513          	li	a0,0
    80005ab0:	0007c463          	bltz	a5,80005ab8 <devintr+0x10>
    80005ab4:	00008067          	ret
    80005ab8:	fe010113          	addi	sp,sp,-32
    80005abc:	00813823          	sd	s0,16(sp)
    80005ac0:	00113c23          	sd	ra,24(sp)
    80005ac4:	00913423          	sd	s1,8(sp)
    80005ac8:	02010413          	addi	s0,sp,32
    80005acc:	0ff7f713          	andi	a4,a5,255
    80005ad0:	00900693          	li	a3,9
    80005ad4:	04d70c63          	beq	a4,a3,80005b2c <devintr+0x84>
    80005ad8:	fff00713          	li	a4,-1
    80005adc:	03f71713          	slli	a4,a4,0x3f
    80005ae0:	00170713          	addi	a4,a4,1
    80005ae4:	00e78c63          	beq	a5,a4,80005afc <devintr+0x54>
    80005ae8:	01813083          	ld	ra,24(sp)
    80005aec:	01013403          	ld	s0,16(sp)
    80005af0:	00813483          	ld	s1,8(sp)
    80005af4:	02010113          	addi	sp,sp,32
    80005af8:	00008067          	ret
    80005afc:	00000097          	auipc	ra,0x0
    80005b00:	c8c080e7          	jalr	-884(ra) # 80005788 <cpuid>
    80005b04:	06050663          	beqz	a0,80005b70 <devintr+0xc8>
    80005b08:	144027f3          	csrr	a5,sip
    80005b0c:	ffd7f793          	andi	a5,a5,-3
    80005b10:	14479073          	csrw	sip,a5
    80005b14:	01813083          	ld	ra,24(sp)
    80005b18:	01013403          	ld	s0,16(sp)
    80005b1c:	00813483          	ld	s1,8(sp)
    80005b20:	00200513          	li	a0,2
    80005b24:	02010113          	addi	sp,sp,32
    80005b28:	00008067          	ret
    80005b2c:	00000097          	auipc	ra,0x0
    80005b30:	258080e7          	jalr	600(ra) # 80005d84 <plic_claim>
    80005b34:	00a00793          	li	a5,10
    80005b38:	00050493          	mv	s1,a0
    80005b3c:	06f50663          	beq	a0,a5,80005ba8 <devintr+0x100>
    80005b40:	00100513          	li	a0,1
    80005b44:	fa0482e3          	beqz	s1,80005ae8 <devintr+0x40>
    80005b48:	00048593          	mv	a1,s1
    80005b4c:	00003517          	auipc	a0,0x3
    80005b50:	b1c50513          	addi	a0,a0,-1252 # 80008668 <CONSOLE_STATUS+0x658>
    80005b54:	00000097          	auipc	ra,0x0
    80005b58:	674080e7          	jalr	1652(ra) # 800061c8 <__printf>
    80005b5c:	00048513          	mv	a0,s1
    80005b60:	00000097          	auipc	ra,0x0
    80005b64:	25c080e7          	jalr	604(ra) # 80005dbc <plic_complete>
    80005b68:	00100513          	li	a0,1
    80005b6c:	f7dff06f          	j	80005ae8 <devintr+0x40>
    80005b70:	00006517          	auipc	a0,0x6
    80005b74:	88050513          	addi	a0,a0,-1920 # 8000b3f0 <tickslock>
    80005b78:	00001097          	auipc	ra,0x1
    80005b7c:	324080e7          	jalr	804(ra) # 80006e9c <acquire>
    80005b80:	00004717          	auipc	a4,0x4
    80005b84:	72470713          	addi	a4,a4,1828 # 8000a2a4 <ticks>
    80005b88:	00072783          	lw	a5,0(a4)
    80005b8c:	00006517          	auipc	a0,0x6
    80005b90:	86450513          	addi	a0,a0,-1948 # 8000b3f0 <tickslock>
    80005b94:	0017879b          	addiw	a5,a5,1
    80005b98:	00f72023          	sw	a5,0(a4)
    80005b9c:	00001097          	auipc	ra,0x1
    80005ba0:	3cc080e7          	jalr	972(ra) # 80006f68 <release>
    80005ba4:	f65ff06f          	j	80005b08 <devintr+0x60>
    80005ba8:	00001097          	auipc	ra,0x1
    80005bac:	f28080e7          	jalr	-216(ra) # 80006ad0 <uartintr>
    80005bb0:	fadff06f          	j	80005b5c <devintr+0xb4>
	...

0000000080005bc0 <kernelvec>:
    80005bc0:	f0010113          	addi	sp,sp,-256
    80005bc4:	00113023          	sd	ra,0(sp)
    80005bc8:	00213423          	sd	sp,8(sp)
    80005bcc:	00313823          	sd	gp,16(sp)
    80005bd0:	00413c23          	sd	tp,24(sp)
    80005bd4:	02513023          	sd	t0,32(sp)
    80005bd8:	02613423          	sd	t1,40(sp)
    80005bdc:	02713823          	sd	t2,48(sp)
    80005be0:	02813c23          	sd	s0,56(sp)
    80005be4:	04913023          	sd	s1,64(sp)
    80005be8:	04a13423          	sd	a0,72(sp)
    80005bec:	04b13823          	sd	a1,80(sp)
    80005bf0:	04c13c23          	sd	a2,88(sp)
    80005bf4:	06d13023          	sd	a3,96(sp)
    80005bf8:	06e13423          	sd	a4,104(sp)
    80005bfc:	06f13823          	sd	a5,112(sp)
    80005c00:	07013c23          	sd	a6,120(sp)
    80005c04:	09113023          	sd	a7,128(sp)
    80005c08:	09213423          	sd	s2,136(sp)
    80005c0c:	09313823          	sd	s3,144(sp)
    80005c10:	09413c23          	sd	s4,152(sp)
    80005c14:	0b513023          	sd	s5,160(sp)
    80005c18:	0b613423          	sd	s6,168(sp)
    80005c1c:	0b713823          	sd	s7,176(sp)
    80005c20:	0b813c23          	sd	s8,184(sp)
    80005c24:	0d913023          	sd	s9,192(sp)
    80005c28:	0da13423          	sd	s10,200(sp)
    80005c2c:	0db13823          	sd	s11,208(sp)
    80005c30:	0dc13c23          	sd	t3,216(sp)
    80005c34:	0fd13023          	sd	t4,224(sp)
    80005c38:	0fe13423          	sd	t5,232(sp)
    80005c3c:	0ff13823          	sd	t6,240(sp)
    80005c40:	cc9ff0ef          	jal	ra,80005908 <kerneltrap>
    80005c44:	00013083          	ld	ra,0(sp)
    80005c48:	00813103          	ld	sp,8(sp)
    80005c4c:	01013183          	ld	gp,16(sp)
    80005c50:	02013283          	ld	t0,32(sp)
    80005c54:	02813303          	ld	t1,40(sp)
    80005c58:	03013383          	ld	t2,48(sp)
    80005c5c:	03813403          	ld	s0,56(sp)
    80005c60:	04013483          	ld	s1,64(sp)
    80005c64:	04813503          	ld	a0,72(sp)
    80005c68:	05013583          	ld	a1,80(sp)
    80005c6c:	05813603          	ld	a2,88(sp)
    80005c70:	06013683          	ld	a3,96(sp)
    80005c74:	06813703          	ld	a4,104(sp)
    80005c78:	07013783          	ld	a5,112(sp)
    80005c7c:	07813803          	ld	a6,120(sp)
    80005c80:	08013883          	ld	a7,128(sp)
    80005c84:	08813903          	ld	s2,136(sp)
    80005c88:	09013983          	ld	s3,144(sp)
    80005c8c:	09813a03          	ld	s4,152(sp)
    80005c90:	0a013a83          	ld	s5,160(sp)
    80005c94:	0a813b03          	ld	s6,168(sp)
    80005c98:	0b013b83          	ld	s7,176(sp)
    80005c9c:	0b813c03          	ld	s8,184(sp)
    80005ca0:	0c013c83          	ld	s9,192(sp)
    80005ca4:	0c813d03          	ld	s10,200(sp)
    80005ca8:	0d013d83          	ld	s11,208(sp)
    80005cac:	0d813e03          	ld	t3,216(sp)
    80005cb0:	0e013e83          	ld	t4,224(sp)
    80005cb4:	0e813f03          	ld	t5,232(sp)
    80005cb8:	0f013f83          	ld	t6,240(sp)
    80005cbc:	10010113          	addi	sp,sp,256
    80005cc0:	10200073          	sret
    80005cc4:	00000013          	nop
    80005cc8:	00000013          	nop
    80005ccc:	00000013          	nop

0000000080005cd0 <timervec>:
    80005cd0:	34051573          	csrrw	a0,mscratch,a0
    80005cd4:	00b53023          	sd	a1,0(a0)
    80005cd8:	00c53423          	sd	a2,8(a0)
    80005cdc:	00d53823          	sd	a3,16(a0)
    80005ce0:	01853583          	ld	a1,24(a0)
    80005ce4:	02053603          	ld	a2,32(a0)
    80005ce8:	0005b683          	ld	a3,0(a1)
    80005cec:	00c686b3          	add	a3,a3,a2
    80005cf0:	00d5b023          	sd	a3,0(a1)
    80005cf4:	00200593          	li	a1,2
    80005cf8:	14459073          	csrw	sip,a1
    80005cfc:	01053683          	ld	a3,16(a0)
    80005d00:	00853603          	ld	a2,8(a0)
    80005d04:	00053583          	ld	a1,0(a0)
    80005d08:	34051573          	csrrw	a0,mscratch,a0
    80005d0c:	30200073          	mret

0000000080005d10 <plicinit>:
    80005d10:	ff010113          	addi	sp,sp,-16
    80005d14:	00813423          	sd	s0,8(sp)
    80005d18:	01010413          	addi	s0,sp,16
    80005d1c:	00813403          	ld	s0,8(sp)
    80005d20:	0c0007b7          	lui	a5,0xc000
    80005d24:	00100713          	li	a4,1
    80005d28:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005d2c:	00e7a223          	sw	a4,4(a5)
    80005d30:	01010113          	addi	sp,sp,16
    80005d34:	00008067          	ret

0000000080005d38 <plicinithart>:
    80005d38:	ff010113          	addi	sp,sp,-16
    80005d3c:	00813023          	sd	s0,0(sp)
    80005d40:	00113423          	sd	ra,8(sp)
    80005d44:	01010413          	addi	s0,sp,16
    80005d48:	00000097          	auipc	ra,0x0
    80005d4c:	a40080e7          	jalr	-1472(ra) # 80005788 <cpuid>
    80005d50:	0085171b          	slliw	a4,a0,0x8
    80005d54:	0c0027b7          	lui	a5,0xc002
    80005d58:	00e787b3          	add	a5,a5,a4
    80005d5c:	40200713          	li	a4,1026
    80005d60:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005d64:	00813083          	ld	ra,8(sp)
    80005d68:	00013403          	ld	s0,0(sp)
    80005d6c:	00d5151b          	slliw	a0,a0,0xd
    80005d70:	0c2017b7          	lui	a5,0xc201
    80005d74:	00a78533          	add	a0,a5,a0
    80005d78:	00052023          	sw	zero,0(a0)
    80005d7c:	01010113          	addi	sp,sp,16
    80005d80:	00008067          	ret

0000000080005d84 <plic_claim>:
    80005d84:	ff010113          	addi	sp,sp,-16
    80005d88:	00813023          	sd	s0,0(sp)
    80005d8c:	00113423          	sd	ra,8(sp)
    80005d90:	01010413          	addi	s0,sp,16
    80005d94:	00000097          	auipc	ra,0x0
    80005d98:	9f4080e7          	jalr	-1548(ra) # 80005788 <cpuid>
    80005d9c:	00813083          	ld	ra,8(sp)
    80005da0:	00013403          	ld	s0,0(sp)
    80005da4:	00d5151b          	slliw	a0,a0,0xd
    80005da8:	0c2017b7          	lui	a5,0xc201
    80005dac:	00a78533          	add	a0,a5,a0
    80005db0:	00452503          	lw	a0,4(a0)
    80005db4:	01010113          	addi	sp,sp,16
    80005db8:	00008067          	ret

0000000080005dbc <plic_complete>:
    80005dbc:	fe010113          	addi	sp,sp,-32
    80005dc0:	00813823          	sd	s0,16(sp)
    80005dc4:	00913423          	sd	s1,8(sp)
    80005dc8:	00113c23          	sd	ra,24(sp)
    80005dcc:	02010413          	addi	s0,sp,32
    80005dd0:	00050493          	mv	s1,a0
    80005dd4:	00000097          	auipc	ra,0x0
    80005dd8:	9b4080e7          	jalr	-1612(ra) # 80005788 <cpuid>
    80005ddc:	01813083          	ld	ra,24(sp)
    80005de0:	01013403          	ld	s0,16(sp)
    80005de4:	00d5179b          	slliw	a5,a0,0xd
    80005de8:	0c201737          	lui	a4,0xc201
    80005dec:	00f707b3          	add	a5,a4,a5
    80005df0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005df4:	00813483          	ld	s1,8(sp)
    80005df8:	02010113          	addi	sp,sp,32
    80005dfc:	00008067          	ret

0000000080005e00 <consolewrite>:
    80005e00:	fb010113          	addi	sp,sp,-80
    80005e04:	04813023          	sd	s0,64(sp)
    80005e08:	04113423          	sd	ra,72(sp)
    80005e0c:	02913c23          	sd	s1,56(sp)
    80005e10:	03213823          	sd	s2,48(sp)
    80005e14:	03313423          	sd	s3,40(sp)
    80005e18:	03413023          	sd	s4,32(sp)
    80005e1c:	01513c23          	sd	s5,24(sp)
    80005e20:	05010413          	addi	s0,sp,80
    80005e24:	06c05c63          	blez	a2,80005e9c <consolewrite+0x9c>
    80005e28:	00060993          	mv	s3,a2
    80005e2c:	00050a13          	mv	s4,a0
    80005e30:	00058493          	mv	s1,a1
    80005e34:	00000913          	li	s2,0
    80005e38:	fff00a93          	li	s5,-1
    80005e3c:	01c0006f          	j	80005e58 <consolewrite+0x58>
    80005e40:	fbf44503          	lbu	a0,-65(s0)
    80005e44:	0019091b          	addiw	s2,s2,1
    80005e48:	00148493          	addi	s1,s1,1
    80005e4c:	00001097          	auipc	ra,0x1
    80005e50:	a9c080e7          	jalr	-1380(ra) # 800068e8 <uartputc>
    80005e54:	03298063          	beq	s3,s2,80005e74 <consolewrite+0x74>
    80005e58:	00048613          	mv	a2,s1
    80005e5c:	00100693          	li	a3,1
    80005e60:	000a0593          	mv	a1,s4
    80005e64:	fbf40513          	addi	a0,s0,-65
    80005e68:	00000097          	auipc	ra,0x0
    80005e6c:	9d8080e7          	jalr	-1576(ra) # 80005840 <either_copyin>
    80005e70:	fd5518e3          	bne	a0,s5,80005e40 <consolewrite+0x40>
    80005e74:	04813083          	ld	ra,72(sp)
    80005e78:	04013403          	ld	s0,64(sp)
    80005e7c:	03813483          	ld	s1,56(sp)
    80005e80:	02813983          	ld	s3,40(sp)
    80005e84:	02013a03          	ld	s4,32(sp)
    80005e88:	01813a83          	ld	s5,24(sp)
    80005e8c:	00090513          	mv	a0,s2
    80005e90:	03013903          	ld	s2,48(sp)
    80005e94:	05010113          	addi	sp,sp,80
    80005e98:	00008067          	ret
    80005e9c:	00000913          	li	s2,0
    80005ea0:	fd5ff06f          	j	80005e74 <consolewrite+0x74>

0000000080005ea4 <consoleread>:
    80005ea4:	f9010113          	addi	sp,sp,-112
    80005ea8:	06813023          	sd	s0,96(sp)
    80005eac:	04913c23          	sd	s1,88(sp)
    80005eb0:	05213823          	sd	s2,80(sp)
    80005eb4:	05313423          	sd	s3,72(sp)
    80005eb8:	05413023          	sd	s4,64(sp)
    80005ebc:	03513c23          	sd	s5,56(sp)
    80005ec0:	03613823          	sd	s6,48(sp)
    80005ec4:	03713423          	sd	s7,40(sp)
    80005ec8:	03813023          	sd	s8,32(sp)
    80005ecc:	06113423          	sd	ra,104(sp)
    80005ed0:	01913c23          	sd	s9,24(sp)
    80005ed4:	07010413          	addi	s0,sp,112
    80005ed8:	00060b93          	mv	s7,a2
    80005edc:	00050913          	mv	s2,a0
    80005ee0:	00058c13          	mv	s8,a1
    80005ee4:	00060b1b          	sext.w	s6,a2
    80005ee8:	00005497          	auipc	s1,0x5
    80005eec:	53048493          	addi	s1,s1,1328 # 8000b418 <cons>
    80005ef0:	00400993          	li	s3,4
    80005ef4:	fff00a13          	li	s4,-1
    80005ef8:	00a00a93          	li	s5,10
    80005efc:	05705e63          	blez	s7,80005f58 <consoleread+0xb4>
    80005f00:	09c4a703          	lw	a4,156(s1)
    80005f04:	0984a783          	lw	a5,152(s1)
    80005f08:	0007071b          	sext.w	a4,a4
    80005f0c:	08e78463          	beq	a5,a4,80005f94 <consoleread+0xf0>
    80005f10:	07f7f713          	andi	a4,a5,127
    80005f14:	00e48733          	add	a4,s1,a4
    80005f18:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005f1c:	0017869b          	addiw	a3,a5,1
    80005f20:	08d4ac23          	sw	a3,152(s1)
    80005f24:	00070c9b          	sext.w	s9,a4
    80005f28:	0b370663          	beq	a4,s3,80005fd4 <consoleread+0x130>
    80005f2c:	00100693          	li	a3,1
    80005f30:	f9f40613          	addi	a2,s0,-97
    80005f34:	000c0593          	mv	a1,s8
    80005f38:	00090513          	mv	a0,s2
    80005f3c:	f8e40fa3          	sb	a4,-97(s0)
    80005f40:	00000097          	auipc	ra,0x0
    80005f44:	8b4080e7          	jalr	-1868(ra) # 800057f4 <either_copyout>
    80005f48:	01450863          	beq	a0,s4,80005f58 <consoleread+0xb4>
    80005f4c:	001c0c13          	addi	s8,s8,1
    80005f50:	fffb8b9b          	addiw	s7,s7,-1
    80005f54:	fb5c94e3          	bne	s9,s5,80005efc <consoleread+0x58>
    80005f58:	000b851b          	sext.w	a0,s7
    80005f5c:	06813083          	ld	ra,104(sp)
    80005f60:	06013403          	ld	s0,96(sp)
    80005f64:	05813483          	ld	s1,88(sp)
    80005f68:	05013903          	ld	s2,80(sp)
    80005f6c:	04813983          	ld	s3,72(sp)
    80005f70:	04013a03          	ld	s4,64(sp)
    80005f74:	03813a83          	ld	s5,56(sp)
    80005f78:	02813b83          	ld	s7,40(sp)
    80005f7c:	02013c03          	ld	s8,32(sp)
    80005f80:	01813c83          	ld	s9,24(sp)
    80005f84:	40ab053b          	subw	a0,s6,a0
    80005f88:	03013b03          	ld	s6,48(sp)
    80005f8c:	07010113          	addi	sp,sp,112
    80005f90:	00008067          	ret
    80005f94:	00001097          	auipc	ra,0x1
    80005f98:	1d8080e7          	jalr	472(ra) # 8000716c <push_on>
    80005f9c:	0984a703          	lw	a4,152(s1)
    80005fa0:	09c4a783          	lw	a5,156(s1)
    80005fa4:	0007879b          	sext.w	a5,a5
    80005fa8:	fef70ce3          	beq	a4,a5,80005fa0 <consoleread+0xfc>
    80005fac:	00001097          	auipc	ra,0x1
    80005fb0:	234080e7          	jalr	564(ra) # 800071e0 <pop_on>
    80005fb4:	0984a783          	lw	a5,152(s1)
    80005fb8:	07f7f713          	andi	a4,a5,127
    80005fbc:	00e48733          	add	a4,s1,a4
    80005fc0:	01874703          	lbu	a4,24(a4)
    80005fc4:	0017869b          	addiw	a3,a5,1
    80005fc8:	08d4ac23          	sw	a3,152(s1)
    80005fcc:	00070c9b          	sext.w	s9,a4
    80005fd0:	f5371ee3          	bne	a4,s3,80005f2c <consoleread+0x88>
    80005fd4:	000b851b          	sext.w	a0,s7
    80005fd8:	f96bf2e3          	bgeu	s7,s6,80005f5c <consoleread+0xb8>
    80005fdc:	08f4ac23          	sw	a5,152(s1)
    80005fe0:	f7dff06f          	j	80005f5c <consoleread+0xb8>

0000000080005fe4 <consputc>:
    80005fe4:	10000793          	li	a5,256
    80005fe8:	00f50663          	beq	a0,a5,80005ff4 <consputc+0x10>
    80005fec:	00001317          	auipc	t1,0x1
    80005ff0:	9f430067          	jr	-1548(t1) # 800069e0 <uartputc_sync>
    80005ff4:	ff010113          	addi	sp,sp,-16
    80005ff8:	00113423          	sd	ra,8(sp)
    80005ffc:	00813023          	sd	s0,0(sp)
    80006000:	01010413          	addi	s0,sp,16
    80006004:	00800513          	li	a0,8
    80006008:	00001097          	auipc	ra,0x1
    8000600c:	9d8080e7          	jalr	-1576(ra) # 800069e0 <uartputc_sync>
    80006010:	02000513          	li	a0,32
    80006014:	00001097          	auipc	ra,0x1
    80006018:	9cc080e7          	jalr	-1588(ra) # 800069e0 <uartputc_sync>
    8000601c:	00013403          	ld	s0,0(sp)
    80006020:	00813083          	ld	ra,8(sp)
    80006024:	00800513          	li	a0,8
    80006028:	01010113          	addi	sp,sp,16
    8000602c:	00001317          	auipc	t1,0x1
    80006030:	9b430067          	jr	-1612(t1) # 800069e0 <uartputc_sync>

0000000080006034 <consoleintr>:
    80006034:	fe010113          	addi	sp,sp,-32
    80006038:	00813823          	sd	s0,16(sp)
    8000603c:	00913423          	sd	s1,8(sp)
    80006040:	01213023          	sd	s2,0(sp)
    80006044:	00113c23          	sd	ra,24(sp)
    80006048:	02010413          	addi	s0,sp,32
    8000604c:	00005917          	auipc	s2,0x5
    80006050:	3cc90913          	addi	s2,s2,972 # 8000b418 <cons>
    80006054:	00050493          	mv	s1,a0
    80006058:	00090513          	mv	a0,s2
    8000605c:	00001097          	auipc	ra,0x1
    80006060:	e40080e7          	jalr	-448(ra) # 80006e9c <acquire>
    80006064:	02048c63          	beqz	s1,8000609c <consoleintr+0x68>
    80006068:	0a092783          	lw	a5,160(s2)
    8000606c:	09892703          	lw	a4,152(s2)
    80006070:	07f00693          	li	a3,127
    80006074:	40e7873b          	subw	a4,a5,a4
    80006078:	02e6e263          	bltu	a3,a4,8000609c <consoleintr+0x68>
    8000607c:	00d00713          	li	a4,13
    80006080:	04e48063          	beq	s1,a4,800060c0 <consoleintr+0x8c>
    80006084:	07f7f713          	andi	a4,a5,127
    80006088:	00e90733          	add	a4,s2,a4
    8000608c:	0017879b          	addiw	a5,a5,1
    80006090:	0af92023          	sw	a5,160(s2)
    80006094:	00970c23          	sb	s1,24(a4)
    80006098:	08f92e23          	sw	a5,156(s2)
    8000609c:	01013403          	ld	s0,16(sp)
    800060a0:	01813083          	ld	ra,24(sp)
    800060a4:	00813483          	ld	s1,8(sp)
    800060a8:	00013903          	ld	s2,0(sp)
    800060ac:	00005517          	auipc	a0,0x5
    800060b0:	36c50513          	addi	a0,a0,876 # 8000b418 <cons>
    800060b4:	02010113          	addi	sp,sp,32
    800060b8:	00001317          	auipc	t1,0x1
    800060bc:	eb030067          	jr	-336(t1) # 80006f68 <release>
    800060c0:	00a00493          	li	s1,10
    800060c4:	fc1ff06f          	j	80006084 <consoleintr+0x50>

00000000800060c8 <consoleinit>:
    800060c8:	fe010113          	addi	sp,sp,-32
    800060cc:	00113c23          	sd	ra,24(sp)
    800060d0:	00813823          	sd	s0,16(sp)
    800060d4:	00913423          	sd	s1,8(sp)
    800060d8:	02010413          	addi	s0,sp,32
    800060dc:	00005497          	auipc	s1,0x5
    800060e0:	33c48493          	addi	s1,s1,828 # 8000b418 <cons>
    800060e4:	00048513          	mv	a0,s1
    800060e8:	00002597          	auipc	a1,0x2
    800060ec:	5d858593          	addi	a1,a1,1496 # 800086c0 <CONSOLE_STATUS+0x6b0>
    800060f0:	00001097          	auipc	ra,0x1
    800060f4:	d88080e7          	jalr	-632(ra) # 80006e78 <initlock>
    800060f8:	00000097          	auipc	ra,0x0
    800060fc:	7ac080e7          	jalr	1964(ra) # 800068a4 <uartinit>
    80006100:	01813083          	ld	ra,24(sp)
    80006104:	01013403          	ld	s0,16(sp)
    80006108:	00000797          	auipc	a5,0x0
    8000610c:	d9c78793          	addi	a5,a5,-612 # 80005ea4 <consoleread>
    80006110:	0af4bc23          	sd	a5,184(s1)
    80006114:	00000797          	auipc	a5,0x0
    80006118:	cec78793          	addi	a5,a5,-788 # 80005e00 <consolewrite>
    8000611c:	0cf4b023          	sd	a5,192(s1)
    80006120:	00813483          	ld	s1,8(sp)
    80006124:	02010113          	addi	sp,sp,32
    80006128:	00008067          	ret

000000008000612c <console_read>:
    8000612c:	ff010113          	addi	sp,sp,-16
    80006130:	00813423          	sd	s0,8(sp)
    80006134:	01010413          	addi	s0,sp,16
    80006138:	00813403          	ld	s0,8(sp)
    8000613c:	00005317          	auipc	t1,0x5
    80006140:	39433303          	ld	t1,916(t1) # 8000b4d0 <devsw+0x10>
    80006144:	01010113          	addi	sp,sp,16
    80006148:	00030067          	jr	t1

000000008000614c <console_write>:
    8000614c:	ff010113          	addi	sp,sp,-16
    80006150:	00813423          	sd	s0,8(sp)
    80006154:	01010413          	addi	s0,sp,16
    80006158:	00813403          	ld	s0,8(sp)
    8000615c:	00005317          	auipc	t1,0x5
    80006160:	37c33303          	ld	t1,892(t1) # 8000b4d8 <devsw+0x18>
    80006164:	01010113          	addi	sp,sp,16
    80006168:	00030067          	jr	t1

000000008000616c <panic>:
    8000616c:	fe010113          	addi	sp,sp,-32
    80006170:	00113c23          	sd	ra,24(sp)
    80006174:	00813823          	sd	s0,16(sp)
    80006178:	00913423          	sd	s1,8(sp)
    8000617c:	02010413          	addi	s0,sp,32
    80006180:	00050493          	mv	s1,a0
    80006184:	00002517          	auipc	a0,0x2
    80006188:	54450513          	addi	a0,a0,1348 # 800086c8 <CONSOLE_STATUS+0x6b8>
    8000618c:	00005797          	auipc	a5,0x5
    80006190:	3e07a623          	sw	zero,1004(a5) # 8000b578 <pr+0x18>
    80006194:	00000097          	auipc	ra,0x0
    80006198:	034080e7          	jalr	52(ra) # 800061c8 <__printf>
    8000619c:	00048513          	mv	a0,s1
    800061a0:	00000097          	auipc	ra,0x0
    800061a4:	028080e7          	jalr	40(ra) # 800061c8 <__printf>
    800061a8:	00002517          	auipc	a0,0x2
    800061ac:	32850513          	addi	a0,a0,808 # 800084d0 <CONSOLE_STATUS+0x4c0>
    800061b0:	00000097          	auipc	ra,0x0
    800061b4:	018080e7          	jalr	24(ra) # 800061c8 <__printf>
    800061b8:	00100793          	li	a5,1
    800061bc:	00004717          	auipc	a4,0x4
    800061c0:	0ef72623          	sw	a5,236(a4) # 8000a2a8 <panicked>
    800061c4:	0000006f          	j	800061c4 <panic+0x58>

00000000800061c8 <__printf>:
    800061c8:	f3010113          	addi	sp,sp,-208
    800061cc:	08813023          	sd	s0,128(sp)
    800061d0:	07313423          	sd	s3,104(sp)
    800061d4:	09010413          	addi	s0,sp,144
    800061d8:	05813023          	sd	s8,64(sp)
    800061dc:	08113423          	sd	ra,136(sp)
    800061e0:	06913c23          	sd	s1,120(sp)
    800061e4:	07213823          	sd	s2,112(sp)
    800061e8:	07413023          	sd	s4,96(sp)
    800061ec:	05513c23          	sd	s5,88(sp)
    800061f0:	05613823          	sd	s6,80(sp)
    800061f4:	05713423          	sd	s7,72(sp)
    800061f8:	03913c23          	sd	s9,56(sp)
    800061fc:	03a13823          	sd	s10,48(sp)
    80006200:	03b13423          	sd	s11,40(sp)
    80006204:	00005317          	auipc	t1,0x5
    80006208:	35c30313          	addi	t1,t1,860 # 8000b560 <pr>
    8000620c:	01832c03          	lw	s8,24(t1)
    80006210:	00b43423          	sd	a1,8(s0)
    80006214:	00c43823          	sd	a2,16(s0)
    80006218:	00d43c23          	sd	a3,24(s0)
    8000621c:	02e43023          	sd	a4,32(s0)
    80006220:	02f43423          	sd	a5,40(s0)
    80006224:	03043823          	sd	a6,48(s0)
    80006228:	03143c23          	sd	a7,56(s0)
    8000622c:	00050993          	mv	s3,a0
    80006230:	4a0c1663          	bnez	s8,800066dc <__printf+0x514>
    80006234:	60098c63          	beqz	s3,8000684c <__printf+0x684>
    80006238:	0009c503          	lbu	a0,0(s3)
    8000623c:	00840793          	addi	a5,s0,8
    80006240:	f6f43c23          	sd	a5,-136(s0)
    80006244:	00000493          	li	s1,0
    80006248:	22050063          	beqz	a0,80006468 <__printf+0x2a0>
    8000624c:	00002a37          	lui	s4,0x2
    80006250:	00018ab7          	lui	s5,0x18
    80006254:	000f4b37          	lui	s6,0xf4
    80006258:	00989bb7          	lui	s7,0x989
    8000625c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006260:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006264:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006268:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000626c:	00148c9b          	addiw	s9,s1,1
    80006270:	02500793          	li	a5,37
    80006274:	01998933          	add	s2,s3,s9
    80006278:	38f51263          	bne	a0,a5,800065fc <__printf+0x434>
    8000627c:	00094783          	lbu	a5,0(s2)
    80006280:	00078c9b          	sext.w	s9,a5
    80006284:	1e078263          	beqz	a5,80006468 <__printf+0x2a0>
    80006288:	0024849b          	addiw	s1,s1,2
    8000628c:	07000713          	li	a4,112
    80006290:	00998933          	add	s2,s3,s1
    80006294:	38e78a63          	beq	a5,a4,80006628 <__printf+0x460>
    80006298:	20f76863          	bltu	a4,a5,800064a8 <__printf+0x2e0>
    8000629c:	42a78863          	beq	a5,a0,800066cc <__printf+0x504>
    800062a0:	06400713          	li	a4,100
    800062a4:	40e79663          	bne	a5,a4,800066b0 <__printf+0x4e8>
    800062a8:	f7843783          	ld	a5,-136(s0)
    800062ac:	0007a603          	lw	a2,0(a5)
    800062b0:	00878793          	addi	a5,a5,8
    800062b4:	f6f43c23          	sd	a5,-136(s0)
    800062b8:	42064a63          	bltz	a2,800066ec <__printf+0x524>
    800062bc:	00a00713          	li	a4,10
    800062c0:	02e677bb          	remuw	a5,a2,a4
    800062c4:	00002d97          	auipc	s11,0x2
    800062c8:	42cd8d93          	addi	s11,s11,1068 # 800086f0 <digits>
    800062cc:	00900593          	li	a1,9
    800062d0:	0006051b          	sext.w	a0,a2
    800062d4:	00000c93          	li	s9,0
    800062d8:	02079793          	slli	a5,a5,0x20
    800062dc:	0207d793          	srli	a5,a5,0x20
    800062e0:	00fd87b3          	add	a5,s11,a5
    800062e4:	0007c783          	lbu	a5,0(a5)
    800062e8:	02e656bb          	divuw	a3,a2,a4
    800062ec:	f8f40023          	sb	a5,-128(s0)
    800062f0:	14c5d863          	bge	a1,a2,80006440 <__printf+0x278>
    800062f4:	06300593          	li	a1,99
    800062f8:	00100c93          	li	s9,1
    800062fc:	02e6f7bb          	remuw	a5,a3,a4
    80006300:	02079793          	slli	a5,a5,0x20
    80006304:	0207d793          	srli	a5,a5,0x20
    80006308:	00fd87b3          	add	a5,s11,a5
    8000630c:	0007c783          	lbu	a5,0(a5)
    80006310:	02e6d73b          	divuw	a4,a3,a4
    80006314:	f8f400a3          	sb	a5,-127(s0)
    80006318:	12a5f463          	bgeu	a1,a0,80006440 <__printf+0x278>
    8000631c:	00a00693          	li	a3,10
    80006320:	00900593          	li	a1,9
    80006324:	02d777bb          	remuw	a5,a4,a3
    80006328:	02079793          	slli	a5,a5,0x20
    8000632c:	0207d793          	srli	a5,a5,0x20
    80006330:	00fd87b3          	add	a5,s11,a5
    80006334:	0007c503          	lbu	a0,0(a5)
    80006338:	02d757bb          	divuw	a5,a4,a3
    8000633c:	f8a40123          	sb	a0,-126(s0)
    80006340:	48e5f263          	bgeu	a1,a4,800067c4 <__printf+0x5fc>
    80006344:	06300513          	li	a0,99
    80006348:	02d7f5bb          	remuw	a1,a5,a3
    8000634c:	02059593          	slli	a1,a1,0x20
    80006350:	0205d593          	srli	a1,a1,0x20
    80006354:	00bd85b3          	add	a1,s11,a1
    80006358:	0005c583          	lbu	a1,0(a1)
    8000635c:	02d7d7bb          	divuw	a5,a5,a3
    80006360:	f8b401a3          	sb	a1,-125(s0)
    80006364:	48e57263          	bgeu	a0,a4,800067e8 <__printf+0x620>
    80006368:	3e700513          	li	a0,999
    8000636c:	02d7f5bb          	remuw	a1,a5,a3
    80006370:	02059593          	slli	a1,a1,0x20
    80006374:	0205d593          	srli	a1,a1,0x20
    80006378:	00bd85b3          	add	a1,s11,a1
    8000637c:	0005c583          	lbu	a1,0(a1)
    80006380:	02d7d7bb          	divuw	a5,a5,a3
    80006384:	f8b40223          	sb	a1,-124(s0)
    80006388:	46e57663          	bgeu	a0,a4,800067f4 <__printf+0x62c>
    8000638c:	02d7f5bb          	remuw	a1,a5,a3
    80006390:	02059593          	slli	a1,a1,0x20
    80006394:	0205d593          	srli	a1,a1,0x20
    80006398:	00bd85b3          	add	a1,s11,a1
    8000639c:	0005c583          	lbu	a1,0(a1)
    800063a0:	02d7d7bb          	divuw	a5,a5,a3
    800063a4:	f8b402a3          	sb	a1,-123(s0)
    800063a8:	46ea7863          	bgeu	s4,a4,80006818 <__printf+0x650>
    800063ac:	02d7f5bb          	remuw	a1,a5,a3
    800063b0:	02059593          	slli	a1,a1,0x20
    800063b4:	0205d593          	srli	a1,a1,0x20
    800063b8:	00bd85b3          	add	a1,s11,a1
    800063bc:	0005c583          	lbu	a1,0(a1)
    800063c0:	02d7d7bb          	divuw	a5,a5,a3
    800063c4:	f8b40323          	sb	a1,-122(s0)
    800063c8:	3eeaf863          	bgeu	s5,a4,800067b8 <__printf+0x5f0>
    800063cc:	02d7f5bb          	remuw	a1,a5,a3
    800063d0:	02059593          	slli	a1,a1,0x20
    800063d4:	0205d593          	srli	a1,a1,0x20
    800063d8:	00bd85b3          	add	a1,s11,a1
    800063dc:	0005c583          	lbu	a1,0(a1)
    800063e0:	02d7d7bb          	divuw	a5,a5,a3
    800063e4:	f8b403a3          	sb	a1,-121(s0)
    800063e8:	42eb7e63          	bgeu	s6,a4,80006824 <__printf+0x65c>
    800063ec:	02d7f5bb          	remuw	a1,a5,a3
    800063f0:	02059593          	slli	a1,a1,0x20
    800063f4:	0205d593          	srli	a1,a1,0x20
    800063f8:	00bd85b3          	add	a1,s11,a1
    800063fc:	0005c583          	lbu	a1,0(a1)
    80006400:	02d7d7bb          	divuw	a5,a5,a3
    80006404:	f8b40423          	sb	a1,-120(s0)
    80006408:	42ebfc63          	bgeu	s7,a4,80006840 <__printf+0x678>
    8000640c:	02079793          	slli	a5,a5,0x20
    80006410:	0207d793          	srli	a5,a5,0x20
    80006414:	00fd8db3          	add	s11,s11,a5
    80006418:	000dc703          	lbu	a4,0(s11)
    8000641c:	00a00793          	li	a5,10
    80006420:	00900c93          	li	s9,9
    80006424:	f8e404a3          	sb	a4,-119(s0)
    80006428:	00065c63          	bgez	a2,80006440 <__printf+0x278>
    8000642c:	f9040713          	addi	a4,s0,-112
    80006430:	00f70733          	add	a4,a4,a5
    80006434:	02d00693          	li	a3,45
    80006438:	fed70823          	sb	a3,-16(a4)
    8000643c:	00078c93          	mv	s9,a5
    80006440:	f8040793          	addi	a5,s0,-128
    80006444:	01978cb3          	add	s9,a5,s9
    80006448:	f7f40d13          	addi	s10,s0,-129
    8000644c:	000cc503          	lbu	a0,0(s9)
    80006450:	fffc8c93          	addi	s9,s9,-1
    80006454:	00000097          	auipc	ra,0x0
    80006458:	b90080e7          	jalr	-1136(ra) # 80005fe4 <consputc>
    8000645c:	ffac98e3          	bne	s9,s10,8000644c <__printf+0x284>
    80006460:	00094503          	lbu	a0,0(s2)
    80006464:	e00514e3          	bnez	a0,8000626c <__printf+0xa4>
    80006468:	1a0c1663          	bnez	s8,80006614 <__printf+0x44c>
    8000646c:	08813083          	ld	ra,136(sp)
    80006470:	08013403          	ld	s0,128(sp)
    80006474:	07813483          	ld	s1,120(sp)
    80006478:	07013903          	ld	s2,112(sp)
    8000647c:	06813983          	ld	s3,104(sp)
    80006480:	06013a03          	ld	s4,96(sp)
    80006484:	05813a83          	ld	s5,88(sp)
    80006488:	05013b03          	ld	s6,80(sp)
    8000648c:	04813b83          	ld	s7,72(sp)
    80006490:	04013c03          	ld	s8,64(sp)
    80006494:	03813c83          	ld	s9,56(sp)
    80006498:	03013d03          	ld	s10,48(sp)
    8000649c:	02813d83          	ld	s11,40(sp)
    800064a0:	0d010113          	addi	sp,sp,208
    800064a4:	00008067          	ret
    800064a8:	07300713          	li	a4,115
    800064ac:	1ce78a63          	beq	a5,a4,80006680 <__printf+0x4b8>
    800064b0:	07800713          	li	a4,120
    800064b4:	1ee79e63          	bne	a5,a4,800066b0 <__printf+0x4e8>
    800064b8:	f7843783          	ld	a5,-136(s0)
    800064bc:	0007a703          	lw	a4,0(a5)
    800064c0:	00878793          	addi	a5,a5,8
    800064c4:	f6f43c23          	sd	a5,-136(s0)
    800064c8:	28074263          	bltz	a4,8000674c <__printf+0x584>
    800064cc:	00002d97          	auipc	s11,0x2
    800064d0:	224d8d93          	addi	s11,s11,548 # 800086f0 <digits>
    800064d4:	00f77793          	andi	a5,a4,15
    800064d8:	00fd87b3          	add	a5,s11,a5
    800064dc:	0007c683          	lbu	a3,0(a5)
    800064e0:	00f00613          	li	a2,15
    800064e4:	0007079b          	sext.w	a5,a4
    800064e8:	f8d40023          	sb	a3,-128(s0)
    800064ec:	0047559b          	srliw	a1,a4,0x4
    800064f0:	0047569b          	srliw	a3,a4,0x4
    800064f4:	00000c93          	li	s9,0
    800064f8:	0ee65063          	bge	a2,a4,800065d8 <__printf+0x410>
    800064fc:	00f6f693          	andi	a3,a3,15
    80006500:	00dd86b3          	add	a3,s11,a3
    80006504:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006508:	0087d79b          	srliw	a5,a5,0x8
    8000650c:	00100c93          	li	s9,1
    80006510:	f8d400a3          	sb	a3,-127(s0)
    80006514:	0cb67263          	bgeu	a2,a1,800065d8 <__printf+0x410>
    80006518:	00f7f693          	andi	a3,a5,15
    8000651c:	00dd86b3          	add	a3,s11,a3
    80006520:	0006c583          	lbu	a1,0(a3)
    80006524:	00f00613          	li	a2,15
    80006528:	0047d69b          	srliw	a3,a5,0x4
    8000652c:	f8b40123          	sb	a1,-126(s0)
    80006530:	0047d593          	srli	a1,a5,0x4
    80006534:	28f67e63          	bgeu	a2,a5,800067d0 <__printf+0x608>
    80006538:	00f6f693          	andi	a3,a3,15
    8000653c:	00dd86b3          	add	a3,s11,a3
    80006540:	0006c503          	lbu	a0,0(a3)
    80006544:	0087d813          	srli	a6,a5,0x8
    80006548:	0087d69b          	srliw	a3,a5,0x8
    8000654c:	f8a401a3          	sb	a0,-125(s0)
    80006550:	28b67663          	bgeu	a2,a1,800067dc <__printf+0x614>
    80006554:	00f6f693          	andi	a3,a3,15
    80006558:	00dd86b3          	add	a3,s11,a3
    8000655c:	0006c583          	lbu	a1,0(a3)
    80006560:	00c7d513          	srli	a0,a5,0xc
    80006564:	00c7d69b          	srliw	a3,a5,0xc
    80006568:	f8b40223          	sb	a1,-124(s0)
    8000656c:	29067a63          	bgeu	a2,a6,80006800 <__printf+0x638>
    80006570:	00f6f693          	andi	a3,a3,15
    80006574:	00dd86b3          	add	a3,s11,a3
    80006578:	0006c583          	lbu	a1,0(a3)
    8000657c:	0107d813          	srli	a6,a5,0x10
    80006580:	0107d69b          	srliw	a3,a5,0x10
    80006584:	f8b402a3          	sb	a1,-123(s0)
    80006588:	28a67263          	bgeu	a2,a0,8000680c <__printf+0x644>
    8000658c:	00f6f693          	andi	a3,a3,15
    80006590:	00dd86b3          	add	a3,s11,a3
    80006594:	0006c683          	lbu	a3,0(a3)
    80006598:	0147d79b          	srliw	a5,a5,0x14
    8000659c:	f8d40323          	sb	a3,-122(s0)
    800065a0:	21067663          	bgeu	a2,a6,800067ac <__printf+0x5e4>
    800065a4:	02079793          	slli	a5,a5,0x20
    800065a8:	0207d793          	srli	a5,a5,0x20
    800065ac:	00fd8db3          	add	s11,s11,a5
    800065b0:	000dc683          	lbu	a3,0(s11)
    800065b4:	00800793          	li	a5,8
    800065b8:	00700c93          	li	s9,7
    800065bc:	f8d403a3          	sb	a3,-121(s0)
    800065c0:	00075c63          	bgez	a4,800065d8 <__printf+0x410>
    800065c4:	f9040713          	addi	a4,s0,-112
    800065c8:	00f70733          	add	a4,a4,a5
    800065cc:	02d00693          	li	a3,45
    800065d0:	fed70823          	sb	a3,-16(a4)
    800065d4:	00078c93          	mv	s9,a5
    800065d8:	f8040793          	addi	a5,s0,-128
    800065dc:	01978cb3          	add	s9,a5,s9
    800065e0:	f7f40d13          	addi	s10,s0,-129
    800065e4:	000cc503          	lbu	a0,0(s9)
    800065e8:	fffc8c93          	addi	s9,s9,-1
    800065ec:	00000097          	auipc	ra,0x0
    800065f0:	9f8080e7          	jalr	-1544(ra) # 80005fe4 <consputc>
    800065f4:	ff9d18e3          	bne	s10,s9,800065e4 <__printf+0x41c>
    800065f8:	0100006f          	j	80006608 <__printf+0x440>
    800065fc:	00000097          	auipc	ra,0x0
    80006600:	9e8080e7          	jalr	-1560(ra) # 80005fe4 <consputc>
    80006604:	000c8493          	mv	s1,s9
    80006608:	00094503          	lbu	a0,0(s2)
    8000660c:	c60510e3          	bnez	a0,8000626c <__printf+0xa4>
    80006610:	e40c0ee3          	beqz	s8,8000646c <__printf+0x2a4>
    80006614:	00005517          	auipc	a0,0x5
    80006618:	f4c50513          	addi	a0,a0,-180 # 8000b560 <pr>
    8000661c:	00001097          	auipc	ra,0x1
    80006620:	94c080e7          	jalr	-1716(ra) # 80006f68 <release>
    80006624:	e49ff06f          	j	8000646c <__printf+0x2a4>
    80006628:	f7843783          	ld	a5,-136(s0)
    8000662c:	03000513          	li	a0,48
    80006630:	01000d13          	li	s10,16
    80006634:	00878713          	addi	a4,a5,8
    80006638:	0007bc83          	ld	s9,0(a5)
    8000663c:	f6e43c23          	sd	a4,-136(s0)
    80006640:	00000097          	auipc	ra,0x0
    80006644:	9a4080e7          	jalr	-1628(ra) # 80005fe4 <consputc>
    80006648:	07800513          	li	a0,120
    8000664c:	00000097          	auipc	ra,0x0
    80006650:	998080e7          	jalr	-1640(ra) # 80005fe4 <consputc>
    80006654:	00002d97          	auipc	s11,0x2
    80006658:	09cd8d93          	addi	s11,s11,156 # 800086f0 <digits>
    8000665c:	03ccd793          	srli	a5,s9,0x3c
    80006660:	00fd87b3          	add	a5,s11,a5
    80006664:	0007c503          	lbu	a0,0(a5)
    80006668:	fffd0d1b          	addiw	s10,s10,-1
    8000666c:	004c9c93          	slli	s9,s9,0x4
    80006670:	00000097          	auipc	ra,0x0
    80006674:	974080e7          	jalr	-1676(ra) # 80005fe4 <consputc>
    80006678:	fe0d12e3          	bnez	s10,8000665c <__printf+0x494>
    8000667c:	f8dff06f          	j	80006608 <__printf+0x440>
    80006680:	f7843783          	ld	a5,-136(s0)
    80006684:	0007bc83          	ld	s9,0(a5)
    80006688:	00878793          	addi	a5,a5,8
    8000668c:	f6f43c23          	sd	a5,-136(s0)
    80006690:	000c9a63          	bnez	s9,800066a4 <__printf+0x4dc>
    80006694:	1080006f          	j	8000679c <__printf+0x5d4>
    80006698:	001c8c93          	addi	s9,s9,1
    8000669c:	00000097          	auipc	ra,0x0
    800066a0:	948080e7          	jalr	-1720(ra) # 80005fe4 <consputc>
    800066a4:	000cc503          	lbu	a0,0(s9)
    800066a8:	fe0518e3          	bnez	a0,80006698 <__printf+0x4d0>
    800066ac:	f5dff06f          	j	80006608 <__printf+0x440>
    800066b0:	02500513          	li	a0,37
    800066b4:	00000097          	auipc	ra,0x0
    800066b8:	930080e7          	jalr	-1744(ra) # 80005fe4 <consputc>
    800066bc:	000c8513          	mv	a0,s9
    800066c0:	00000097          	auipc	ra,0x0
    800066c4:	924080e7          	jalr	-1756(ra) # 80005fe4 <consputc>
    800066c8:	f41ff06f          	j	80006608 <__printf+0x440>
    800066cc:	02500513          	li	a0,37
    800066d0:	00000097          	auipc	ra,0x0
    800066d4:	914080e7          	jalr	-1772(ra) # 80005fe4 <consputc>
    800066d8:	f31ff06f          	j	80006608 <__printf+0x440>
    800066dc:	00030513          	mv	a0,t1
    800066e0:	00000097          	auipc	ra,0x0
    800066e4:	7bc080e7          	jalr	1980(ra) # 80006e9c <acquire>
    800066e8:	b4dff06f          	j	80006234 <__printf+0x6c>
    800066ec:	40c0053b          	negw	a0,a2
    800066f0:	00a00713          	li	a4,10
    800066f4:	02e576bb          	remuw	a3,a0,a4
    800066f8:	00002d97          	auipc	s11,0x2
    800066fc:	ff8d8d93          	addi	s11,s11,-8 # 800086f0 <digits>
    80006700:	ff700593          	li	a1,-9
    80006704:	02069693          	slli	a3,a3,0x20
    80006708:	0206d693          	srli	a3,a3,0x20
    8000670c:	00dd86b3          	add	a3,s11,a3
    80006710:	0006c683          	lbu	a3,0(a3)
    80006714:	02e557bb          	divuw	a5,a0,a4
    80006718:	f8d40023          	sb	a3,-128(s0)
    8000671c:	10b65e63          	bge	a2,a1,80006838 <__printf+0x670>
    80006720:	06300593          	li	a1,99
    80006724:	02e7f6bb          	remuw	a3,a5,a4
    80006728:	02069693          	slli	a3,a3,0x20
    8000672c:	0206d693          	srli	a3,a3,0x20
    80006730:	00dd86b3          	add	a3,s11,a3
    80006734:	0006c683          	lbu	a3,0(a3)
    80006738:	02e7d73b          	divuw	a4,a5,a4
    8000673c:	00200793          	li	a5,2
    80006740:	f8d400a3          	sb	a3,-127(s0)
    80006744:	bca5ece3          	bltu	a1,a0,8000631c <__printf+0x154>
    80006748:	ce5ff06f          	j	8000642c <__printf+0x264>
    8000674c:	40e007bb          	negw	a5,a4
    80006750:	00002d97          	auipc	s11,0x2
    80006754:	fa0d8d93          	addi	s11,s11,-96 # 800086f0 <digits>
    80006758:	00f7f693          	andi	a3,a5,15
    8000675c:	00dd86b3          	add	a3,s11,a3
    80006760:	0006c583          	lbu	a1,0(a3)
    80006764:	ff100613          	li	a2,-15
    80006768:	0047d69b          	srliw	a3,a5,0x4
    8000676c:	f8b40023          	sb	a1,-128(s0)
    80006770:	0047d59b          	srliw	a1,a5,0x4
    80006774:	0ac75e63          	bge	a4,a2,80006830 <__printf+0x668>
    80006778:	00f6f693          	andi	a3,a3,15
    8000677c:	00dd86b3          	add	a3,s11,a3
    80006780:	0006c603          	lbu	a2,0(a3)
    80006784:	00f00693          	li	a3,15
    80006788:	0087d79b          	srliw	a5,a5,0x8
    8000678c:	f8c400a3          	sb	a2,-127(s0)
    80006790:	d8b6e4e3          	bltu	a3,a1,80006518 <__printf+0x350>
    80006794:	00200793          	li	a5,2
    80006798:	e2dff06f          	j	800065c4 <__printf+0x3fc>
    8000679c:	00002c97          	auipc	s9,0x2
    800067a0:	f34c8c93          	addi	s9,s9,-204 # 800086d0 <CONSOLE_STATUS+0x6c0>
    800067a4:	02800513          	li	a0,40
    800067a8:	ef1ff06f          	j	80006698 <__printf+0x4d0>
    800067ac:	00700793          	li	a5,7
    800067b0:	00600c93          	li	s9,6
    800067b4:	e0dff06f          	j	800065c0 <__printf+0x3f8>
    800067b8:	00700793          	li	a5,7
    800067bc:	00600c93          	li	s9,6
    800067c0:	c69ff06f          	j	80006428 <__printf+0x260>
    800067c4:	00300793          	li	a5,3
    800067c8:	00200c93          	li	s9,2
    800067cc:	c5dff06f          	j	80006428 <__printf+0x260>
    800067d0:	00300793          	li	a5,3
    800067d4:	00200c93          	li	s9,2
    800067d8:	de9ff06f          	j	800065c0 <__printf+0x3f8>
    800067dc:	00400793          	li	a5,4
    800067e0:	00300c93          	li	s9,3
    800067e4:	dddff06f          	j	800065c0 <__printf+0x3f8>
    800067e8:	00400793          	li	a5,4
    800067ec:	00300c93          	li	s9,3
    800067f0:	c39ff06f          	j	80006428 <__printf+0x260>
    800067f4:	00500793          	li	a5,5
    800067f8:	00400c93          	li	s9,4
    800067fc:	c2dff06f          	j	80006428 <__printf+0x260>
    80006800:	00500793          	li	a5,5
    80006804:	00400c93          	li	s9,4
    80006808:	db9ff06f          	j	800065c0 <__printf+0x3f8>
    8000680c:	00600793          	li	a5,6
    80006810:	00500c93          	li	s9,5
    80006814:	dadff06f          	j	800065c0 <__printf+0x3f8>
    80006818:	00600793          	li	a5,6
    8000681c:	00500c93          	li	s9,5
    80006820:	c09ff06f          	j	80006428 <__printf+0x260>
    80006824:	00800793          	li	a5,8
    80006828:	00700c93          	li	s9,7
    8000682c:	bfdff06f          	j	80006428 <__printf+0x260>
    80006830:	00100793          	li	a5,1
    80006834:	d91ff06f          	j	800065c4 <__printf+0x3fc>
    80006838:	00100793          	li	a5,1
    8000683c:	bf1ff06f          	j	8000642c <__printf+0x264>
    80006840:	00900793          	li	a5,9
    80006844:	00800c93          	li	s9,8
    80006848:	be1ff06f          	j	80006428 <__printf+0x260>
    8000684c:	00002517          	auipc	a0,0x2
    80006850:	e8c50513          	addi	a0,a0,-372 # 800086d8 <CONSOLE_STATUS+0x6c8>
    80006854:	00000097          	auipc	ra,0x0
    80006858:	918080e7          	jalr	-1768(ra) # 8000616c <panic>

000000008000685c <printfinit>:
    8000685c:	fe010113          	addi	sp,sp,-32
    80006860:	00813823          	sd	s0,16(sp)
    80006864:	00913423          	sd	s1,8(sp)
    80006868:	00113c23          	sd	ra,24(sp)
    8000686c:	02010413          	addi	s0,sp,32
    80006870:	00005497          	auipc	s1,0x5
    80006874:	cf048493          	addi	s1,s1,-784 # 8000b560 <pr>
    80006878:	00048513          	mv	a0,s1
    8000687c:	00002597          	auipc	a1,0x2
    80006880:	e6c58593          	addi	a1,a1,-404 # 800086e8 <CONSOLE_STATUS+0x6d8>
    80006884:	00000097          	auipc	ra,0x0
    80006888:	5f4080e7          	jalr	1524(ra) # 80006e78 <initlock>
    8000688c:	01813083          	ld	ra,24(sp)
    80006890:	01013403          	ld	s0,16(sp)
    80006894:	0004ac23          	sw	zero,24(s1)
    80006898:	00813483          	ld	s1,8(sp)
    8000689c:	02010113          	addi	sp,sp,32
    800068a0:	00008067          	ret

00000000800068a4 <uartinit>:
    800068a4:	ff010113          	addi	sp,sp,-16
    800068a8:	00813423          	sd	s0,8(sp)
    800068ac:	01010413          	addi	s0,sp,16
    800068b0:	100007b7          	lui	a5,0x10000
    800068b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800068b8:	f8000713          	li	a4,-128
    800068bc:	00e781a3          	sb	a4,3(a5)
    800068c0:	00300713          	li	a4,3
    800068c4:	00e78023          	sb	a4,0(a5)
    800068c8:	000780a3          	sb	zero,1(a5)
    800068cc:	00e781a3          	sb	a4,3(a5)
    800068d0:	00700693          	li	a3,7
    800068d4:	00d78123          	sb	a3,2(a5)
    800068d8:	00e780a3          	sb	a4,1(a5)
    800068dc:	00813403          	ld	s0,8(sp)
    800068e0:	01010113          	addi	sp,sp,16
    800068e4:	00008067          	ret

00000000800068e8 <uartputc>:
    800068e8:	00004797          	auipc	a5,0x4
    800068ec:	9c07a783          	lw	a5,-1600(a5) # 8000a2a8 <panicked>
    800068f0:	00078463          	beqz	a5,800068f8 <uartputc+0x10>
    800068f4:	0000006f          	j	800068f4 <uartputc+0xc>
    800068f8:	fd010113          	addi	sp,sp,-48
    800068fc:	02813023          	sd	s0,32(sp)
    80006900:	00913c23          	sd	s1,24(sp)
    80006904:	01213823          	sd	s2,16(sp)
    80006908:	01313423          	sd	s3,8(sp)
    8000690c:	02113423          	sd	ra,40(sp)
    80006910:	03010413          	addi	s0,sp,48
    80006914:	00004917          	auipc	s2,0x4
    80006918:	99c90913          	addi	s2,s2,-1636 # 8000a2b0 <uart_tx_r>
    8000691c:	00093783          	ld	a5,0(s2)
    80006920:	00004497          	auipc	s1,0x4
    80006924:	99848493          	addi	s1,s1,-1640 # 8000a2b8 <uart_tx_w>
    80006928:	0004b703          	ld	a4,0(s1)
    8000692c:	02078693          	addi	a3,a5,32
    80006930:	00050993          	mv	s3,a0
    80006934:	02e69c63          	bne	a3,a4,8000696c <uartputc+0x84>
    80006938:	00001097          	auipc	ra,0x1
    8000693c:	834080e7          	jalr	-1996(ra) # 8000716c <push_on>
    80006940:	00093783          	ld	a5,0(s2)
    80006944:	0004b703          	ld	a4,0(s1)
    80006948:	02078793          	addi	a5,a5,32
    8000694c:	00e79463          	bne	a5,a4,80006954 <uartputc+0x6c>
    80006950:	0000006f          	j	80006950 <uartputc+0x68>
    80006954:	00001097          	auipc	ra,0x1
    80006958:	88c080e7          	jalr	-1908(ra) # 800071e0 <pop_on>
    8000695c:	00093783          	ld	a5,0(s2)
    80006960:	0004b703          	ld	a4,0(s1)
    80006964:	02078693          	addi	a3,a5,32
    80006968:	fce688e3          	beq	a3,a4,80006938 <uartputc+0x50>
    8000696c:	01f77693          	andi	a3,a4,31
    80006970:	00005597          	auipc	a1,0x5
    80006974:	c1058593          	addi	a1,a1,-1008 # 8000b580 <uart_tx_buf>
    80006978:	00d586b3          	add	a3,a1,a3
    8000697c:	00170713          	addi	a4,a4,1
    80006980:	01368023          	sb	s3,0(a3)
    80006984:	00e4b023          	sd	a4,0(s1)
    80006988:	10000637          	lui	a2,0x10000
    8000698c:	02f71063          	bne	a4,a5,800069ac <uartputc+0xc4>
    80006990:	0340006f          	j	800069c4 <uartputc+0xdc>
    80006994:	00074703          	lbu	a4,0(a4)
    80006998:	00f93023          	sd	a5,0(s2)
    8000699c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800069a0:	00093783          	ld	a5,0(s2)
    800069a4:	0004b703          	ld	a4,0(s1)
    800069a8:	00f70e63          	beq	a4,a5,800069c4 <uartputc+0xdc>
    800069ac:	00564683          	lbu	a3,5(a2)
    800069b0:	01f7f713          	andi	a4,a5,31
    800069b4:	00e58733          	add	a4,a1,a4
    800069b8:	0206f693          	andi	a3,a3,32
    800069bc:	00178793          	addi	a5,a5,1
    800069c0:	fc069ae3          	bnez	a3,80006994 <uartputc+0xac>
    800069c4:	02813083          	ld	ra,40(sp)
    800069c8:	02013403          	ld	s0,32(sp)
    800069cc:	01813483          	ld	s1,24(sp)
    800069d0:	01013903          	ld	s2,16(sp)
    800069d4:	00813983          	ld	s3,8(sp)
    800069d8:	03010113          	addi	sp,sp,48
    800069dc:	00008067          	ret

00000000800069e0 <uartputc_sync>:
    800069e0:	ff010113          	addi	sp,sp,-16
    800069e4:	00813423          	sd	s0,8(sp)
    800069e8:	01010413          	addi	s0,sp,16
    800069ec:	00004717          	auipc	a4,0x4
    800069f0:	8bc72703          	lw	a4,-1860(a4) # 8000a2a8 <panicked>
    800069f4:	02071663          	bnez	a4,80006a20 <uartputc_sync+0x40>
    800069f8:	00050793          	mv	a5,a0
    800069fc:	100006b7          	lui	a3,0x10000
    80006a00:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006a04:	02077713          	andi	a4,a4,32
    80006a08:	fe070ce3          	beqz	a4,80006a00 <uartputc_sync+0x20>
    80006a0c:	0ff7f793          	andi	a5,a5,255
    80006a10:	00f68023          	sb	a5,0(a3)
    80006a14:	00813403          	ld	s0,8(sp)
    80006a18:	01010113          	addi	sp,sp,16
    80006a1c:	00008067          	ret
    80006a20:	0000006f          	j	80006a20 <uartputc_sync+0x40>

0000000080006a24 <uartstart>:
    80006a24:	ff010113          	addi	sp,sp,-16
    80006a28:	00813423          	sd	s0,8(sp)
    80006a2c:	01010413          	addi	s0,sp,16
    80006a30:	00004617          	auipc	a2,0x4
    80006a34:	88060613          	addi	a2,a2,-1920 # 8000a2b0 <uart_tx_r>
    80006a38:	00004517          	auipc	a0,0x4
    80006a3c:	88050513          	addi	a0,a0,-1920 # 8000a2b8 <uart_tx_w>
    80006a40:	00063783          	ld	a5,0(a2)
    80006a44:	00053703          	ld	a4,0(a0)
    80006a48:	04f70263          	beq	a4,a5,80006a8c <uartstart+0x68>
    80006a4c:	100005b7          	lui	a1,0x10000
    80006a50:	00005817          	auipc	a6,0x5
    80006a54:	b3080813          	addi	a6,a6,-1232 # 8000b580 <uart_tx_buf>
    80006a58:	01c0006f          	j	80006a74 <uartstart+0x50>
    80006a5c:	0006c703          	lbu	a4,0(a3)
    80006a60:	00f63023          	sd	a5,0(a2)
    80006a64:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006a68:	00063783          	ld	a5,0(a2)
    80006a6c:	00053703          	ld	a4,0(a0)
    80006a70:	00f70e63          	beq	a4,a5,80006a8c <uartstart+0x68>
    80006a74:	01f7f713          	andi	a4,a5,31
    80006a78:	00e806b3          	add	a3,a6,a4
    80006a7c:	0055c703          	lbu	a4,5(a1)
    80006a80:	00178793          	addi	a5,a5,1
    80006a84:	02077713          	andi	a4,a4,32
    80006a88:	fc071ae3          	bnez	a4,80006a5c <uartstart+0x38>
    80006a8c:	00813403          	ld	s0,8(sp)
    80006a90:	01010113          	addi	sp,sp,16
    80006a94:	00008067          	ret

0000000080006a98 <uartgetc>:
    80006a98:	ff010113          	addi	sp,sp,-16
    80006a9c:	00813423          	sd	s0,8(sp)
    80006aa0:	01010413          	addi	s0,sp,16
    80006aa4:	10000737          	lui	a4,0x10000
    80006aa8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006aac:	0017f793          	andi	a5,a5,1
    80006ab0:	00078c63          	beqz	a5,80006ac8 <uartgetc+0x30>
    80006ab4:	00074503          	lbu	a0,0(a4)
    80006ab8:	0ff57513          	andi	a0,a0,255
    80006abc:	00813403          	ld	s0,8(sp)
    80006ac0:	01010113          	addi	sp,sp,16
    80006ac4:	00008067          	ret
    80006ac8:	fff00513          	li	a0,-1
    80006acc:	ff1ff06f          	j	80006abc <uartgetc+0x24>

0000000080006ad0 <uartintr>:
    80006ad0:	100007b7          	lui	a5,0x10000
    80006ad4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006ad8:	0017f793          	andi	a5,a5,1
    80006adc:	0a078463          	beqz	a5,80006b84 <uartintr+0xb4>
    80006ae0:	fe010113          	addi	sp,sp,-32
    80006ae4:	00813823          	sd	s0,16(sp)
    80006ae8:	00913423          	sd	s1,8(sp)
    80006aec:	00113c23          	sd	ra,24(sp)
    80006af0:	02010413          	addi	s0,sp,32
    80006af4:	100004b7          	lui	s1,0x10000
    80006af8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006afc:	0ff57513          	andi	a0,a0,255
    80006b00:	fffff097          	auipc	ra,0xfffff
    80006b04:	534080e7          	jalr	1332(ra) # 80006034 <consoleintr>
    80006b08:	0054c783          	lbu	a5,5(s1)
    80006b0c:	0017f793          	andi	a5,a5,1
    80006b10:	fe0794e3          	bnez	a5,80006af8 <uartintr+0x28>
    80006b14:	00003617          	auipc	a2,0x3
    80006b18:	79c60613          	addi	a2,a2,1948 # 8000a2b0 <uart_tx_r>
    80006b1c:	00003517          	auipc	a0,0x3
    80006b20:	79c50513          	addi	a0,a0,1948 # 8000a2b8 <uart_tx_w>
    80006b24:	00063783          	ld	a5,0(a2)
    80006b28:	00053703          	ld	a4,0(a0)
    80006b2c:	04f70263          	beq	a4,a5,80006b70 <uartintr+0xa0>
    80006b30:	100005b7          	lui	a1,0x10000
    80006b34:	00005817          	auipc	a6,0x5
    80006b38:	a4c80813          	addi	a6,a6,-1460 # 8000b580 <uart_tx_buf>
    80006b3c:	01c0006f          	j	80006b58 <uartintr+0x88>
    80006b40:	0006c703          	lbu	a4,0(a3)
    80006b44:	00f63023          	sd	a5,0(a2)
    80006b48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006b4c:	00063783          	ld	a5,0(a2)
    80006b50:	00053703          	ld	a4,0(a0)
    80006b54:	00f70e63          	beq	a4,a5,80006b70 <uartintr+0xa0>
    80006b58:	01f7f713          	andi	a4,a5,31
    80006b5c:	00e806b3          	add	a3,a6,a4
    80006b60:	0055c703          	lbu	a4,5(a1)
    80006b64:	00178793          	addi	a5,a5,1
    80006b68:	02077713          	andi	a4,a4,32
    80006b6c:	fc071ae3          	bnez	a4,80006b40 <uartintr+0x70>
    80006b70:	01813083          	ld	ra,24(sp)
    80006b74:	01013403          	ld	s0,16(sp)
    80006b78:	00813483          	ld	s1,8(sp)
    80006b7c:	02010113          	addi	sp,sp,32
    80006b80:	00008067          	ret
    80006b84:	00003617          	auipc	a2,0x3
    80006b88:	72c60613          	addi	a2,a2,1836 # 8000a2b0 <uart_tx_r>
    80006b8c:	00003517          	auipc	a0,0x3
    80006b90:	72c50513          	addi	a0,a0,1836 # 8000a2b8 <uart_tx_w>
    80006b94:	00063783          	ld	a5,0(a2)
    80006b98:	00053703          	ld	a4,0(a0)
    80006b9c:	04f70263          	beq	a4,a5,80006be0 <uartintr+0x110>
    80006ba0:	100005b7          	lui	a1,0x10000
    80006ba4:	00005817          	auipc	a6,0x5
    80006ba8:	9dc80813          	addi	a6,a6,-1572 # 8000b580 <uart_tx_buf>
    80006bac:	01c0006f          	j	80006bc8 <uartintr+0xf8>
    80006bb0:	0006c703          	lbu	a4,0(a3)
    80006bb4:	00f63023          	sd	a5,0(a2)
    80006bb8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006bbc:	00063783          	ld	a5,0(a2)
    80006bc0:	00053703          	ld	a4,0(a0)
    80006bc4:	02f70063          	beq	a4,a5,80006be4 <uartintr+0x114>
    80006bc8:	01f7f713          	andi	a4,a5,31
    80006bcc:	00e806b3          	add	a3,a6,a4
    80006bd0:	0055c703          	lbu	a4,5(a1)
    80006bd4:	00178793          	addi	a5,a5,1
    80006bd8:	02077713          	andi	a4,a4,32
    80006bdc:	fc071ae3          	bnez	a4,80006bb0 <uartintr+0xe0>
    80006be0:	00008067          	ret
    80006be4:	00008067          	ret

0000000080006be8 <kinit>:
    80006be8:	fc010113          	addi	sp,sp,-64
    80006bec:	02913423          	sd	s1,40(sp)
    80006bf0:	fffff7b7          	lui	a5,0xfffff
    80006bf4:	00006497          	auipc	s1,0x6
    80006bf8:	9ab48493          	addi	s1,s1,-1621 # 8000c59f <end+0xfff>
    80006bfc:	02813823          	sd	s0,48(sp)
    80006c00:	01313c23          	sd	s3,24(sp)
    80006c04:	00f4f4b3          	and	s1,s1,a5
    80006c08:	02113c23          	sd	ra,56(sp)
    80006c0c:	03213023          	sd	s2,32(sp)
    80006c10:	01413823          	sd	s4,16(sp)
    80006c14:	01513423          	sd	s5,8(sp)
    80006c18:	04010413          	addi	s0,sp,64
    80006c1c:	000017b7          	lui	a5,0x1
    80006c20:	01100993          	li	s3,17
    80006c24:	00f487b3          	add	a5,s1,a5
    80006c28:	01b99993          	slli	s3,s3,0x1b
    80006c2c:	06f9e063          	bltu	s3,a5,80006c8c <kinit+0xa4>
    80006c30:	00005a97          	auipc	s5,0x5
    80006c34:	970a8a93          	addi	s5,s5,-1680 # 8000b5a0 <end>
    80006c38:	0754ec63          	bltu	s1,s5,80006cb0 <kinit+0xc8>
    80006c3c:	0734fa63          	bgeu	s1,s3,80006cb0 <kinit+0xc8>
    80006c40:	00088a37          	lui	s4,0x88
    80006c44:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006c48:	00003917          	auipc	s2,0x3
    80006c4c:	67890913          	addi	s2,s2,1656 # 8000a2c0 <kmem>
    80006c50:	00ca1a13          	slli	s4,s4,0xc
    80006c54:	0140006f          	j	80006c68 <kinit+0x80>
    80006c58:	000017b7          	lui	a5,0x1
    80006c5c:	00f484b3          	add	s1,s1,a5
    80006c60:	0554e863          	bltu	s1,s5,80006cb0 <kinit+0xc8>
    80006c64:	0534f663          	bgeu	s1,s3,80006cb0 <kinit+0xc8>
    80006c68:	00001637          	lui	a2,0x1
    80006c6c:	00100593          	li	a1,1
    80006c70:	00048513          	mv	a0,s1
    80006c74:	00000097          	auipc	ra,0x0
    80006c78:	5e4080e7          	jalr	1508(ra) # 80007258 <__memset>
    80006c7c:	00093783          	ld	a5,0(s2)
    80006c80:	00f4b023          	sd	a5,0(s1)
    80006c84:	00993023          	sd	s1,0(s2)
    80006c88:	fd4498e3          	bne	s1,s4,80006c58 <kinit+0x70>
    80006c8c:	03813083          	ld	ra,56(sp)
    80006c90:	03013403          	ld	s0,48(sp)
    80006c94:	02813483          	ld	s1,40(sp)
    80006c98:	02013903          	ld	s2,32(sp)
    80006c9c:	01813983          	ld	s3,24(sp)
    80006ca0:	01013a03          	ld	s4,16(sp)
    80006ca4:	00813a83          	ld	s5,8(sp)
    80006ca8:	04010113          	addi	sp,sp,64
    80006cac:	00008067          	ret
    80006cb0:	00002517          	auipc	a0,0x2
    80006cb4:	a5850513          	addi	a0,a0,-1448 # 80008708 <digits+0x18>
    80006cb8:	fffff097          	auipc	ra,0xfffff
    80006cbc:	4b4080e7          	jalr	1204(ra) # 8000616c <panic>

0000000080006cc0 <freerange>:
    80006cc0:	fc010113          	addi	sp,sp,-64
    80006cc4:	000017b7          	lui	a5,0x1
    80006cc8:	02913423          	sd	s1,40(sp)
    80006ccc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006cd0:	009504b3          	add	s1,a0,s1
    80006cd4:	fffff537          	lui	a0,0xfffff
    80006cd8:	02813823          	sd	s0,48(sp)
    80006cdc:	02113c23          	sd	ra,56(sp)
    80006ce0:	03213023          	sd	s2,32(sp)
    80006ce4:	01313c23          	sd	s3,24(sp)
    80006ce8:	01413823          	sd	s4,16(sp)
    80006cec:	01513423          	sd	s5,8(sp)
    80006cf0:	01613023          	sd	s6,0(sp)
    80006cf4:	04010413          	addi	s0,sp,64
    80006cf8:	00a4f4b3          	and	s1,s1,a0
    80006cfc:	00f487b3          	add	a5,s1,a5
    80006d00:	06f5e463          	bltu	a1,a5,80006d68 <freerange+0xa8>
    80006d04:	00005a97          	auipc	s5,0x5
    80006d08:	89ca8a93          	addi	s5,s5,-1892 # 8000b5a0 <end>
    80006d0c:	0954e263          	bltu	s1,s5,80006d90 <freerange+0xd0>
    80006d10:	01100993          	li	s3,17
    80006d14:	01b99993          	slli	s3,s3,0x1b
    80006d18:	0734fc63          	bgeu	s1,s3,80006d90 <freerange+0xd0>
    80006d1c:	00058a13          	mv	s4,a1
    80006d20:	00003917          	auipc	s2,0x3
    80006d24:	5a090913          	addi	s2,s2,1440 # 8000a2c0 <kmem>
    80006d28:	00002b37          	lui	s6,0x2
    80006d2c:	0140006f          	j	80006d40 <freerange+0x80>
    80006d30:	000017b7          	lui	a5,0x1
    80006d34:	00f484b3          	add	s1,s1,a5
    80006d38:	0554ec63          	bltu	s1,s5,80006d90 <freerange+0xd0>
    80006d3c:	0534fa63          	bgeu	s1,s3,80006d90 <freerange+0xd0>
    80006d40:	00001637          	lui	a2,0x1
    80006d44:	00100593          	li	a1,1
    80006d48:	00048513          	mv	a0,s1
    80006d4c:	00000097          	auipc	ra,0x0
    80006d50:	50c080e7          	jalr	1292(ra) # 80007258 <__memset>
    80006d54:	00093703          	ld	a4,0(s2)
    80006d58:	016487b3          	add	a5,s1,s6
    80006d5c:	00e4b023          	sd	a4,0(s1)
    80006d60:	00993023          	sd	s1,0(s2)
    80006d64:	fcfa76e3          	bgeu	s4,a5,80006d30 <freerange+0x70>
    80006d68:	03813083          	ld	ra,56(sp)
    80006d6c:	03013403          	ld	s0,48(sp)
    80006d70:	02813483          	ld	s1,40(sp)
    80006d74:	02013903          	ld	s2,32(sp)
    80006d78:	01813983          	ld	s3,24(sp)
    80006d7c:	01013a03          	ld	s4,16(sp)
    80006d80:	00813a83          	ld	s5,8(sp)
    80006d84:	00013b03          	ld	s6,0(sp)
    80006d88:	04010113          	addi	sp,sp,64
    80006d8c:	00008067          	ret
    80006d90:	00002517          	auipc	a0,0x2
    80006d94:	97850513          	addi	a0,a0,-1672 # 80008708 <digits+0x18>
    80006d98:	fffff097          	auipc	ra,0xfffff
    80006d9c:	3d4080e7          	jalr	980(ra) # 8000616c <panic>

0000000080006da0 <kfree>:
    80006da0:	fe010113          	addi	sp,sp,-32
    80006da4:	00813823          	sd	s0,16(sp)
    80006da8:	00113c23          	sd	ra,24(sp)
    80006dac:	00913423          	sd	s1,8(sp)
    80006db0:	02010413          	addi	s0,sp,32
    80006db4:	03451793          	slli	a5,a0,0x34
    80006db8:	04079c63          	bnez	a5,80006e10 <kfree+0x70>
    80006dbc:	00004797          	auipc	a5,0x4
    80006dc0:	7e478793          	addi	a5,a5,2020 # 8000b5a0 <end>
    80006dc4:	00050493          	mv	s1,a0
    80006dc8:	04f56463          	bltu	a0,a5,80006e10 <kfree+0x70>
    80006dcc:	01100793          	li	a5,17
    80006dd0:	01b79793          	slli	a5,a5,0x1b
    80006dd4:	02f57e63          	bgeu	a0,a5,80006e10 <kfree+0x70>
    80006dd8:	00001637          	lui	a2,0x1
    80006ddc:	00100593          	li	a1,1
    80006de0:	00000097          	auipc	ra,0x0
    80006de4:	478080e7          	jalr	1144(ra) # 80007258 <__memset>
    80006de8:	00003797          	auipc	a5,0x3
    80006dec:	4d878793          	addi	a5,a5,1240 # 8000a2c0 <kmem>
    80006df0:	0007b703          	ld	a4,0(a5)
    80006df4:	01813083          	ld	ra,24(sp)
    80006df8:	01013403          	ld	s0,16(sp)
    80006dfc:	00e4b023          	sd	a4,0(s1)
    80006e00:	0097b023          	sd	s1,0(a5)
    80006e04:	00813483          	ld	s1,8(sp)
    80006e08:	02010113          	addi	sp,sp,32
    80006e0c:	00008067          	ret
    80006e10:	00002517          	auipc	a0,0x2
    80006e14:	8f850513          	addi	a0,a0,-1800 # 80008708 <digits+0x18>
    80006e18:	fffff097          	auipc	ra,0xfffff
    80006e1c:	354080e7          	jalr	852(ra) # 8000616c <panic>

0000000080006e20 <kalloc>:
    80006e20:	fe010113          	addi	sp,sp,-32
    80006e24:	00813823          	sd	s0,16(sp)
    80006e28:	00913423          	sd	s1,8(sp)
    80006e2c:	00113c23          	sd	ra,24(sp)
    80006e30:	02010413          	addi	s0,sp,32
    80006e34:	00003797          	auipc	a5,0x3
    80006e38:	48c78793          	addi	a5,a5,1164 # 8000a2c0 <kmem>
    80006e3c:	0007b483          	ld	s1,0(a5)
    80006e40:	02048063          	beqz	s1,80006e60 <kalloc+0x40>
    80006e44:	0004b703          	ld	a4,0(s1)
    80006e48:	00001637          	lui	a2,0x1
    80006e4c:	00500593          	li	a1,5
    80006e50:	00048513          	mv	a0,s1
    80006e54:	00e7b023          	sd	a4,0(a5)
    80006e58:	00000097          	auipc	ra,0x0
    80006e5c:	400080e7          	jalr	1024(ra) # 80007258 <__memset>
    80006e60:	01813083          	ld	ra,24(sp)
    80006e64:	01013403          	ld	s0,16(sp)
    80006e68:	00048513          	mv	a0,s1
    80006e6c:	00813483          	ld	s1,8(sp)
    80006e70:	02010113          	addi	sp,sp,32
    80006e74:	00008067          	ret

0000000080006e78 <initlock>:
    80006e78:	ff010113          	addi	sp,sp,-16
    80006e7c:	00813423          	sd	s0,8(sp)
    80006e80:	01010413          	addi	s0,sp,16
    80006e84:	00813403          	ld	s0,8(sp)
    80006e88:	00b53423          	sd	a1,8(a0)
    80006e8c:	00052023          	sw	zero,0(a0)
    80006e90:	00053823          	sd	zero,16(a0)
    80006e94:	01010113          	addi	sp,sp,16
    80006e98:	00008067          	ret

0000000080006e9c <acquire>:
    80006e9c:	fe010113          	addi	sp,sp,-32
    80006ea0:	00813823          	sd	s0,16(sp)
    80006ea4:	00913423          	sd	s1,8(sp)
    80006ea8:	00113c23          	sd	ra,24(sp)
    80006eac:	01213023          	sd	s2,0(sp)
    80006eb0:	02010413          	addi	s0,sp,32
    80006eb4:	00050493          	mv	s1,a0
    80006eb8:	10002973          	csrr	s2,sstatus
    80006ebc:	100027f3          	csrr	a5,sstatus
    80006ec0:	ffd7f793          	andi	a5,a5,-3
    80006ec4:	10079073          	csrw	sstatus,a5
    80006ec8:	fffff097          	auipc	ra,0xfffff
    80006ecc:	8e0080e7          	jalr	-1824(ra) # 800057a8 <mycpu>
    80006ed0:	07852783          	lw	a5,120(a0)
    80006ed4:	06078e63          	beqz	a5,80006f50 <acquire+0xb4>
    80006ed8:	fffff097          	auipc	ra,0xfffff
    80006edc:	8d0080e7          	jalr	-1840(ra) # 800057a8 <mycpu>
    80006ee0:	07852783          	lw	a5,120(a0)
    80006ee4:	0004a703          	lw	a4,0(s1)
    80006ee8:	0017879b          	addiw	a5,a5,1
    80006eec:	06f52c23          	sw	a5,120(a0)
    80006ef0:	04071063          	bnez	a4,80006f30 <acquire+0x94>
    80006ef4:	00100713          	li	a4,1
    80006ef8:	00070793          	mv	a5,a4
    80006efc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006f00:	0007879b          	sext.w	a5,a5
    80006f04:	fe079ae3          	bnez	a5,80006ef8 <acquire+0x5c>
    80006f08:	0ff0000f          	fence
    80006f0c:	fffff097          	auipc	ra,0xfffff
    80006f10:	89c080e7          	jalr	-1892(ra) # 800057a8 <mycpu>
    80006f14:	01813083          	ld	ra,24(sp)
    80006f18:	01013403          	ld	s0,16(sp)
    80006f1c:	00a4b823          	sd	a0,16(s1)
    80006f20:	00013903          	ld	s2,0(sp)
    80006f24:	00813483          	ld	s1,8(sp)
    80006f28:	02010113          	addi	sp,sp,32
    80006f2c:	00008067          	ret
    80006f30:	0104b903          	ld	s2,16(s1)
    80006f34:	fffff097          	auipc	ra,0xfffff
    80006f38:	874080e7          	jalr	-1932(ra) # 800057a8 <mycpu>
    80006f3c:	faa91ce3          	bne	s2,a0,80006ef4 <acquire+0x58>
    80006f40:	00001517          	auipc	a0,0x1
    80006f44:	7d050513          	addi	a0,a0,2000 # 80008710 <digits+0x20>
    80006f48:	fffff097          	auipc	ra,0xfffff
    80006f4c:	224080e7          	jalr	548(ra) # 8000616c <panic>
    80006f50:	00195913          	srli	s2,s2,0x1
    80006f54:	fffff097          	auipc	ra,0xfffff
    80006f58:	854080e7          	jalr	-1964(ra) # 800057a8 <mycpu>
    80006f5c:	00197913          	andi	s2,s2,1
    80006f60:	07252e23          	sw	s2,124(a0)
    80006f64:	f75ff06f          	j	80006ed8 <acquire+0x3c>

0000000080006f68 <release>:
    80006f68:	fe010113          	addi	sp,sp,-32
    80006f6c:	00813823          	sd	s0,16(sp)
    80006f70:	00113c23          	sd	ra,24(sp)
    80006f74:	00913423          	sd	s1,8(sp)
    80006f78:	01213023          	sd	s2,0(sp)
    80006f7c:	02010413          	addi	s0,sp,32
    80006f80:	00052783          	lw	a5,0(a0)
    80006f84:	00079a63          	bnez	a5,80006f98 <release+0x30>
    80006f88:	00001517          	auipc	a0,0x1
    80006f8c:	79050513          	addi	a0,a0,1936 # 80008718 <digits+0x28>
    80006f90:	fffff097          	auipc	ra,0xfffff
    80006f94:	1dc080e7          	jalr	476(ra) # 8000616c <panic>
    80006f98:	01053903          	ld	s2,16(a0)
    80006f9c:	00050493          	mv	s1,a0
    80006fa0:	fffff097          	auipc	ra,0xfffff
    80006fa4:	808080e7          	jalr	-2040(ra) # 800057a8 <mycpu>
    80006fa8:	fea910e3          	bne	s2,a0,80006f88 <release+0x20>
    80006fac:	0004b823          	sd	zero,16(s1)
    80006fb0:	0ff0000f          	fence
    80006fb4:	0f50000f          	fence	iorw,ow
    80006fb8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006fbc:	ffffe097          	auipc	ra,0xffffe
    80006fc0:	7ec080e7          	jalr	2028(ra) # 800057a8 <mycpu>
    80006fc4:	100027f3          	csrr	a5,sstatus
    80006fc8:	0027f793          	andi	a5,a5,2
    80006fcc:	04079a63          	bnez	a5,80007020 <release+0xb8>
    80006fd0:	07852783          	lw	a5,120(a0)
    80006fd4:	02f05e63          	blez	a5,80007010 <release+0xa8>
    80006fd8:	fff7871b          	addiw	a4,a5,-1
    80006fdc:	06e52c23          	sw	a4,120(a0)
    80006fe0:	00071c63          	bnez	a4,80006ff8 <release+0x90>
    80006fe4:	07c52783          	lw	a5,124(a0)
    80006fe8:	00078863          	beqz	a5,80006ff8 <release+0x90>
    80006fec:	100027f3          	csrr	a5,sstatus
    80006ff0:	0027e793          	ori	a5,a5,2
    80006ff4:	10079073          	csrw	sstatus,a5
    80006ff8:	01813083          	ld	ra,24(sp)
    80006ffc:	01013403          	ld	s0,16(sp)
    80007000:	00813483          	ld	s1,8(sp)
    80007004:	00013903          	ld	s2,0(sp)
    80007008:	02010113          	addi	sp,sp,32
    8000700c:	00008067          	ret
    80007010:	00001517          	auipc	a0,0x1
    80007014:	72850513          	addi	a0,a0,1832 # 80008738 <digits+0x48>
    80007018:	fffff097          	auipc	ra,0xfffff
    8000701c:	154080e7          	jalr	340(ra) # 8000616c <panic>
    80007020:	00001517          	auipc	a0,0x1
    80007024:	70050513          	addi	a0,a0,1792 # 80008720 <digits+0x30>
    80007028:	fffff097          	auipc	ra,0xfffff
    8000702c:	144080e7          	jalr	324(ra) # 8000616c <panic>

0000000080007030 <holding>:
    80007030:	00052783          	lw	a5,0(a0)
    80007034:	00079663          	bnez	a5,80007040 <holding+0x10>
    80007038:	00000513          	li	a0,0
    8000703c:	00008067          	ret
    80007040:	fe010113          	addi	sp,sp,-32
    80007044:	00813823          	sd	s0,16(sp)
    80007048:	00913423          	sd	s1,8(sp)
    8000704c:	00113c23          	sd	ra,24(sp)
    80007050:	02010413          	addi	s0,sp,32
    80007054:	01053483          	ld	s1,16(a0)
    80007058:	ffffe097          	auipc	ra,0xffffe
    8000705c:	750080e7          	jalr	1872(ra) # 800057a8 <mycpu>
    80007060:	01813083          	ld	ra,24(sp)
    80007064:	01013403          	ld	s0,16(sp)
    80007068:	40a48533          	sub	a0,s1,a0
    8000706c:	00153513          	seqz	a0,a0
    80007070:	00813483          	ld	s1,8(sp)
    80007074:	02010113          	addi	sp,sp,32
    80007078:	00008067          	ret

000000008000707c <push_off>:
    8000707c:	fe010113          	addi	sp,sp,-32
    80007080:	00813823          	sd	s0,16(sp)
    80007084:	00113c23          	sd	ra,24(sp)
    80007088:	00913423          	sd	s1,8(sp)
    8000708c:	02010413          	addi	s0,sp,32
    80007090:	100024f3          	csrr	s1,sstatus
    80007094:	100027f3          	csrr	a5,sstatus
    80007098:	ffd7f793          	andi	a5,a5,-3
    8000709c:	10079073          	csrw	sstatus,a5
    800070a0:	ffffe097          	auipc	ra,0xffffe
    800070a4:	708080e7          	jalr	1800(ra) # 800057a8 <mycpu>
    800070a8:	07852783          	lw	a5,120(a0)
    800070ac:	02078663          	beqz	a5,800070d8 <push_off+0x5c>
    800070b0:	ffffe097          	auipc	ra,0xffffe
    800070b4:	6f8080e7          	jalr	1784(ra) # 800057a8 <mycpu>
    800070b8:	07852783          	lw	a5,120(a0)
    800070bc:	01813083          	ld	ra,24(sp)
    800070c0:	01013403          	ld	s0,16(sp)
    800070c4:	0017879b          	addiw	a5,a5,1
    800070c8:	06f52c23          	sw	a5,120(a0)
    800070cc:	00813483          	ld	s1,8(sp)
    800070d0:	02010113          	addi	sp,sp,32
    800070d4:	00008067          	ret
    800070d8:	0014d493          	srli	s1,s1,0x1
    800070dc:	ffffe097          	auipc	ra,0xffffe
    800070e0:	6cc080e7          	jalr	1740(ra) # 800057a8 <mycpu>
    800070e4:	0014f493          	andi	s1,s1,1
    800070e8:	06952e23          	sw	s1,124(a0)
    800070ec:	fc5ff06f          	j	800070b0 <push_off+0x34>

00000000800070f0 <pop_off>:
    800070f0:	ff010113          	addi	sp,sp,-16
    800070f4:	00813023          	sd	s0,0(sp)
    800070f8:	00113423          	sd	ra,8(sp)
    800070fc:	01010413          	addi	s0,sp,16
    80007100:	ffffe097          	auipc	ra,0xffffe
    80007104:	6a8080e7          	jalr	1704(ra) # 800057a8 <mycpu>
    80007108:	100027f3          	csrr	a5,sstatus
    8000710c:	0027f793          	andi	a5,a5,2
    80007110:	04079663          	bnez	a5,8000715c <pop_off+0x6c>
    80007114:	07852783          	lw	a5,120(a0)
    80007118:	02f05a63          	blez	a5,8000714c <pop_off+0x5c>
    8000711c:	fff7871b          	addiw	a4,a5,-1
    80007120:	06e52c23          	sw	a4,120(a0)
    80007124:	00071c63          	bnez	a4,8000713c <pop_off+0x4c>
    80007128:	07c52783          	lw	a5,124(a0)
    8000712c:	00078863          	beqz	a5,8000713c <pop_off+0x4c>
    80007130:	100027f3          	csrr	a5,sstatus
    80007134:	0027e793          	ori	a5,a5,2
    80007138:	10079073          	csrw	sstatus,a5
    8000713c:	00813083          	ld	ra,8(sp)
    80007140:	00013403          	ld	s0,0(sp)
    80007144:	01010113          	addi	sp,sp,16
    80007148:	00008067          	ret
    8000714c:	00001517          	auipc	a0,0x1
    80007150:	5ec50513          	addi	a0,a0,1516 # 80008738 <digits+0x48>
    80007154:	fffff097          	auipc	ra,0xfffff
    80007158:	018080e7          	jalr	24(ra) # 8000616c <panic>
    8000715c:	00001517          	auipc	a0,0x1
    80007160:	5c450513          	addi	a0,a0,1476 # 80008720 <digits+0x30>
    80007164:	fffff097          	auipc	ra,0xfffff
    80007168:	008080e7          	jalr	8(ra) # 8000616c <panic>

000000008000716c <push_on>:
    8000716c:	fe010113          	addi	sp,sp,-32
    80007170:	00813823          	sd	s0,16(sp)
    80007174:	00113c23          	sd	ra,24(sp)
    80007178:	00913423          	sd	s1,8(sp)
    8000717c:	02010413          	addi	s0,sp,32
    80007180:	100024f3          	csrr	s1,sstatus
    80007184:	100027f3          	csrr	a5,sstatus
    80007188:	0027e793          	ori	a5,a5,2
    8000718c:	10079073          	csrw	sstatus,a5
    80007190:	ffffe097          	auipc	ra,0xffffe
    80007194:	618080e7          	jalr	1560(ra) # 800057a8 <mycpu>
    80007198:	07852783          	lw	a5,120(a0)
    8000719c:	02078663          	beqz	a5,800071c8 <push_on+0x5c>
    800071a0:	ffffe097          	auipc	ra,0xffffe
    800071a4:	608080e7          	jalr	1544(ra) # 800057a8 <mycpu>
    800071a8:	07852783          	lw	a5,120(a0)
    800071ac:	01813083          	ld	ra,24(sp)
    800071b0:	01013403          	ld	s0,16(sp)
    800071b4:	0017879b          	addiw	a5,a5,1
    800071b8:	06f52c23          	sw	a5,120(a0)
    800071bc:	00813483          	ld	s1,8(sp)
    800071c0:	02010113          	addi	sp,sp,32
    800071c4:	00008067          	ret
    800071c8:	0014d493          	srli	s1,s1,0x1
    800071cc:	ffffe097          	auipc	ra,0xffffe
    800071d0:	5dc080e7          	jalr	1500(ra) # 800057a8 <mycpu>
    800071d4:	0014f493          	andi	s1,s1,1
    800071d8:	06952e23          	sw	s1,124(a0)
    800071dc:	fc5ff06f          	j	800071a0 <push_on+0x34>

00000000800071e0 <pop_on>:
    800071e0:	ff010113          	addi	sp,sp,-16
    800071e4:	00813023          	sd	s0,0(sp)
    800071e8:	00113423          	sd	ra,8(sp)
    800071ec:	01010413          	addi	s0,sp,16
    800071f0:	ffffe097          	auipc	ra,0xffffe
    800071f4:	5b8080e7          	jalr	1464(ra) # 800057a8 <mycpu>
    800071f8:	100027f3          	csrr	a5,sstatus
    800071fc:	0027f793          	andi	a5,a5,2
    80007200:	04078463          	beqz	a5,80007248 <pop_on+0x68>
    80007204:	07852783          	lw	a5,120(a0)
    80007208:	02f05863          	blez	a5,80007238 <pop_on+0x58>
    8000720c:	fff7879b          	addiw	a5,a5,-1
    80007210:	06f52c23          	sw	a5,120(a0)
    80007214:	07853783          	ld	a5,120(a0)
    80007218:	00079863          	bnez	a5,80007228 <pop_on+0x48>
    8000721c:	100027f3          	csrr	a5,sstatus
    80007220:	ffd7f793          	andi	a5,a5,-3
    80007224:	10079073          	csrw	sstatus,a5
    80007228:	00813083          	ld	ra,8(sp)
    8000722c:	00013403          	ld	s0,0(sp)
    80007230:	01010113          	addi	sp,sp,16
    80007234:	00008067          	ret
    80007238:	00001517          	auipc	a0,0x1
    8000723c:	52850513          	addi	a0,a0,1320 # 80008760 <digits+0x70>
    80007240:	fffff097          	auipc	ra,0xfffff
    80007244:	f2c080e7          	jalr	-212(ra) # 8000616c <panic>
    80007248:	00001517          	auipc	a0,0x1
    8000724c:	4f850513          	addi	a0,a0,1272 # 80008740 <digits+0x50>
    80007250:	fffff097          	auipc	ra,0xfffff
    80007254:	f1c080e7          	jalr	-228(ra) # 8000616c <panic>

0000000080007258 <__memset>:
    80007258:	ff010113          	addi	sp,sp,-16
    8000725c:	00813423          	sd	s0,8(sp)
    80007260:	01010413          	addi	s0,sp,16
    80007264:	1a060e63          	beqz	a2,80007420 <__memset+0x1c8>
    80007268:	40a007b3          	neg	a5,a0
    8000726c:	0077f793          	andi	a5,a5,7
    80007270:	00778693          	addi	a3,a5,7
    80007274:	00b00813          	li	a6,11
    80007278:	0ff5f593          	andi	a1,a1,255
    8000727c:	fff6071b          	addiw	a4,a2,-1
    80007280:	1b06e663          	bltu	a3,a6,8000742c <__memset+0x1d4>
    80007284:	1cd76463          	bltu	a4,a3,8000744c <__memset+0x1f4>
    80007288:	1a078e63          	beqz	a5,80007444 <__memset+0x1ec>
    8000728c:	00b50023          	sb	a1,0(a0)
    80007290:	00100713          	li	a4,1
    80007294:	1ae78463          	beq	a5,a4,8000743c <__memset+0x1e4>
    80007298:	00b500a3          	sb	a1,1(a0)
    8000729c:	00200713          	li	a4,2
    800072a0:	1ae78a63          	beq	a5,a4,80007454 <__memset+0x1fc>
    800072a4:	00b50123          	sb	a1,2(a0)
    800072a8:	00300713          	li	a4,3
    800072ac:	18e78463          	beq	a5,a4,80007434 <__memset+0x1dc>
    800072b0:	00b501a3          	sb	a1,3(a0)
    800072b4:	00400713          	li	a4,4
    800072b8:	1ae78263          	beq	a5,a4,8000745c <__memset+0x204>
    800072bc:	00b50223          	sb	a1,4(a0)
    800072c0:	00500713          	li	a4,5
    800072c4:	1ae78063          	beq	a5,a4,80007464 <__memset+0x20c>
    800072c8:	00b502a3          	sb	a1,5(a0)
    800072cc:	00700713          	li	a4,7
    800072d0:	18e79e63          	bne	a5,a4,8000746c <__memset+0x214>
    800072d4:	00b50323          	sb	a1,6(a0)
    800072d8:	00700e93          	li	t4,7
    800072dc:	00859713          	slli	a4,a1,0x8
    800072e0:	00e5e733          	or	a4,a1,a4
    800072e4:	01059e13          	slli	t3,a1,0x10
    800072e8:	01c76e33          	or	t3,a4,t3
    800072ec:	01859313          	slli	t1,a1,0x18
    800072f0:	006e6333          	or	t1,t3,t1
    800072f4:	02059893          	slli	a7,a1,0x20
    800072f8:	40f60e3b          	subw	t3,a2,a5
    800072fc:	011368b3          	or	a7,t1,a7
    80007300:	02859813          	slli	a6,a1,0x28
    80007304:	0108e833          	or	a6,a7,a6
    80007308:	03059693          	slli	a3,a1,0x30
    8000730c:	003e589b          	srliw	a7,t3,0x3
    80007310:	00d866b3          	or	a3,a6,a3
    80007314:	03859713          	slli	a4,a1,0x38
    80007318:	00389813          	slli	a6,a7,0x3
    8000731c:	00f507b3          	add	a5,a0,a5
    80007320:	00e6e733          	or	a4,a3,a4
    80007324:	000e089b          	sext.w	a7,t3
    80007328:	00f806b3          	add	a3,a6,a5
    8000732c:	00e7b023          	sd	a4,0(a5)
    80007330:	00878793          	addi	a5,a5,8
    80007334:	fed79ce3          	bne	a5,a3,8000732c <__memset+0xd4>
    80007338:	ff8e7793          	andi	a5,t3,-8
    8000733c:	0007871b          	sext.w	a4,a5
    80007340:	01d787bb          	addw	a5,a5,t4
    80007344:	0ce88e63          	beq	a7,a4,80007420 <__memset+0x1c8>
    80007348:	00f50733          	add	a4,a0,a5
    8000734c:	00b70023          	sb	a1,0(a4)
    80007350:	0017871b          	addiw	a4,a5,1
    80007354:	0cc77663          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    80007358:	00e50733          	add	a4,a0,a4
    8000735c:	00b70023          	sb	a1,0(a4)
    80007360:	0027871b          	addiw	a4,a5,2
    80007364:	0ac77e63          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    80007368:	00e50733          	add	a4,a0,a4
    8000736c:	00b70023          	sb	a1,0(a4)
    80007370:	0037871b          	addiw	a4,a5,3
    80007374:	0ac77663          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    80007378:	00e50733          	add	a4,a0,a4
    8000737c:	00b70023          	sb	a1,0(a4)
    80007380:	0047871b          	addiw	a4,a5,4
    80007384:	08c77e63          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    80007388:	00e50733          	add	a4,a0,a4
    8000738c:	00b70023          	sb	a1,0(a4)
    80007390:	0057871b          	addiw	a4,a5,5
    80007394:	08c77663          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    80007398:	00e50733          	add	a4,a0,a4
    8000739c:	00b70023          	sb	a1,0(a4)
    800073a0:	0067871b          	addiw	a4,a5,6
    800073a4:	06c77e63          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    800073a8:	00e50733          	add	a4,a0,a4
    800073ac:	00b70023          	sb	a1,0(a4)
    800073b0:	0077871b          	addiw	a4,a5,7
    800073b4:	06c77663          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    800073b8:	00e50733          	add	a4,a0,a4
    800073bc:	00b70023          	sb	a1,0(a4)
    800073c0:	0087871b          	addiw	a4,a5,8
    800073c4:	04c77e63          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    800073c8:	00e50733          	add	a4,a0,a4
    800073cc:	00b70023          	sb	a1,0(a4)
    800073d0:	0097871b          	addiw	a4,a5,9
    800073d4:	04c77663          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    800073d8:	00e50733          	add	a4,a0,a4
    800073dc:	00b70023          	sb	a1,0(a4)
    800073e0:	00a7871b          	addiw	a4,a5,10
    800073e4:	02c77e63          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    800073e8:	00e50733          	add	a4,a0,a4
    800073ec:	00b70023          	sb	a1,0(a4)
    800073f0:	00b7871b          	addiw	a4,a5,11
    800073f4:	02c77663          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    800073f8:	00e50733          	add	a4,a0,a4
    800073fc:	00b70023          	sb	a1,0(a4)
    80007400:	00c7871b          	addiw	a4,a5,12
    80007404:	00c77e63          	bgeu	a4,a2,80007420 <__memset+0x1c8>
    80007408:	00e50733          	add	a4,a0,a4
    8000740c:	00b70023          	sb	a1,0(a4)
    80007410:	00d7879b          	addiw	a5,a5,13
    80007414:	00c7f663          	bgeu	a5,a2,80007420 <__memset+0x1c8>
    80007418:	00f507b3          	add	a5,a0,a5
    8000741c:	00b78023          	sb	a1,0(a5)
    80007420:	00813403          	ld	s0,8(sp)
    80007424:	01010113          	addi	sp,sp,16
    80007428:	00008067          	ret
    8000742c:	00b00693          	li	a3,11
    80007430:	e55ff06f          	j	80007284 <__memset+0x2c>
    80007434:	00300e93          	li	t4,3
    80007438:	ea5ff06f          	j	800072dc <__memset+0x84>
    8000743c:	00100e93          	li	t4,1
    80007440:	e9dff06f          	j	800072dc <__memset+0x84>
    80007444:	00000e93          	li	t4,0
    80007448:	e95ff06f          	j	800072dc <__memset+0x84>
    8000744c:	00000793          	li	a5,0
    80007450:	ef9ff06f          	j	80007348 <__memset+0xf0>
    80007454:	00200e93          	li	t4,2
    80007458:	e85ff06f          	j	800072dc <__memset+0x84>
    8000745c:	00400e93          	li	t4,4
    80007460:	e7dff06f          	j	800072dc <__memset+0x84>
    80007464:	00500e93          	li	t4,5
    80007468:	e75ff06f          	j	800072dc <__memset+0x84>
    8000746c:	00600e93          	li	t4,6
    80007470:	e6dff06f          	j	800072dc <__memset+0x84>

0000000080007474 <__memmove>:
    80007474:	ff010113          	addi	sp,sp,-16
    80007478:	00813423          	sd	s0,8(sp)
    8000747c:	01010413          	addi	s0,sp,16
    80007480:	0e060863          	beqz	a2,80007570 <__memmove+0xfc>
    80007484:	fff6069b          	addiw	a3,a2,-1
    80007488:	0006881b          	sext.w	a6,a3
    8000748c:	0ea5e863          	bltu	a1,a0,8000757c <__memmove+0x108>
    80007490:	00758713          	addi	a4,a1,7
    80007494:	00a5e7b3          	or	a5,a1,a0
    80007498:	40a70733          	sub	a4,a4,a0
    8000749c:	0077f793          	andi	a5,a5,7
    800074a0:	00f73713          	sltiu	a4,a4,15
    800074a4:	00174713          	xori	a4,a4,1
    800074a8:	0017b793          	seqz	a5,a5
    800074ac:	00e7f7b3          	and	a5,a5,a4
    800074b0:	10078863          	beqz	a5,800075c0 <__memmove+0x14c>
    800074b4:	00900793          	li	a5,9
    800074b8:	1107f463          	bgeu	a5,a6,800075c0 <__memmove+0x14c>
    800074bc:	0036581b          	srliw	a6,a2,0x3
    800074c0:	fff8081b          	addiw	a6,a6,-1
    800074c4:	02081813          	slli	a6,a6,0x20
    800074c8:	01d85893          	srli	a7,a6,0x1d
    800074cc:	00858813          	addi	a6,a1,8
    800074d0:	00058793          	mv	a5,a1
    800074d4:	00050713          	mv	a4,a0
    800074d8:	01088833          	add	a6,a7,a6
    800074dc:	0007b883          	ld	a7,0(a5)
    800074e0:	00878793          	addi	a5,a5,8
    800074e4:	00870713          	addi	a4,a4,8
    800074e8:	ff173c23          	sd	a7,-8(a4)
    800074ec:	ff0798e3          	bne	a5,a6,800074dc <__memmove+0x68>
    800074f0:	ff867713          	andi	a4,a2,-8
    800074f4:	02071793          	slli	a5,a4,0x20
    800074f8:	0207d793          	srli	a5,a5,0x20
    800074fc:	00f585b3          	add	a1,a1,a5
    80007500:	40e686bb          	subw	a3,a3,a4
    80007504:	00f507b3          	add	a5,a0,a5
    80007508:	06e60463          	beq	a2,a4,80007570 <__memmove+0xfc>
    8000750c:	0005c703          	lbu	a4,0(a1)
    80007510:	00e78023          	sb	a4,0(a5)
    80007514:	04068e63          	beqz	a3,80007570 <__memmove+0xfc>
    80007518:	0015c603          	lbu	a2,1(a1)
    8000751c:	00100713          	li	a4,1
    80007520:	00c780a3          	sb	a2,1(a5)
    80007524:	04e68663          	beq	a3,a4,80007570 <__memmove+0xfc>
    80007528:	0025c603          	lbu	a2,2(a1)
    8000752c:	00200713          	li	a4,2
    80007530:	00c78123          	sb	a2,2(a5)
    80007534:	02e68e63          	beq	a3,a4,80007570 <__memmove+0xfc>
    80007538:	0035c603          	lbu	a2,3(a1)
    8000753c:	00300713          	li	a4,3
    80007540:	00c781a3          	sb	a2,3(a5)
    80007544:	02e68663          	beq	a3,a4,80007570 <__memmove+0xfc>
    80007548:	0045c603          	lbu	a2,4(a1)
    8000754c:	00400713          	li	a4,4
    80007550:	00c78223          	sb	a2,4(a5)
    80007554:	00e68e63          	beq	a3,a4,80007570 <__memmove+0xfc>
    80007558:	0055c603          	lbu	a2,5(a1)
    8000755c:	00500713          	li	a4,5
    80007560:	00c782a3          	sb	a2,5(a5)
    80007564:	00e68663          	beq	a3,a4,80007570 <__memmove+0xfc>
    80007568:	0065c703          	lbu	a4,6(a1)
    8000756c:	00e78323          	sb	a4,6(a5)
    80007570:	00813403          	ld	s0,8(sp)
    80007574:	01010113          	addi	sp,sp,16
    80007578:	00008067          	ret
    8000757c:	02061713          	slli	a4,a2,0x20
    80007580:	02075713          	srli	a4,a4,0x20
    80007584:	00e587b3          	add	a5,a1,a4
    80007588:	f0f574e3          	bgeu	a0,a5,80007490 <__memmove+0x1c>
    8000758c:	02069613          	slli	a2,a3,0x20
    80007590:	02065613          	srli	a2,a2,0x20
    80007594:	fff64613          	not	a2,a2
    80007598:	00e50733          	add	a4,a0,a4
    8000759c:	00c78633          	add	a2,a5,a2
    800075a0:	fff7c683          	lbu	a3,-1(a5)
    800075a4:	fff78793          	addi	a5,a5,-1
    800075a8:	fff70713          	addi	a4,a4,-1
    800075ac:	00d70023          	sb	a3,0(a4)
    800075b0:	fec798e3          	bne	a5,a2,800075a0 <__memmove+0x12c>
    800075b4:	00813403          	ld	s0,8(sp)
    800075b8:	01010113          	addi	sp,sp,16
    800075bc:	00008067          	ret
    800075c0:	02069713          	slli	a4,a3,0x20
    800075c4:	02075713          	srli	a4,a4,0x20
    800075c8:	00170713          	addi	a4,a4,1
    800075cc:	00e50733          	add	a4,a0,a4
    800075d0:	00050793          	mv	a5,a0
    800075d4:	0005c683          	lbu	a3,0(a1)
    800075d8:	00178793          	addi	a5,a5,1
    800075dc:	00158593          	addi	a1,a1,1
    800075e0:	fed78fa3          	sb	a3,-1(a5)
    800075e4:	fee798e3          	bne	a5,a4,800075d4 <__memmove+0x160>
    800075e8:	f89ff06f          	j	80007570 <__memmove+0xfc>

00000000800075ec <__putc>:
    800075ec:	fe010113          	addi	sp,sp,-32
    800075f0:	00813823          	sd	s0,16(sp)
    800075f4:	00113c23          	sd	ra,24(sp)
    800075f8:	02010413          	addi	s0,sp,32
    800075fc:	00050793          	mv	a5,a0
    80007600:	fef40593          	addi	a1,s0,-17
    80007604:	00100613          	li	a2,1
    80007608:	00000513          	li	a0,0
    8000760c:	fef407a3          	sb	a5,-17(s0)
    80007610:	fffff097          	auipc	ra,0xfffff
    80007614:	b3c080e7          	jalr	-1220(ra) # 8000614c <console_write>
    80007618:	01813083          	ld	ra,24(sp)
    8000761c:	01013403          	ld	s0,16(sp)
    80007620:	02010113          	addi	sp,sp,32
    80007624:	00008067          	ret

0000000080007628 <__getc>:
    80007628:	fe010113          	addi	sp,sp,-32
    8000762c:	00813823          	sd	s0,16(sp)
    80007630:	00113c23          	sd	ra,24(sp)
    80007634:	02010413          	addi	s0,sp,32
    80007638:	fe840593          	addi	a1,s0,-24
    8000763c:	00100613          	li	a2,1
    80007640:	00000513          	li	a0,0
    80007644:	fffff097          	auipc	ra,0xfffff
    80007648:	ae8080e7          	jalr	-1304(ra) # 8000612c <console_read>
    8000764c:	fe844503          	lbu	a0,-24(s0)
    80007650:	01813083          	ld	ra,24(sp)
    80007654:	01013403          	ld	s0,16(sp)
    80007658:	02010113          	addi	sp,sp,32
    8000765c:	00008067          	ret

0000000080007660 <console_handler>:
    80007660:	fe010113          	addi	sp,sp,-32
    80007664:	00813823          	sd	s0,16(sp)
    80007668:	00113c23          	sd	ra,24(sp)
    8000766c:	00913423          	sd	s1,8(sp)
    80007670:	02010413          	addi	s0,sp,32
    80007674:	14202773          	csrr	a4,scause
    80007678:	100027f3          	csrr	a5,sstatus
    8000767c:	0027f793          	andi	a5,a5,2
    80007680:	06079e63          	bnez	a5,800076fc <console_handler+0x9c>
    80007684:	00074c63          	bltz	a4,8000769c <console_handler+0x3c>
    80007688:	01813083          	ld	ra,24(sp)
    8000768c:	01013403          	ld	s0,16(sp)
    80007690:	00813483          	ld	s1,8(sp)
    80007694:	02010113          	addi	sp,sp,32
    80007698:	00008067          	ret
    8000769c:	0ff77713          	andi	a4,a4,255
    800076a0:	00900793          	li	a5,9
    800076a4:	fef712e3          	bne	a4,a5,80007688 <console_handler+0x28>
    800076a8:	ffffe097          	auipc	ra,0xffffe
    800076ac:	6dc080e7          	jalr	1756(ra) # 80005d84 <plic_claim>
    800076b0:	00a00793          	li	a5,10
    800076b4:	00050493          	mv	s1,a0
    800076b8:	02f50c63          	beq	a0,a5,800076f0 <console_handler+0x90>
    800076bc:	fc0506e3          	beqz	a0,80007688 <console_handler+0x28>
    800076c0:	00050593          	mv	a1,a0
    800076c4:	00001517          	auipc	a0,0x1
    800076c8:	fa450513          	addi	a0,a0,-92 # 80008668 <CONSOLE_STATUS+0x658>
    800076cc:	fffff097          	auipc	ra,0xfffff
    800076d0:	afc080e7          	jalr	-1284(ra) # 800061c8 <__printf>
    800076d4:	01013403          	ld	s0,16(sp)
    800076d8:	01813083          	ld	ra,24(sp)
    800076dc:	00048513          	mv	a0,s1
    800076e0:	00813483          	ld	s1,8(sp)
    800076e4:	02010113          	addi	sp,sp,32
    800076e8:	ffffe317          	auipc	t1,0xffffe
    800076ec:	6d430067          	jr	1748(t1) # 80005dbc <plic_complete>
    800076f0:	fffff097          	auipc	ra,0xfffff
    800076f4:	3e0080e7          	jalr	992(ra) # 80006ad0 <uartintr>
    800076f8:	fddff06f          	j	800076d4 <console_handler+0x74>
    800076fc:	00001517          	auipc	a0,0x1
    80007700:	06c50513          	addi	a0,a0,108 # 80008768 <digits+0x78>
    80007704:	fffff097          	auipc	ra,0xfffff
    80007708:	a68080e7          	jalr	-1432(ra) # 8000616c <panic>
	...
