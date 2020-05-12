extern void foo_print(char* a, int len);

int bar_func(int a, int b){
	char* s;
	if(a > b){
		s = "the 1st one\n";
	}
	else{
		s = "the 2nd one\n";
	}
	int c = 0;
	char* ptr = s;
	while(*ptr != '\0'){
		c++;
		ptr++;
	}
	foo_print(s, c);
		
}

int main(){
	foo_print("1",1);
	//bar_func(3, 4);
	//bar_func(4,3);
	//bar_func(11, 3);
	return 0;
}
