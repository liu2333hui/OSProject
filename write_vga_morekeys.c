#define COL8_000000 0
#define COL8_FF0000 1
#define COL8_00FF00 2 
#define COL8_FFFF00 3
#define COL8_0000FF 4
#define COL8_FF00FF 5
#define COL8_00FFFF 6
#define COL8_FFFFFF 7
#define COL8_C6C6C6 8
#define COL8_840000 9
#define COL8_008400 10
#define COL8_848400 11
#define COL8_000084 12
#define COL8_840084 13
#define COL8_008484 14
#define COL8_848484 15

#define PORT_KEYDAT 0x0060
#define PIC_OCW2    0x20

extern char systemFont[16];

void io_hlt(void);
void io_cli(void);
//void io_out8(int port, int data);
//int io_in8(int port);
void io_sti(void);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void show_char(void);

void init_palette(void);
void set_palette(int start, int end,
		unsigned char* rgb);
void boxfill8(unsigned char * vram, int xsize, unsigned char c, int x, int y, int x0, int y0);


struct BOOTINFO {
	char* vgaRam;
	short screenX, screenY;
};
void initBootInfo(struct BOOTINFO *pBootInfo);

void showChar8(char *vram, int xsize, int x, int y, char c, char* font);

void showString(char *vram, int xsize, int x, int y, char c, unsigned char*s);

void putblock(char* vram, int vxsize, int pxsize, int pysize, int px0, int py0,
		char* buf, int bxsize);
char charToHexVal(char c);
char* charToHexStr(unsigned char c);

void init_mouse_cursor(char* mouse, char bc);
void intHandlerFromC(char* esp);

static char keyvalue[5] = {'0', 'X', 0, 0, 0};
static char mcursor[256];
static struct BOOTINFO bootInfo;

//static char PORT_KEYDAT = 0x60;
//static char PIC_OCW2    = 0x20;

void CMain(void){
	initBootInfo(&bootInfo);
	char* p = bootInfo.vgaRam;
	int xsize = bootInfo.screenX;
	int ysize = bootInfo.screenY;
	
	//char *p = (char *) 0xa0000; //Start address for vram
	//int xsize = 320, ysize = 200;

	init_palette();

	//Paint background
	boxfill8(p, xsize, COL8_008484,
		       	0, 0, 
			xsize-1, ysize-29);

	//Paint horizontal line
	boxfill8(p, xsize, COL8_C6C6C6,
		       	0, ysize - 28, 
			xsize-1, ysize-28);
	boxfill8(p, xsize, COL8_FFFFFF,
			0, ysize-27,
			xsize-1, ysize-27);

	//Paint lower task bar
	boxfill8(p, xsize, COL8_C6C6C6,
			0, ysize-26,
			xsize-1, ysize-1);
	
	//Paint lower left button
	boxfill8(p, xsize, COL8_FFFFFF,
			3, ysize-24,
			59, ysize-24);
	boxfill8(p, xsize, COL8_FFFFFF,
			2, ysize-24,
			2, ysize-4);
	boxfill8(p, xsize, COL8_848484,
			3, ysize-4,
			59, ysize-4);
	boxfill8(p, xsize, COL8_848484,
			59, ysize-23,
			59, ysize-5);
	boxfill8(p, xsize, COL8_000000,
			2, ysize-3,
			59, ysize-3);
	boxfill8(p, xsize, COL8_000000,
			60, ysize-24,
			60, ysize-3);
		
	
	//paint lower right button
	boxfill8(p, xsize, COL8_FFFFFF,
			xsize-47, ysize-3,
			xsize-4, ysize-3);
	boxfill8(p, xsize, COL8_FFFFFF,
			xsize-3, ysize-24,
			xsize-3, ysize-4);
	boxfill8(p, xsize, COL8_848484,
			xsize-47, ysize-24,
			xsize-4, ysize-24);
	boxfill8(p, xsize, COL8_848484,
			xsize-47, ysize-23,
			xsize-47, ysize-4);
	
	//Show some fonts
	showChar8(p, xsize, 8, 8, COL8_FFFFFF, systemFont + 'A'*16);		
	showChar8(p, xsize, 2*8, 8, COL8_FFFFFF, systemFont + 'B'*16);
	showChar8(p, xsize, 3*8, 8, COL8_FFFFFF, systemFont + 'C'*16);
	showChar8(p, xsize, 5*8, 8, COL8_FFFFFF, systemFont + '3'*16);
	showChar8(p, xsize, 6*8, 8, COL8_FFFFFF, systemFont + '2'*16);

	showString(p, xsize, 8, 64, COL8_FFFFFF, "text!");

	init_mouse_cursor(mcursor, COL8_008484);	
	putblock(p, xsize, 16, 16, 80, 80, mcursor, 16);

	io_sti(); //Recover the interrupt service

	for(;;){
		io_hlt();
	}

}

void initBootInfo(struct BOOTINFO *pBootInfo){
	pBootInfo->vgaRam = (char*) 0xa0000;
	pBootInfo->screenX = 320;
	pBootInfo->screenY = 200;
}

void init_palette(void){
static  unsigned char table_rgb[16 *3] = {
        0x00,  0x00,  0x00,
        0xff,  0x00,  0x00,
        0x00,  0xff,  0x00,
        0xff,  0xff,  0x00,
        0x00,  0x00,  0xff,
        0xff,  0x00,  0xff,
        0x00,  0xff,  0xff,
        0xff,  0xff,  0xff,
        0xc6,  0xc6,  0xc6,
        0x84,  0x00,  0x00,
        0x00,  0x84,  0x00,
        0x84,  0x84,  0x00,
        0x00,  0x00,  0x84,
        0x84,  0x00,  0x84,
        0x00,  0x84,  0x84,
        0x84,  0x84,  0x84,
    };


	set_palette(0, 15, table_rgb);
	return;
}

void set_palette(int start, int end, unsigned char* rgb){
	int i, eflags;
	eflags = io_load_eflags();

	io_cli();

	io_out8(0x03c8, start); //set palette number
	for(i = start; i <= end; i++){
		io_out8(0x03c9, rgb[0] >> 2);
		io_out8(0x03c9, rgb[1] >> 2);
		io_out8(0x03c9, rgb[2] >> 2);

		rgb+=3;

	}

	io_store_eflags(eflags);
	return;
}

void boxfill8(unsigned char* vram, int xsize, unsigned char c,
		int x0, int y0, int x1, int y1){
	int x, y;
	for(y = y0; y <= y1; y++){
		for(x = x0; x <= x1; x++){
			vram[y*xsize + x] = c;
		}	
	}	


}

void showString(char *vram, int xsize, int x, int y, char c, unsigned char*s){
	
	while(*s != 0x00){
		
		showChar8(vram, xsize, x, y, c, systemFont + (*s)*16);
		s++;
		x+=8;

	}


}

void showChar8(char *vram, int xsize, int x, int y, char c, char* font){
	int i;
	char d;

	//write line by line
	for(i = 0; i < 16; i++){
		d = *(font + i);	
		//d = font[i];
		if((d & 0x80) != 0) {vram[(y+i)*xsize + x +  0] = c; }	
		if((d & 0x40) != 0) {vram[(y+i)*xsize + x + 1] = c; }	
		if((d & 0x20) != 0) {vram[(y+i)*xsize + x + 2] = c; }	
		if((d & 0x10) != 0) {vram[(y+i)*xsize + x +  3] = c; }	
		if((d & 0x08) != 0) {vram[(y+i)*xsize + x + 4] = c; }	
		if((d & 0x04) != 0) {vram[(y+i)*xsize + x + 5] = c; }	
		if((d & 0x02) != 0) {vram[(y+i)*xsize + x + 6] = c; }	
		if((d & 0x01) != 0) {vram[(y+i)*xsize + x + 7] = c; }	

	}	

}

void init_mouse_cursor(char* mouse, char bc){
	static char cursor[16][16] = {
        "**************..",
        "*OOOOOOOOOOO*...",
        "*OOOOOOOOOO*....",
        "*OOOOOOOOO*.....",
        "*OOOOOOOO*......",
        "*OOOOOOO*.......",
        "*OOOOOOO*.......",
        "*OOOOOOOO*......",
        "*OOOO**OOO*.....",
        "*OOO*..*OOO*....",
        "*OO*....*OOO*...",
        "*O*......*OOO*..",
        "**........*OOO*.",
        "*..........*OOO*",
        "............*OO*",
        ".............***"
	};

	int x, y;
	for(y = 0; y < 16; y++){
		for(x = 0; x < 16; x++){
			if(cursor[y][x] == '*'){
				mouse[y*16 + x] = COL8_000000;
			}
			else if(cursor[y][x] == 'O'){
				mouse[y*16+x] = COL8_FFFFFF;
			}
			else if(cursor[y][x] == '.'){
				mouse[y*16 + x] = bc;
			}
		}
	}

}

//vram = video ram pointer
//vxsize = size of row of video memory space
//pxsize, pysize (size of sprite/data)
//px0, py0 (upper left corner of sprite)
//buf (sprite data)
//bxsize = size of row of sprite data space
//GOAL: move the buffer into the appropriate space in the vram
void putblock(char* vram, int vxsize, int pxsize, int pysize, int px0, int py0,
		char* buf, int bxsize){

int i, j;
	for(j = 0; j < pysize; j++){
	for(i = 0; i < pxsize; i++){
			vram[(py0 + j)*vxsize + (px0 + i) ] 
				= buf[(j)*bxsize + (i)];	
	}
	}
}


void intHandlerFromC(char* esp){
	char* vram = bootInfo.vgaRam;
	int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

	//Interrupt one (keyboard) corresponds to 0x21
	io_out8(PIC_OCW2, 0x21);

	unsigned char data = 0;
	data = io_in8(PORT_KEYDAT);
	
	char* pStr = charToHexStr(data);
	
	//static int showPos = 0;
	int showPos = 0;
	showString(vram, xsize, showPos, 0, COL8_FFFFFF, pStr);
	//showPos += 32;	
}

char charToHexVal(char c){
	if (c >= 10){
		return 'A' + c - 10;
	}
	return '0' + c;
}

char* charToHexStr(unsigned char c){
	int i = 0;
	char mod = c % 16;
	keyvalue[3] = charToHexVal(mod);	
	c = (c >> 4);
	keyvalue[2] = charToHexVal(c);

	return keyvalue;
}
