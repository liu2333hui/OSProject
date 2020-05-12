struct TSS32{
	int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
	int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
	int es, cs, ss, ds, fs, gs;
	int ldtr, iomap;
};

struct SEGMENT_DESCRIPTOR{
	short limit_low, base_low;
	char base_mid, access_right;
	char limit_high, base_high;
};

void set_segmdesc(struct SEGMENT_DESCRIPTOR* sd,
		unsigned int limit,
		int base,
		int ar);

#define AR_TSS32 0x0089
