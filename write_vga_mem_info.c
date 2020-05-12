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

#define PORT_KEYDAT 0x60   //keyboard/mouse port
#define PIC1_OCW2   0xA0
#define PIC_OCW2    0x20

#define PORT_KEYSTA 0x64   //mouse port
#define PORT_KEYCMD 0x64
#define KEYSTA_SENT_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE 0x47


extern char systemFont[16];

void io_hlt(void);
void io_cli(void);
void io_out(int port, int data);

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
void init_mouse_cursor(char* mouse, char bc);
void intHandlerFromC(char* esp);

static char mcursor[256];
static struct BOOTINFO bootInfo;
static char keyval[5] = {'0', 'x', 0, 0, 0};

char charToHexVal(char c);
char* charToHexStr(unsigned char c);

void wait_KBC_sendReady(void);
void init_keyboard(void);
void enable_mouse(void);
void intHandlerFromMouse(char* esp);

//Let the key buffer hold key data
//and let the main loop run graphic operations
struct KEYBUF{
	unsigned char key_buf[32];
	int next_r, next_w, len;
};

//static struct KEYBUF keybuf;

//A queue (FIFO) for the mouse/keyboard handlers
struct FIFO8{
	unsigned char* buf;
	int p, q, size, free, flags;
};

static struct FIFO8 mouseinfo;
static struct FIFO8 keyinfo;

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf);
int fifo8_put(struct FIFO8 *fifo, unsigned char data);
int fifo8_get(struct FIFO8 *fifo);
int fifo8_status(struct FIFO8 *fifo);

static char mousebuf[128];
static char keybuf[32];

struct MOUSE_DESC{
	unsigned char buf[3], phase;
	int x, y, btn;
};

static struct MOUSE_DESC mdec;

int mouse_decode(struct MOUSE_DESC *mdec, unsigned char dat);
void computeMousePosition(struct MOUSE_DESC *mdec);
void eraseMouse(char* vram);
void drawMouse(char* vram);
void show_mouse_info(void);

//Mouse simultaneous position
static int mx = 0, my = 0;

char* intToHexStr(unsigned int data);

struct AddrRangeDesc{
	unsigned int baseAddrLow;
	unsigned int baseAddrHigh;
	unsigned int lengthLow;
	unsigned int lengthHigh;
	unsigned int type;
};

char* get_adr_buffer(void);

void showMemoryInfo(struct AddrRangeDesc* desc, char* vram, int page, 
		int xsize, int color);

void CMain(void){
	initBootInfo(&bootInfo);
	char* p = bootInfo.vgaRam;
	int xsize = bootInfo.screenX;
	int ysize = bootInfo.screenY;
	char* vram = bootInfo.vgaRam;

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
	/*
	showChar8(p, xsize, 8, 8, COL8_FFFFFF, systemFont + 'A'*16);		
	showChar8(p, xsize, 2*8, 8, COL8_FFFFFF, systemFont + 'B'*16);
	showChar8(p, xsize, 3*8, 8, COL8_FFFFFF, systemFont + 'C'*16);
	showChar8(p, xsize, 5*8, 8, COL8_FFFFFF, systemFont + '3'*16);
	showChar8(p, xsize, 6*8, 8, COL8_FFFFFF, systemFont + '2'*16);

	showString(p, xsize, 8, 64, COL8_FFFFFF, "text!");
	*/
	int memCnt = get_memory_block_count();
	char* temp = intToHexStr(memCnt);
	//temp = intToHexStr(0xffffffff);
	showString(p, xsize, 6*8, 5*8, COL8_FFFFFF, 
			temp);

	mx = (xsize - 16)/2;
	mx = (ysize - 16 - 28)/2;
	init_mouse_cursor(mcursor, COL8_008484);	
	putblock(p, xsize, 16, 16, mx, my, mcursor, 16);

	//Init the buffer to store interrupt data
	fifo8_init(&mouseinfo, 128, mousebuf);
	fifo8_init(&keyinfo, 32, keybuf);

	//Set-up the keyboard, mouse interrupts
	init_keyboard();	
	enable_mouse();

	//Set-up the memory structure
	struct AddrRangeDesc* memDesc = (struct AddrRangeDesc*) get_adr_buffer();
	
	io_sti(); //Recover the interrupt service

	int data = 0;
	int count = 0;

	for(;;){	

		//io_cli();
	
		if(fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) == 0){
		//io_sti();
		io_hlt();
		}
		else if(fifo8_status(&keyinfo) != 0){
		//io_sti();
		data = fifo8_get(&keyinfo);


		if (data == 0x1c){
			showMemoryInfo(memDesc + count, p, count, xsize, 
					COL8_FFFFFF);
			count++; 
			//Loop back
			if(count > memCnt){
				count = 0;
			}

		}


		char* pStr = charToHexStr(data);
		static int showPos = 0;
		//showString(p, xsize, showPos, 0, COL8_FFFFFF, pStr);
		showPos += 32; //0x?? takes up 32 pixels, 8 pixels of space

		}
		else if(fifo8_status(&mouseinfo) != 0){
		show_mouse_info();
		}
	
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


	io_out8(PIC_OCW2, 0x21);

	unsigned char data = 0;
	data = io_in8(PORT_KEYDAT);

	/*
	char* pStr = charToHexStr(data);
	static int showPos = 0;
	showString(vram, xsize, 0, showPos, COL8_FFFFFF, pStr);
	showPos += 32; //0x?? takes up 32 pixels, 8 pixels of space
	showPos = showPos % ysize;
	*/
	fifo8_put(&keyinfo, data);

	/*
	if(keybuf.len< 32){
		keybuf.key_buf[keybuf.next_w] = data;
		keybuf.len++;
		keybuf.next_w = (keybuf.next_w + 1) & 0x1F;
	}
	*/
}


char charToHexVal(char c){
	if(c >= 10){
		return	'A' + c - 10;
	}
	return '0' + c;
}

//for data interrupter private usage
char* charToHexStr(unsigned char data){
	char mod = data % 16;	
	keyval[3] = charToHexVal(mod);
	data = (data >> 4);
	keyval[2] = charToHexVal(data);

	return keyval;
}

//convert 32 bits (int) of hex data into a printable string
char* intToHexStr(unsigned int data){
	static char str[11];
	str[0] = '0';
	str[1] = 'X';
	str[10] = 0;

	//Loop four bits at a time
	int realIndex = 2;
	for(int i = 7; i >= 0; i--){
		int e = data & 0x0F;	
		if(e < 10){
			str[realIndex + i] = '0' + e;
		}
		else{
			str[realIndex + i] = 'A' + e - 10;
		}
		data = (data >> 4);	
	}	

	return str;
}



//Loop until the mouse port is free to use
//the second LSB signifies if the port is ready or not
void wait_KBC_sendReady(void){
	for(;;){
		if((io_in8(PORT_KEYSTA) & KEYSTA_SENT_NOTREADY) == 0){
			break;
		}	
	}
	return;
}

//Prepare the keyboard for interrupt-sharing with the mouse
void init_keyboard(void){
	wait_KBC_sendReady();
	io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
	wait_KBC_sendReady();
	io_out8(PORT_KEYDAT, KBC_MODE);
	return;
}

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE 0xf4
void enable_mouse(void){
	wait_KBC_sendReady();
	io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
	wait_KBC_sendReady();
	io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);
	return;
}

void intHandlerFromMouse(char* esp){

	unsigned char data;
	io_out8(PIC1_OCW2, 0x20);
	io_out8(PIC_OCW2, 0x20);
	
	data = io_in8(PORT_KEYDAT);
	
	fifo8_put(&mouseinfo, data);
	//char* vram = bootInfo.vgaRam;
	//int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

	/*
	showString(vram, xsize, 0, 0, COL8_FFFFFF, "PS/2 Mouse Handler");
	for(;;){
		io_hlt();
	}
	*/
	return;

}

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf){
	fifo->size = size;
	fifo->buf = buf;
	fifo->free = size;
	fifo->flags = 0;
	fifo->p = 0;
	fifo->q = 0;
	return;

}

#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data){
	if(fifo->free == 0){
		fifo->flags |= FLAGS_OVERRUN;
		return -1;
	}

	fifo->buf[fifo->p] = data;
	fifo->p++;

	if(fifo->p == fifo->size){
		fifo->p = 0;	
	}	

	fifo->free--;
	return 0;

}

int fifo8_get(struct FIFO8 *fifo){
	int data;
	if(fifo->free == fifo->size){
		return -1;
	}

	data = fifo->buf[fifo->q];
	fifo->q++;
	if(fifo->q == fifo->size){
		fifo->q = 0;
	}

	fifo->free++;
	return data;

}

int fifo8_status(struct FIFO8 *fifo){
	return fifo->size - fifo->free;
}


//Decoder for mouse interrupt signals
int mouse_decode(struct MOUSE_DESC *mdec, unsigned char data){
	if (mdec->phase == 0){
		//start code for mouse is 0xfa
		if(data == 0xfa){
			mdec->phase = 1;
		}
		return 0;
	}

	if (mdec->phase == 1){
		//check if first data is valid
		if((data & 0xc8) == 0x08){
			mdec->buf[0] = data;
			mdec->phase = 2;
		}	
		return 0;
	}

	if (mdec->phase == 2){
		//continue storing mouse data
		mdec->buf[1] = data;
		mdec->phase = 3;
		return 0;
	}

	else if (mdec->phase == 3){
		mdec->buf[2] = data;
		mdec->phase = 1;

		mdec->btn = mdec->buf[0] & 0x07;
		mdec->x   = mdec->buf[1];
		mdec->y   = mdec->buf[2];
		if((mdec->buf[0] & 0x10) != 0){
			mdec->x |= 0xffffff00;
		}
		if((mdec->buf[0] & 0x20) != 0){
			mdec->y |= 0xffffff00;
		}
		mdec->y = -mdec->y;
		return 1;
	}
	return -1;

}

void computeMousePosition(struct MOUSE_DESC *mdec){

	int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

	mx += mdec->x;
	my += mdec->y;

	if(mx < 0){
		mx = 0;
	}

	if (my < 0){
		my = 0;
	}	

	if (mx > xsize - 16){
		mx = xsize - 16;
	}

	if (my > ysize - 16){
		my = ysize - 16;
	}
}

void eraseMouse(char* vram){
	int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

	boxfill8(vram, xsize, COL8_008484, mx, my, mx+15, my+15);
}

void drawMouse(char* vram){
	int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

	putblock(vram, xsize, 16, 16, mx, my, mcursor, 16);	
}

void show_mouse_info(void){
	char* vram = bootInfo.vgaRam;
	unsigned char data = 0;

	//io_sti();
	data = fifo8_get(&mouseinfo);
	if(mouse_decode(&mdec, data) == 1){
		eraseMouse(vram);
		computeMousePosition(&mdec);
		drawMouse(vram);
	}

}

void showMemoryInfo(struct AddrRangeDesc* desc, char* vram, int page, 
		int xsize, int color){

	int x = 0, y = 0, gap = 13*8, strLen = 10*8;

	boxfill8(vram, xsize,COL8_008484, 0, 0, xsize, 100);
       
	showString(vram, xsize, x, y, color, "page is: ");
	char* pPageCnt = intToHexStr(page);
	showString(vram, xsize, gap, y, color, pPageCnt);
	y+=16;

	showString(vram, xsize, x, y, color, "BaseAddrL: ");
	char* pBaseAddrL = intToHexStr(desc->baseAddrLow);
	showString(vram, xsize, gap, y, color, pBaseAddrL);
	y += 16;

	showString(vram, xsize, x, y, color, "BaseAddrH: ");
	char* pBaseAddrH = intToHexStr(desc->baseAddrHigh);
	showString(vram, xsize, gap, y, color, pBaseAddrH);
	y += 16;

	showString(vram, xsize, x, y, color, "LengthLow: ");
	char* pLengthL = intToHexStr(desc->lengthLow);
	showString(vram, xsize, gap, y, color, pLengthL);
	y+=16;

	showString(vram, xsize, x, y, color, "LengthHigh: ");
	char* pLengthH = intToHexStr(desc->lengthHigh);
	showString(vram, xsize, gap, y, color, pLengthH);
	y += 16;

	showString(vram, xsize, x, y, color, "Type: ");
	char* pType = intToHexStr(desc->type);
	showString(vram, xsize, gap, y, color, pType);

}

