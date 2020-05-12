void CMain(void){

//	int test[513];

	int i;
	
	char *p = 0;

	for(i = 0xa0000; i <= 0xaffff; i++){
	p = i;
	*p = i & 0x0f;  //get last four bits of value pointed by p
	}

	for(;;){
		io_hlt();
	}

}
