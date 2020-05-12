
#define PIT_CTRL 0x0043
#define PIT_CNT0 0x0040

#define MAX_TIMER 500

#define TIMER_FLAGS_ALLOC 1
#define TIMER_FLAGS_USING 2


struct TIMER{
	unsigned int flags;
	unsigned int timeout;
	struct FIFO8 *fifo;
	unsigned char data;
};

struct TIMERCTL{
	unsigned int count;
	struct TIMER timer[MAX_TIMER];
};

struct TIMERCTL* init_pit( struct MEMMAN* memman);

struct TIMER* timer_alloc(struct TIMERCTL *timerctl);
void timer_free(struct TIMERCTL *timerctl, struct TIMER *timer);
void timer_init(struct TIMERCTL *timerctl, struct TIMER *timer, struct FIFO8 *fifo, unsigned char data);
void timer_settime(struct TIMERCTL *timerctl, struct TIMER* timer, unsigned int timeout);

void timer_setdata(struct TIMERCTL *timerctl, struct TIMER *timer, unsigned char data);
