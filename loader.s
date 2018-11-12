
.set KERNEL_BOOT_NUMBER, 0x1BADB002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(KERNEL_BOOT_NUMBER + FLAGS)

.section .multiboot
	.long KERNEL_BOOT_NUMBER
	.long FLAGS
	.long CHECKSUM

.section .text
.extern start
.global loader


loader:
	mov $kernel_stack, %esp
	push %eax
	push %ebx
	call start


_stop:
	cli
	hlt
	jmp _stop


.section .bss
# jump 2mb of ram before the kernel stack
.space 2*1024*1024


kernel_stack:
