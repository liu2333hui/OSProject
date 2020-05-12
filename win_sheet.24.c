#include "mem_util.h"
#include "win_sheet.24.h"

struct SHTCTL *shtctl_init(struct MEMMAN *memman,
		unsigned char * vram, int xsize, int ysize){
	struct SHTCTL *ctl;
	int i;
	ctl = (struct SHTCTL*) memman_alloc_4k(memman, SIZE_OF_SHTCTL);
	//Case where memory could not be allocated
	if (ctl == 0){
		return 0;
	}
	
	ctl->vram = vram;
	ctl->xsize = xsize;
	ctl->ysize = ysize;
	ctl->top = -1;	
	for (i = 0; i < MAX_SHEETS; i++){
		ctl->sheets0[i].flags = 0;
	}
	return ctl;
}

#define SHEET_USE 1
struct SHEET *sheet_alloc(struct SHTCTL *ctl){
	struct SHEET *sht;
	int i;
	for(i = 0; i < MAX_SHEETS; i++){
		//IF found a sheet that is available for use
		if(ctl->sheets0[i].flags == 0){
			sht = &(ctl->sheets0[i]);
			ctl->sheets[i] = sht;
			sht->flags = SHEET_USE;
			sht->height = -1;
			return sht;	
		}
	}

	return 0;
}


void sheet_setbuf(struct SHEET *sht, unsigned char *buf, 
		int xsize, int ysize, int col_inv){
	sht->buf = buf;
	sht->bxsize = xsize;
	sht->bysize = ysize;
	sht->col_inv = col_inv;
//	sht->height = -1;
}

void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height){
	int  h, old = sht->height;

	//bound the height
	if(height > ctl->top + 1){
		height = ctl->top + 1;
	}

	//Bound the height
	if(height < -1){
		height = -1;
	}
	//Otherwise set the height as so
	sht->height = height;

	//Go down in sheet layer
	if (old > height){
		//Case of setting the window in the visible region
		if (height > -1){
			for (h = old; h > height; h--){
				ctl->sheets[h] = ctl->sheets[h-1];
				ctl->sheets[h]->height = h;
			}

			ctl->sheets[height] = sht;
	sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize,sht->vy0 + sht->bysize, height);


		}
		//case of removing the window from the visible area
		else{
			if (ctl->top > old){
				for(h = old; h < ctl->top; h++){
					ctl->sheets[h] = ctl->sheets[h+1];
					ctl->sheets[h]->height = h;
				}		
			}
			ctl->top--;
			sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize,sht->vy0 + sht->bysize, 0);

		}
		//sheet_refresh(ctl);
				//sheet_refresh(ctl, sht, 0, 0, sht->bxsize, sht->bysize);
	}
	//If height is moved higher than before
	else if (old < height){
		if (old >= 0){
			for(h = old; h < height; h++){
				ctl->sheets[h] = ctl->sheets[h+1];
				ctl->sheets[h]->height = h;	
			}

			ctl->sheets[height] = sht;
		}
		//Case of making a previously invisible window
		//To a visible one
		else{
			for(h = ctl->top; h >= height; h--){
				ctl->sheets[h+1] = ctl->sheets[h];
				ctl->sheets[h+1]->height = h + 1;
			}
			//Add in the new sheet
			ctl->sheets[height] = sht;
			ctl->top++;
		}	
		//sheet_refresh(ctl);
		sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, 
				sht->vy0 + sht->bysize, height);
		//sheet_refresh(ctl, sht, 0, 0, sht->bxsize, sht->bysize);
	}
	else{
		//Do nothing
	}

}

int sheet_refresh(struct SHTCTL* ctl, struct SHEET* sht, int bx0, int by0, int bx1, int by1){
	if(sht->height >= 0){

		sheet_refreshsub(ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1, 
			       sht->vy0 + by1, sht->height);	

	}
	return 0;
}

/*
int sheet_refresh(struct SHTCTL *ctl){
	int h, bx, by, vx, vy;
	unsigned char *buf, c, *vram = ctl->vram;
	struct SHEET *sht;
	
	//Draw the sheets layer by layer from h = 0 to h = top
	for (h = 0; h <= ctl->top; h++){
		sht = ctl->sheets[h];
		buf = sht->buf;

		//Move the data into the vram buffer
		for (by = 0; by < sht->bysize; by++){
			vy = sht->vy0 + by;
			for (bx = 0; bx < sht->bxsize; bx++){
				vx = sht->vx0 + bx;
				c = buf[by*sht->bxsize + bx];

				//Only write visible content
				if (c != sht->col_inv){
					vram[vy*ctl->xsize + vx] = c;	
				}
			}		
		}
	}

	return 0;
}
*/
void sheet_slide_mouse(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0){
	int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
	sht->vx0 = vx0;
	sht->vy0 = vy0;
	if (sht->height >= 0){
	//	sheet_refresh(ctl);
	//	update the old location
		sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + 16, old_vy0 + 16, 0);
	//	update the new location
		sheet_refreshsub(ctl, vx0, vy0, vx0 + sht->bxsize, vy0 + sht->bysize, sht->height);
	}	
}

void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0){
	int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
	sht->vx0 = vx0;
	sht->vy0 = vy0;
	if (sht->height >= 0){
	//	sheet_refresh(ctl);
	//	update the old location
		sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0);
	//	update the new location
		sheet_refreshsub(ctl, vx0, vy0, vx0 + sht->bxsize, vy0 + sht->bysize, sht->height);
	}	
}


void sheet_refreshsub(struct SHTCTL* ctl, int vx0, int vy0, int vx1, int vy1,
		int h0){
	
	int h, bx, by, vx, vy;
	unsigned char *buf, c, *vram = ctl->vram;
	struct SHEET *sht;
	
	//Draw the sheets layer by layer from h = 0 to h = top
	for (h = h0; h <= ctl->top; h++){
		sht = ctl->sheets[h];
		buf = sht->buf;

		//Move the data into the vram buffer
		for (by = 0; by < sht->bysize; by++){
			vy = sht->vy0 + by;
			for (bx = 0; bx < sht->bxsize; bx++){
				vx = sht->vx0 + bx;

				if (vx0 <= vx && vx < vx1 && vy0 <= vy && vy < vy1){
				
				c = buf[by*sht->bxsize + bx];

				//Only write visible content
				if (c != sht->col_inv){

					if(!(vx > ctl->xsize - 1)){

					vram[vy*ctl->xsize + vx] = c;	
					}
				}
				}
			}		
		}
	}


}
