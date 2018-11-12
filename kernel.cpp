
void print(char* str) {
	int i=0;
	unsigned short* VideoMemArray = (unsigned short*)0xb8000;
	
	for(; str[i] != '\0'; i++) {
		VideoMemArray[i] = (VideoMemArray[i] & 0xFF0) | str[i];
	}
}

extern "C" void start(void* multiboot_struct, unsigned int kernel_boot_number) {
	print("Heimdall Kernel it's working!");
	while(1);
}