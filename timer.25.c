#include "timer.h"
#include "global_define.h"
#define PIC0_OCW2 0x20
#define PIC1_OCW2 0xA0

//static struct TIMERCTL timer;
//extern static struct TIMERCTL timerctl;

void io_out8(int, int);
void io_cli(void);
void io_store_eflags(int eflags);
int io_load_eflags();

void init_pit(struct TIMERCTL* timerctl) {
	int eflags;
	eflags = io_load_eflags();
	io_cli();
	
	io_out8(PIT_CTRL, 0x34);
	io_out8(PIT_CNT0, 0x9c);
	io_out8(PIT_CNT0, 0x2e);



	timerctl->count = 0;
	timerctl->timeout = 0;

	io_store_eflags(eflags);
	io_sti();

}

/*
struct TIMERCTL* getTimerController(){
	return &timerctl;	
}
*/
void setTimer(struct TIMERCTL* timerctl,unsigned int timeout, struct FIFO8 *fifo, unsigned char data){
	int eflags;
	eflags = io_load_eflags();
	io_cli();
	timerctl->timeout = timeout;
	timerctl->fifo = fifo;
	timerctl->data = data;
	io_store_eflags(eflags);
	return;
}

