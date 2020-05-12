#include "mem_util.h"
#include "timer.h"
#include "global_define.h"
#define PIC0_OCW2 0x20
#define PIC1_OCW2 0xA0

#define SIZE_OF_TIMERCTL 8000 
//static struct TIMER timer;
//extern static struct TIMER timer;

void io_out8(int, int);
void io_cli(void);
void io_store_eflags(int eflags);
int io_load_eflags();

struct TIMERCTL* init_pit(struct MEMMAN* memman) {
/*
	int eflags;

	eflags = io_load_eflags();
	io_cli();
*/	
	io_out8(PIT_CTRL, 0x34);
	io_out8(PIT_CNT0, 0x9c);
	io_out8(PIT_CNT0, 0x2e);

	struct TIMERCTL* ctl = (struct TIMERCTL*) memman_alloc_4k(memman, SIZE_OF_TIMERCTL);

	if(ctl == 0){
		return 0;
	}

	ctl->count = 0;
	for(int i = 0; i < MAX_TIMER; i++){
		ctl->timer[i].flags=0;
	}

/*
	io_store_eflags(eflags);
	io_sti();
*/

	return ctl;
}

/*
struct TIMER* getTimerController(){
	return &timer;	
}
*/

/*
void setTimer(struct TIMERCTL* timerctl,
struct TIMER* timer,unsigned int timeout, struct FIFO8 *fifo, unsigned char data){
	int eflags;
	eflags = io_load_eflags();
	io_cli();
	timer->timeout = timeout;
	timer->fifo = fifo;
	timer->data = data;
	io_store_eflags(eflags);
	return;
}
*/



struct TIMER* timer_alloc(struct TIMERCTL *timerctl){
	for(int i = 0; i < MAX_TIMER; i++){
	if(timerctl->timer[i].flags == 0){
	timerctl->timer[i].flags = TIMER_FLAGS_ALLOC;
	return &(timerctl->timer[i]);
	}
	}
	return 0;
}

void timer_free(struct TIMERCTL *timerctl, struct TIMER *timer){
	timer->flags = 0;
	return;
}

void timer_init(struct TIMERCTL *timerctl, struct TIMER *timer, struct FIFO8 *fifo, unsigned char data){
	timer->fifo = fifo;
	timer->data = data;
	return;
}

void timer_setdata(struct TIMERCTL *timerctl, struct TIMER* timer, unsigned char data){
	timer->data = data;
}

void timer_settime(struct TIMERCTL *timerctl, struct TIMER* timer, unsigned int timeout){
	timer->timeout = timeout;
	timer->flags = TIMER_FLAGS_USING;
return;	
}
