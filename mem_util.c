#include "mem_util.h"

/*
struct FREEINFO{
	unsigned int addr, size;
};

struct MEMMAN{
	int frees, maxfrees, lostsize, losts;
	struct FREEINFO free[MEMMAN_FREES];
};
*/

void memman_init(struct MEMMAN* man){
	man->frees = 0;
	man->maxfrees = 0;
	man->lostsize = 0;
	man->losts = 0;
}

unsigned int memman_total(struct MEMMAN* man){
	unsigned int i, t = 0;
	for(i = 0; i < man->frees; i++){
		t+= man->free[i].size;
	}
	return t;
}

unsigned int memman_alloc(struct MEMMAN* man, unsigned int reqSize){
	unsigned int i, a;
	for (i = 0; i < man->frees; i++){
		if (man->free[i].size >= reqSize){
			a = man->free[i].addr;
			man->free[i].addr += reqSize;
			man->free[i].size -= reqSize;
			if(man->free[i].size == 0){
				man->frees--;
			}

			return a;
		}

	}
	return 0;
}

int memman_free(struct MEMMAN* man, unsigned int addr, unsigned int size){
	
	int i, j;
	for(i = 0; i < man->frees; i++){
		if(man->free[i].addr > addr){
			break;
		}
	}

	//Combine prev. and requested block	
	//combine prev. and requested block and next block
	//combine requested block and next block
	//create new block if possible
	//if above all do not work, then return -1, lost block
	
	//Check previous block
	if (i > 0){	
		if(man->free[i-1].addr + man->free[i-1].size == addr){
			//Combine prev. and current (no need to make new addr)
			man->free[i-1].size += size;	
			if(0 < man->frees){ //???i or 0?
				if(addr + size == man->free[i].addr){
					//Combine prev, current, and next blocks
					man->free[i-1].size += man->free[i].size;
					man->frees--; //because 3rd block combined	
				}	
			}			
			return 0;
		}

	}	

	//check next block
	if (0 < man->frees){
		if (addr + size == man->free[i].addr){
			//combine current, next block
			man->free[i].size += size;
			man->free[i].addr = addr;		
			return 0;
		}
	}

	//If more space can be made ...
	//or if man->frees = zero in this case ...
	if (man->frees < MEMMAN_FREES){
		//push the blocks right of the requested block
		//one block to the right
		man->frees++;
		for(j = man->frees; j > i; j--){
			man->free[j] = man->free[j-1];
		}	

		//Record the maximum number of freeblocks so far
		if(man->maxfrees < man->frees) {
			man->maxfrees = man->frees;
		}	

		man->free[i].addr = addr;
		man->free[i].size = size;
		return 0;

	}	
	

	man->losts++;
	man->lostsize += size;
	return -1;

}


//Allocate at least 4K space of memory for the given structure
unsigned int memman_alloc_4k(struct MEMMAN* man, unsigned int size){
	unsigned int a ;
	size = (size + 0xfff) & 0xfffff000;
	a = memman_alloc(man, size);
	return a;
}

int memman_free_4k(struct MEMMAN* man, unsigned int addr,
		unsigned int size){
	int i ;
	size = (size + 0xfff) & 0xfffff000;
	i = memman_free(man, addr, size);
	return i;
}
