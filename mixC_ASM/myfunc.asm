global  myfunc
myfunc:
extern printf
     push    dword [myint]        ; one of my integer variables
     push    dword mystring       ; pointer into my data segment
     call    printf
     add     esp,byte 8           ; `byte' saves space

      ; then those data items...*/

segment _DATA
myint         dd    1234
mystring      db    'This number -> %d <- should be 1234',10,0

