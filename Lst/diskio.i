#line 1 "src\\SD_SPI\\diskio.c"




















 





































 


#line 1 "src\\SD_SPI\\diskio.h"


 











#line 1 "src\\SD_SPI\\integer.h"
 
 
 




#line 14 "src\\SD_SPI\\integer.h"

 
typedef int				INT;
typedef unsigned int	UINT;

 
typedef char			CHAR;
typedef unsigned char	UCHAR;
typedef unsigned char	BYTE;

 
typedef short			SHORT;
typedef unsigned short	USHORT;
typedef unsigned short	WORD;
typedef unsigned short	WCHAR;

 
typedef long			LONG;
typedef unsigned long	ULONG;
typedef unsigned long	DWORD;



#line 16 "src\\SD_SPI\\diskio.h"


 
typedef BYTE	DSTATUS;

 
typedef enum {
	RES_OK = 0,		 
	RES_ERROR,		 
	RES_WRPRT,		 
	RES_NOTRDY,		 
	RES_PARERR		 
} DRESULT;


 
 


DSTATUS disk_initialize (BYTE pdrv);
DSTATUS disk_status (BYTE pdrv);
DRESULT disk_read (BYTE pdrv, BYTE* buff, DWORD sector, UINT count);
DRESULT disk_write (BYTE pdrv, const BYTE* buff, DWORD sector, UINT count);
DRESULT disk_ioctl (BYTE pdrv, BYTE cmd, void* buff);


 






 

 






 





 






 




 










#line 63 "src\\SD_SPI\\diskio.c"
 
 
 
#line 1 "..\\..\\Common\\include.h"



















 




#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
 
 
 




 
 



 






   














  


 








#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


  



    typedef unsigned int size_t;    
#line 70 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"






    



    typedef unsigned short wchar_t;  
#line 91 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { long long quot, rem; } lldiv_t;
    


#line 112 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   



 

   




 
#line 131 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) long long atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) long long strtoll(const char * __restrict  ,
                                  char ** __restrict  , int  )
                          __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned long long strtoull(const char * __restrict  ,
                                            char ** __restrict  , int  )
                                   __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 436 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 524 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 553 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __attribute__((const)) int abs(int  );
   



 

extern __declspec(__nothrow) __attribute__((const)) div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __attribute__((const)) long int labs(long int  );
   



 




extern __declspec(__nothrow) __attribute__((const)) ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __attribute__((const)) long long llabs(long long  );
   



 




extern __declspec(__nothrow) __attribute__((const)) lldiv_t lldiv(long long  , long long  );
   











 
#line 634 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"




 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 




 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 892 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"





 
#line 26 "..\\..\\Common\\include.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"
 






 

 
 
 





 





#line 34 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"




  typedef signed int ptrdiff_t;



  



    typedef unsigned int size_t;    
#line 57 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



   



      typedef unsigned short wchar_t;  
#line 82 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



    




   




  typedef long double max_align_t;









#line 114 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



 

#line 27 "..\\..\\Common\\include.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
 
 
 





 






 







 




  
 








#line 47 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


  



    typedef unsigned int size_t;    









 
 

 



    typedef struct __va_list __va_list;






   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

#line 136 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 166 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int __ARM_vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int __ARM_vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int __ARM_vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));
   








 

extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 1021 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"



 

#line 28 "..\\..\\Common\\include.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"


  



    typedef unsigned int size_t;    
#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"




extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 193 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 209 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 232 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 247 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 270 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 502 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"



 

#line 29 "..\\..\\Common\\include.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\limits.h"
 
 
 





 






     

     

     

     
#line 30 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\limits.h"
       

       






#line 45 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\limits.h"
     
     


     

     

     

     

     

     





     





     





     


       

       

       




 

#line 30 "..\\..\\Common\\include.h"
#line 1 "..\\..\\Common\\defs.h"















 

typedef enum {FALSE = 0, TRUE = !FALSE} boolean;
#line 31 "..\\..\\Common\\include.h"

#line 1 "..\\..\\Common\\ADUCRF101.h"
 








 





 



 
















 

typedef enum {
 
  Reset_IRQn                        = -15,   
  NonMaskableInt_IRQn               = -14,   
  HardFault_IRQn                    = -13,   
  MemoryManagement_IRQn             = -12,   
  BusFault_IRQn                     = -11,   
  UsageFault_IRQn                   = -10,   
  SVCall_IRQn                       = -5,    
  DebugMonitor_IRQn                 = -4,    
  PendSV_IRQn                       = -2,    
  SysTick_IRQn                      = -1,    

  WUT_IRQn                          = 0,     
  EINT0_IRQn                        = 1,     
  EINT1_IRQn                        = 2,     
  EINT2_IRQn                        = 3,     
  EINT3_IRQn                        = 4,     
  EINT4_IRQn                        = 5,     
  EINT5_IRQn                        = 6,     
  EINT6_IRQn                        = 7,     
  EINT7_IRQn                        = 8,     
  EINT8_IRQn                        = 9,     
  UHFTRX_IRQn                       = 9,     
  WDT_IRQn                          = 10,    
  TIMER0_IRQn                       = 12,    
  TIMER1_IRQn                       = 13,    
  ADC0_IRQn                         = 14,    
  FLASH_IRQn                        = 15,    
  UART_IRQn                         = 16,    
  SPI0_IRQn                         = 17,    
  SPI1_IRQn                         = 18,    
  I2CS_IRQn                         = 19,    
  I2CM_IRQn                         = 20,    
  DMA_ERR_IRQn                      = 23,    
  DMA_SPI1_TX_IRQn                  = 24,    
  DMA_SPI1_RX_IRQn                  = 25,    
  DMA_UART_TX_IRQn                  = 26,    
  DMA_UART_RX_IRQn                  = 27,    
  DMA_I2CS_TX_IRQn                  = 28,    
  DMA_I2CS_RX_IRQn                  = 29,    
  DMA_I2CM_TX_IRQn                  = 30,    
  DMA_I2CM_RX_IRQn                  = 31,    
  DMA_ADC0_IRQn                     = 35,    
  DMA_SPI0_TX_IRQn                  = 36,    
  DMA_SPI0_RX_IRQn                  = 37,    
  PWM_TRIP_IRQn                     = 38,    
  PWM_PAIR0_IRQn                    = 39,    
  PWM_PAIR1_IRQn                    = 40,    
  PWM_PAIR2_IRQn                    = 41,    
  PWM_PAIR3_IRQn                    = 42     
} IRQn_Type;




 

 
 
 

 





   

#line 1 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"
 







 

























 
























 




 


 

 













#line 110 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"


 







#line 145 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"

#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 147 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"
#line 1 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cmInstr.h"
 







 

























 






 



 


 









 







 







 






 








 







 







 









 









 

__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}








 

__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}










 










 











 









 









 









 











 











 











 







 










 










 









 





#line 684 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cmInstr.h"

   

#line 148 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"
#line 1 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cmFunc.h"
 







 

























 






 



 


 





 
 






 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}







 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}







 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}







 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}







 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}







 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}







 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}







 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 







 








 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}







 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0xff);
}







 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}







 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & (uint32_t)1);
}




#line 307 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cmFunc.h"


#line 634 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cmFunc.h"

 

#line 149 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"








 
#line 179 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"

 






 
#line 195 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"

 












 


 





 


 
typedef union
{
  struct
  {

    uint32_t _reserved0:27;               





    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       

    uint32_t _reserved0:15;               





    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 






 


 
typedef struct
{
  volatile uint32_t ISER[8];                  
       uint32_t RESERVED0[24];
  volatile uint32_t ICER[8];                  
       uint32_t RSERVED1[24];
  volatile uint32_t ISPR[8];                  
       uint32_t RESERVED2[24];
  volatile uint32_t ICPR[8];                  
       uint32_t RESERVED3[24];
  volatile uint32_t IABR[8];                  
       uint32_t RESERVED4[56];
  volatile uint8_t  IP[240];                  
       uint32_t RESERVED5[644];
  volatile  uint32_t STIR;                     
}  NVIC_Type;

 



 






 


 
typedef struct
{
  volatile const  uint32_t CPUID;                    
  volatile uint32_t ICSR;                     
  volatile uint32_t VTOR;                     
  volatile uint32_t AIRCR;                    
  volatile uint32_t SCR;                      
  volatile uint32_t CCR;                      
  volatile uint8_t  SHP[12];                  
  volatile uint32_t SHCSR;                    
  volatile uint32_t CFSR;                     
  volatile uint32_t HFSR;                     
  volatile uint32_t DFSR;                     
  volatile uint32_t MMFAR;                    
  volatile uint32_t BFAR;                     
  volatile uint32_t AFSR;                     
  volatile const  uint32_t PFR[2];                   
  volatile const  uint32_t DFR;                      
  volatile const  uint32_t ADR;                      
  volatile const  uint32_t MMFR[4];                  
  volatile const  uint32_t ISAR[5];                  
       uint32_t RESERVED0[5];
  volatile uint32_t CPACR;                    
} SCB_Type;

 















 






























 




#line 422 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"

 





















 









 


















 










































 









 









 















 






 


 
typedef struct
{
       uint32_t RESERVED0[1];
  volatile const  uint32_t ICTR;                     

  volatile uint32_t ACTLR;                    



} SCnSCB_Type;

 



 










 






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t LOAD;                     
  volatile uint32_t VAL;                      
  volatile const  uint32_t CALIB;                    
} SysTick_Type;

 












 



 



 









 






 


 
typedef struct
{
  volatile  union
  {
    volatile  uint8_t    u8;                   
    volatile  uint16_t   u16;                  
    volatile  uint32_t   u32;                  
  }  PORT [32];                           
       uint32_t RESERVED0[864];
  volatile uint32_t TER;                      
       uint32_t RESERVED1[15];
  volatile uint32_t TPR;                      
       uint32_t RESERVED2[15];
  volatile uint32_t TCR;                      
       uint32_t RESERVED3[29];
  volatile  uint32_t IWR;                      
  volatile const  uint32_t IRR;                      
  volatile uint32_t IMCR;                     
       uint32_t RESERVED4[43];
  volatile  uint32_t LAR;                      
  volatile const  uint32_t LSR;                      
       uint32_t RESERVED5[6];
  volatile const  uint32_t PID4;                     
  volatile const  uint32_t PID5;                     
  volatile const  uint32_t PID6;                     
  volatile const  uint32_t PID7;                     
  volatile const  uint32_t PID0;                     
  volatile const  uint32_t PID1;                     
  volatile const  uint32_t PID2;                     
  volatile const  uint32_t PID3;                     
  volatile const  uint32_t CID0;                     
  volatile const  uint32_t CID1;                     
  volatile const  uint32_t CID2;                     
  volatile const  uint32_t CID3;                     
} ITM_Type;

 



 



























 



 



 



 









   






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t CYCCNT;                   
  volatile uint32_t CPICNT;                   
  volatile uint32_t EXCCNT;                   
  volatile uint32_t SLEEPCNT;                 
  volatile uint32_t LSUCNT;                   
  volatile uint32_t FOLDCNT;                  
  volatile const  uint32_t PCSR;                     
  volatile uint32_t COMP0;                    
  volatile uint32_t MASK0;                    
  volatile uint32_t FUNCTION0;                
       uint32_t RESERVED0[1];
  volatile uint32_t COMP1;                    
  volatile uint32_t MASK1;                    
  volatile uint32_t FUNCTION1;                
       uint32_t RESERVED1[1];
  volatile uint32_t COMP2;                    
  volatile uint32_t MASK2;                    
  volatile uint32_t FUNCTION2;                
       uint32_t RESERVED2[1];
  volatile uint32_t COMP3;                    
  volatile uint32_t MASK3;                    
  volatile uint32_t FUNCTION3;                
} DWT_Type;

 






















































 



 



 



 



 



 



 



























   






 


 
typedef struct
{
  volatile uint32_t SSPSR;                    
  volatile uint32_t CSPSR;                    
       uint32_t RESERVED0[2];
  volatile uint32_t ACPR;                     
       uint32_t RESERVED1[55];
  volatile uint32_t SPPR;                     
       uint32_t RESERVED2[131];
  volatile const  uint32_t FFSR;                     
  volatile uint32_t FFCR;                     
  volatile const  uint32_t FSCR;                     
       uint32_t RESERVED3[759];
  volatile const  uint32_t TRIGGER;                  
  volatile const  uint32_t FIFO0;                    
  volatile const  uint32_t ITATBCTR2;                
       uint32_t RESERVED4[1];
  volatile const  uint32_t ITATBCTR0;                
  volatile const  uint32_t FIFO1;                    
  volatile uint32_t ITCTRL;                   
       uint32_t RESERVED5[39];
  volatile uint32_t CLAIMSET;                 
  volatile uint32_t CLAIMCLR;                 
       uint32_t RESERVED7[8];
  volatile const  uint32_t DEVID;                    
  volatile const  uint32_t DEVTYPE;                  
} TPI_Type;

 



 



 












 






 



 





















 



 





















 



 



 


















 






   


#line 1133 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"






 


 
typedef struct
{
  volatile uint32_t DHCSR;                    
  volatile  uint32_t DCRSR;                    
  volatile uint32_t DCRDR;                    
  volatile uint32_t DEMCR;                    
} CoreDebug_Type;

 




































 






 







































 






 

 
#line 1253 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"

#line 1262 "C:\\Keil_v5\\\\ARM\\CMSIS\\Include\\core_cm3.h"






 










 

 



 




 










 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07);                

  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;                                                    
  reg_value &= ~((0xFFFFUL << 16) | (7UL << 8));              
  reg_value  =  (reg_value                                 |
                ((uint32_t)0x5FA << 16) |
                (PriorityGroupTmp << 8));                                      
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR =  reg_value;
}







 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8)) >> 8);    
}







 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}







 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}











 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}







 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}







 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}










 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}










 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 3)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[(uint32_t)(IRQn)] = ((priority << (8 - 3)) & 0xff);    }         
}












 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 3)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[(uint32_t)(IRQn)]           >> (8 - 3)));  }  
}













 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 3) ? 3 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 3) < 7) ? 0 : PriorityGroupTmp - 7 + 3;

  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}













 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 3) ? 3 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 3) < 7) ? 0 : PriorityGroupTmp - 7 + 3;

  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}





 
static __inline void NVIC_SystemReset(void)
{
  __dsb(0xF);                                                     
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = ((0x5FA << 16)      |
                 (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8)) |
                 (1UL << 2));                    
  __dsb(0xF);                                                      
  while(1);                                                     
}

 



 




 

















 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1) > (0xFFFFFFUL << 0))  return (1);       

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = ticks - 1;                                   
  NVIC_SetPriority (SysTick_IRQn, (1<<3) - 1);   
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2) |
                   (1UL << 1)   |
                   (1UL << 0);                     
  return (0);                                                   
}



 



 




 

extern volatile int32_t ITM_RxBuffer;                     












 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if ((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL << 0))                  &&       
      (((ITM_Type *) (0xE0000000UL) )->TER & (1UL << 0)        )                    )      
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000UL) )->PORT[0].u8 = (uint8_t) ch;
  }
  return (ch);
}








 
static __inline int32_t ITM_ReceiveChar (void) {
  int32_t ch = -1;                            

  if (ITM_RxBuffer != 0x5AA55AA5) {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5;        
  }

  return (ch);
}








 
static __inline int32_t ITM_CheckChar (void) {

  if (ITM_RxBuffer == 0x5AA55AA5) {
    return (0);                                  
  } else {
    return (1);                                  
  }
}

 





#line 110 "..\\..\\Common\\ADUCRF101.h"
#line 1 "..\\..\\Common\\system_ADUCRF101.h"






















 




 



   
















 
extern void SystemInit (void);









 
extern void SystemCoreClockUpdate (void);









 
extern void SetSystemExtClkFreq (uint32_t ExtClkFreq);








 
extern uint32_t GetSystemExtClkFreq (void);










 
  


   

#line 111 "..\\..\\Common\\ADUCRF101.h"


 
 
 




 


 

  #pragma push
  #pragma anon_unions
#line 138 "..\\..\\Common\\ADUCRF101.h"




 





 


 





 






 





 





 





 






 




 




 





 





 





 





 


 


 


 


 


 


 


 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 





 





 





 





 





 





 





 





 





 





 





 





 





 


 






 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
#line 720 "..\\..\\Common\\ADUCRF101.h"

 





 





 





 





 
#line 752 "..\\..\\Common\\ADUCRF101.h"

 





 





 








 


typedef struct {                             
  volatile uint16_t  ADCCFG;                     
  volatile const  uint16_t  RESERVED0;
  volatile uint8_t   ADCCON;                     
  volatile const  uint8_t   RESERVED1[3];
  volatile uint8_t   ADCSTA;                     
  volatile const  uint8_t   RESERVED2[3];
  volatile uint16_t  ADCDAT;                     
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  ADCGN;                      
  volatile const  uint16_t  RESERVED4;
  volatile uint16_t  ADCOF;                      
} ADI_ADC_TypeDef;
#line 798 "..\\..\\Common\\ADUCRF101.h"

 


 






 
#line 817 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 841 "..\\..\\Common\\ADUCRF101.h"

 


 






 






 






 






 
#line 880 "..\\..\\Common\\ADUCRF101.h"

 






 


 






 


 


 


 


 


 


 








 


typedef struct {                             
  volatile uint16_t  CLKCON;                     
  volatile const  uint16_t  RESERVED0[519];
  volatile uint8_t   XOSCCON;                    
  volatile const  uint8_t   RESERVED1[111];
  volatile uint16_t  CLKACT;                     
  volatile const  uint16_t  RESERVED2;
  volatile uint16_t  CLKPD;                      
} ADI_CLKCTL_TypeDef;
#line 943 "..\\..\\Common\\ADUCRF101.h"

 


 
#line 955 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 973 "..\\..\\Common\\ADUCRF101.h"

 


 






 


 






 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 












 


typedef struct {                             
  volatile uint32_t  DMASTA;                     
  volatile uint32_t  DMACFG;                     
  volatile uint32_t  DMAPDBPTR;                  
  volatile uint32_t  DMAADBPTR;                  
  volatile const  uint32_t  RESERVED0;
  volatile uint32_t  DMASWREQ;                   
  volatile const  uint32_t  RESERVED1[2];
  volatile uint32_t  DMARMSKSET;                 
  volatile uint32_t  DMARMSKCLR;                 
  volatile uint32_t  DMAENSET;                   
  volatile uint32_t  DMAENCLR;                   
  volatile uint32_t  DMAALTSET;                  
  volatile uint32_t  DMAALTCLR;                  
  volatile uint32_t  DMAPRISET;                  
  volatile uint32_t  DMAPRICLR;                  
  volatile const  uint32_t  RESERVED2[3];
  volatile uint32_t  DMAERRCLR;                  
} ADI_DMA_TypeDef;
#line 1202 "..\\..\\Common\\ADUCRF101.h"

 


 



 
#line 1223 "..\\..\\Common\\ADUCRF101.h"

 






 


 






 


 


 


 


 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 


 












 


typedef struct {                             
  volatile uint16_t  FEESTA;                     
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  FEECON0;                    
  volatile const  uint16_t  RESERVED1;
  volatile uint16_t  FEECMD;                     
  volatile const  uint16_t  RESERVED2[3];
  volatile uint16_t  FEEADR0L;                   
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  FEEADR0H;                   
  volatile const  uint16_t  RESERVED4;
  volatile uint16_t  FEEADR1L;                   
  volatile const  uint16_t  RESERVED5;
  volatile uint16_t  FEEADR1H;                   
  volatile const  uint16_t  RESERVED6;
  volatile uint16_t  FEEKEY;                     
  volatile const  uint16_t  RESERVED7[3];
  volatile uint16_t  FEEPROL;                    
  volatile const  uint16_t  RESERVED8;
  volatile uint16_t  FEEPROH;                    
  volatile const  uint16_t  RESERVED9;
  volatile uint16_t  FEESIGL;                    
  volatile const  uint16_t  RESERVED10;
  volatile uint16_t  FEESIGH;                    
  volatile const  uint16_t  RESERVED11;
  volatile uint16_t  FEECON1;                    
  volatile const  uint16_t  RESERVED12[7];
  volatile uint16_t  FEEADRAL;                   
  volatile const  uint16_t  RESERVED13;
  volatile uint16_t  FEEADRAH;                   
  volatile const  uint16_t  RESERVED14[21];
  volatile uint16_t  FEEAEN0;                    
  volatile const  uint16_t  RESERVED15;
  volatile uint16_t  FEEAEN1;                    
  volatile const  uint16_t  RESERVED16;
  volatile uint16_t  FEEAEN2;                    
} ADI_FEE_TypeDef;
#line 2049 "..\\..\\Common\\ADUCRF101.h"

 


 






 






 






 






 






 






 


 






 






 






 


 
#line 2129 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 


 


 


 


 


 


 




 


 


 


 


 


 


 


 


 


 






 


 


 


 


 


 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 












 


typedef struct {                             
  volatile uint16_t  GPCON;                      
  volatile const  uint16_t  RESERVED0;
  volatile uint8_t   GPOEN;                      
  volatile const  uint8_t   RESERVED1[3];
  volatile uint8_t   GPPUL;                      
  volatile const  uint8_t   RESERVED2[3];
  volatile uint8_t   GPOCE;                      
  volatile const  uint8_t   RESERVED3[7];
  volatile uint8_t   GPIN;                       
  volatile const  uint8_t   RESERVED4[3];
  volatile uint8_t   GPOUT;                      
  volatile const  uint8_t   RESERVED5[3];
  volatile uint8_t   GPSET;                      
  volatile const  uint8_t   RESERVED6[3];
  volatile uint8_t   GPCLR;                      
  volatile const  uint8_t   RESERVED7[3];
  volatile uint8_t   GPTGL;                      
} ADI_GPIO_TypeDef;
#line 2515 "..\\..\\Common\\ADUCRF101.h"

 


 





 






 





 





 






 





 




 




 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 
#line 3026 "..\\..\\Common\\ADUCRF101.h"

 


 





 





 





 




 




 






 






 


 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 


 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 


 





 





 





 





 





 





 
#line 3478 "..\\..\\Common\\ADUCRF101.h"

 


 



 



 




 




 




 




 




 




 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 
#line 3979 "..\\..\\Common\\ADUCRF101.h"

 


 



 



 




 



 





 





 



 




 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 
#line 4480 "..\\..\\Common\\ADUCRF101.h"

 


 




 




 




 




 




 





 




 




 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 











 


typedef struct {                             
  volatile uint8_t   GPDWN;                      
} ADI_GPIOCMN_TypeDef;




 


 












 


typedef struct {                             
  volatile const  uint32_t  RESERVED0;
  volatile uint16_t  RFTST;                      
  volatile const  uint16_t  RESERVED1[5];
  volatile uint8_t   SWACT;                      
} ADI_MISC_TypeDef;





 


 


 






 






 






 






 


 












 


typedef struct {                             
  volatile uint16_t  I2CMCON;                    
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  I2CMSTA;                    
  volatile const  uint16_t  RESERVED1;
  volatile uint16_t  I2CMRX;                     
  volatile const  uint16_t  RESERVED2;
  volatile uint16_t  I2CMTX;                     
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  I2CMRXCNT;                  
  volatile const  uint16_t  RESERVED4;
  volatile uint16_t  I2CMCRXCNT;                 
  volatile const  uint16_t  RESERVED5;
  volatile uint8_t   I2CADR0;                    
  volatile const  uint8_t   RESERVED6[3];
  volatile uint8_t   I2CADR1;                    
  volatile const  uint8_t   RESERVED7[7];
  volatile uint16_t  I2CDIV;                     
  volatile const  uint16_t  RESERVED8;
  volatile uint16_t  I2CSCON;                    
  volatile const  uint16_t  RESERVED9;
  volatile uint16_t  I2CSSTA;                    
  volatile const  uint16_t  RESERVED10;
  volatile uint16_t  I2CSRX;                     
  volatile const  uint16_t  RESERVED11;
  volatile uint16_t  I2CSTX;                     
  volatile const  uint16_t  RESERVED12;
  volatile uint16_t  I2CALT;                     
  volatile const  uint16_t  RESERVED13;
  volatile uint16_t  I2CID0;                     
  volatile const  uint16_t  RESERVED14;
  volatile uint16_t  I2CID1;                     
  volatile const  uint16_t  RESERVED15;
  volatile uint16_t  I2CID2;                     
  volatile const  uint16_t  RESERVED16;
  volatile uint16_t  I2CID3;                     
  volatile const  uint16_t  RESERVED17;
  volatile uint16_t  I2CFSTA;                    
} ADI_I2C_TypeDef;
#line 5132 "..\\..\\Common\\ADUCRF101.h"

 


 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 






 






 






 






 






 






 






 






 





 


 


 


 


 


 






 


 


 


 


 


 


 


 


 


 


 


 






 






 






 






 






 






 






 






 






 





 






 






 






 






 


 






 






 


 






 


 






 






 






 






 






 






 






 






 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 






 






 





 





 





 











 


typedef struct {                             
  volatile uint16_t  EI0CFG;                     
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  EI1CFG;                     
  volatile const  uint16_t  RESERVED1;
  volatile uint16_t  EI2CFG;                     
  volatile const  uint16_t  RESERVED2[3];
  volatile uint16_t  EICLR;                      
  volatile const  uint16_t  RESERVED3;
  volatile uint8_t   NMICLR;                     
} ADI_INTERRUPT_TypeDef;
#line 5647 "..\\..\\Common\\ADUCRF101.h"

 


 






 
#line 5665 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 5680 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 5695 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 5710 "..\\..\\Common\\ADUCRF101.h"

 


 






 
#line 5728 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 5743 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 5758 "..\\..\\Common\\ADUCRF101.h"

 






 
#line 5773 "..\\..\\Common\\ADUCRF101.h"

 


 






 
#line 5791 "..\\..\\Common\\ADUCRF101.h"

 


 





 





 





 





 





 





 





 





 





 


 











 

#line 5910 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 





 





 





 





 


 


 


 


 


 





 





 


 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 





 





 





 





 





 





 





 


 





 


 


 





 


 


 


 





 


 





 





 





 


 





 





 





 


 





 





 





 





 





 





 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 


 





 





 





 


 


 


 


 


 








 


typedef struct {                             
  volatile uint16_t  PWRMOD;                     
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  PWRKEY;                     
  volatile const  uint16_t  RESERVED1;
  volatile uint8_t   PSMCON;                     
  volatile const  uint8_t   RESERVED2[111];
  volatile uint8_t   SRAMRET;                    
  volatile const  uint8_t   RESERVED3[3];
  volatile uint8_t   SHUTDOWN;                   
} ADI_PWRCTL_TypeDef;
#line 7738 "..\\..\\Common\\ADUCRF101.h"

 


 






 





 


 




 


 






 


 






 


 






 






 












 


typedef struct {                             
  volatile uint16_t  PWMCON0;                    
  volatile const  uint16_t  RESERVED0;
  volatile uint8_t   PWMCON1;                    
  volatile const  uint8_t   RESERVED1[3];
  volatile uint16_t  PWMCLRI;                    
  volatile const  uint16_t  RESERVED2[3];
  volatile uint16_t  PWM0COM0;                   
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  PWM0COM1;                   
  volatile const  uint16_t  RESERVED4;
  volatile uint16_t  PWM0COM2;                   
  volatile const  uint16_t  RESERVED5;
  volatile uint16_t  PWM0LEN;                    
  volatile const  uint16_t  RESERVED6;
  volatile uint16_t  PWM1COM0;                   
  volatile const  uint16_t  RESERVED7;
  volatile uint16_t  PWM1COM1;                   
  volatile const  uint16_t  RESERVED8;
  volatile uint16_t  PWM1COM2;                   
  volatile const  uint16_t  RESERVED9;
  volatile uint16_t  PWM1LEN;                    
  volatile const  uint16_t  RESERVED10;
  volatile uint16_t  PWM2COM0;                   
  volatile const  uint16_t  RESERVED11;
  volatile uint16_t  PWM2COM1;                   
  volatile const  uint16_t  RESERVED12;
  volatile uint16_t  PWM2COM2;                   
  volatile const  uint16_t  RESERVED13;
  volatile uint16_t  PWM2LEN;                    
  volatile const  uint16_t  RESERVED14;
  volatile uint16_t  PWM3COM0;                   
  volatile const  uint16_t  RESERVED15;
  volatile uint16_t  PWM3COM1;                   
  volatile const  uint16_t  RESERVED16;
  volatile uint16_t  PWM3COM2;                   
  volatile const  uint16_t  RESERVED17;
  volatile uint16_t  PWM3LEN;                    
} ADI_PWM_TypeDef;
#line 7876 "..\\..\\Common\\ADUCRF101.h"

 


 






 






 






 






 






 






 






 
#line 7939 "..\\..\\Common\\ADUCRF101.h"

 






 






 






 






 






 






 


 






 


 





 





 





 





 





 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 








 


typedef struct {                             
  
  union {
    volatile uint8_t   RSTSTA;                   
    volatile uint8_t   RSTCLR;                   
  } ;
} ADI_RESET_TypeDef;





 


 






 






 






 






 






 


 






 






 






 






 












 


typedef struct {                             
  volatile uint16_t  SPISTA;                     
  volatile const  uint16_t  RESERVED0;
  volatile uint8_t   SPIRX;                      
  volatile const  uint8_t   RESERVED1[3];
  volatile uint8_t   SPITX;                      
  volatile const  uint8_t   RESERVED2[3];
  volatile uint16_t  SPIDIV;                     
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  SPICON;                     
  volatile const  uint16_t  RESERVED4;
  volatile uint16_t  SPIDMA;                     
  volatile const  uint16_t  RESERVED5;
  volatile uint16_t  SPICNT;                     
} ADI_SPI_TypeDef;
#line 8251 "..\\..\\Common\\ADUCRF101.h"

 


 






 






 
#line 8276 "..\\..\\Common\\ADUCRF101.h"

 






 






 






 






 
#line 8312 "..\\..\\Common\\ADUCRF101.h"

 






 


 


 


 


 


 






 


 


 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 


 
#line 8492 "..\\..\\Common\\ADUCRF101.h"

 


 






 






 
#line 8517 "..\\..\\Common\\ADUCRF101.h"

 






 






 






 






 
#line 8553 "..\\..\\Common\\ADUCRF101.h"

 






 


 


 


 


 


 






 


 


 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 


 






 






 






 


 








 


typedef struct {                             
  volatile uint16_t  LD;                         
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  VAL;                        
  volatile const  uint16_t  RESERVED1;
  volatile uint16_t  CON;                        
  volatile const  uint16_t  RESERVED2;
  volatile uint16_t  CLRI;                       
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  CAP;                        
  volatile const  uint16_t  RESERVED4[5];
  volatile uint16_t  STA;                        
} ADI_TIMER_TypeDef;
#line 8754 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 


 


 






 
#line 8794 "..\\..\\Common\\ADUCRF101.h"

 






 






 






 






 






 






 


 





 





 


 


 


 






 






 






 
#line 8897 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 


 


 






 
#line 8937 "..\\..\\Common\\ADUCRF101.h"

 






 






 






 






 






 






 


 





 





 


 


 


 






 






 






 












 


typedef struct {                             
  
  union {
    volatile uint8_t   COMTX;                    
    volatile uint8_t   COMRX;                    
  } ;
  volatile const  uint8_t   RESERVED0[3];
  volatile uint8_t   COMIEN;                     
  volatile const  uint8_t   RESERVED1[3];
  volatile uint8_t   COMIIR;                     
  volatile const  uint8_t   RESERVED2[3];
  volatile uint8_t   COMLCR;                     
  volatile const  uint8_t   RESERVED3[3];
  volatile uint8_t   COMMCR;                     
  volatile const  uint8_t   RESERVED4[3];
  volatile uint8_t   COMLSR;                     
  volatile const  uint8_t   RESERVED5[3];
  volatile uint8_t   COMMSR;                     
  volatile const  uint8_t   RESERVED6[11];
  volatile uint16_t  COMFBR;                     
  volatile const  uint16_t  RESERVED7;
  volatile uint16_t  COMDIV;                     
} ADI_UART_TypeDef;
#line 9076 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 


 


 






 






 






 






 






 






 


 






 






 


 






 






 






 






 






 






 


 






 






 


 






 






 






 






 






 






 






 


 






 






 


 






 


 


 


 








 


typedef struct {                             
  volatile uint16_t  T2VAL0;                     
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  T2VAL1;                     
  volatile const  uint16_t  RESERVED1;
  volatile uint16_t  T2CON;                      
  volatile const  uint16_t  RESERVED2;
  volatile uint16_t  T2INC;                      
  volatile const  uint16_t  RESERVED3;
  volatile uint16_t  T2WUFB0;                    
  volatile const  uint16_t  RESERVED4;
  volatile uint16_t  T2WUFB1;                    
  volatile const  uint16_t  RESERVED5;
  volatile uint16_t  T2WUFC0;                    
  volatile const  uint16_t  RESERVED6;
  volatile uint16_t  T2WUFC1;                    
  volatile const  uint16_t  RESERVED7;
  volatile uint16_t  T2WUFD0;                    
  volatile const  uint16_t  RESERVED8;
  volatile uint16_t  T2WUFD1;                    
  volatile const  uint16_t  RESERVED9;
  volatile uint16_t  T2IEN;                      
  volatile const  uint16_t  RESERVED10;
  volatile uint16_t  T2STA;                      
  volatile const  uint16_t  RESERVED11;
  volatile uint16_t  T2CLRI;                     
  volatile const  uint16_t  RESERVED12[5];
  volatile uint16_t  T2WUFA0;                    
  volatile const  uint16_t  RESERVED13;
  volatile uint16_t  T2WUFA1;                    
} ADI_WUT_TypeDef;
#line 9361 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 


 


 






 






 






 






 






 






 






 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 






 






 






 






 






 


 






 






 






 






 






 






 






 


 





 





 





 





 





 


 


 


 








 


typedef struct {                             
  volatile uint16_t  T3LD;                       
  volatile const  uint16_t  RESERVED0;
  volatile uint16_t  T3VAL;                      
  volatile const  uint16_t  RESERVED1;
  volatile uint16_t  T3CON;                      
  volatile const  uint16_t  RESERVED2;
  volatile uint16_t  T3CLRI;                     
  volatile const  uint16_t  RESERVED3[5];
  volatile uint16_t  T3STA;                      
} ADI_WDT_TypeDef;
#line 9630 "..\\..\\Common\\ADUCRF101.h"

 


 


 


 


 


 






 






 






 






 






 


 


 


 






 






 






 






 







 

  #pragma pop
#line 9740 "..\\..\\Common\\ADUCRF101.h"


 


#line 9754 "..\\..\\Common\\ADUCRF101.h"













#line 9775 "..\\..\\Common\\ADUCRF101.h"


 
 
 

#line 9806 "..\\..\\Common\\ADUCRF101.h"


 
 
 

#line 9835 "..\\..\\Common\\ADUCRF101.h"

      
   








#line 33 "..\\..\\Common\\include.h"

#line 1 "..\\..\\Common\\radioeng.h"

































 








 



 



 



 
typedef enum
{
   DR_1_0kbps_Dev10_0kHz      =  0x0,
   DR_38_4kbps_Dev20kHz       =  0x1,
   DR_300_0kbps_Dev75_0kHz    =  0x2,
   UnsupportedDRDev
} RIE_BaseConfigs;



 


 


 
typedef enum {FSK_Modulation = 0, GFSK_Modulation = 1} RIE_ModulationTypes;



 


 


 
typedef enum {DifferentialPA = 0, SingleEndedPA = 1} RIE_PATypes;



typedef enum {PowerLevel0 ,PowerLevel1 ,PowerLevel2 ,PowerLevel3,
              PowerLevel4 ,PowerLevel5 ,PowerLevel6 ,PowerLevel7,
              PowerLevel8 ,PowerLevel9 ,PowerLevel10,PowerLevel11,
              PowerLevel12,PowerLevel13,PowerLevel14,PowerLevel15
             } RIE_PAPowerLevel;




 


 


 
typedef enum {RIE_FALSE = 0, RIE_TRUE = !RIE_FALSE} RIE_BOOL;




 


 


 


 


 


 
typedef enum
{
   RIE_Success                 =  0x0,
   RIE_RadioSPICommsFail       =  0x1,
   RIE_UnsupportedRadioConfig  =  0x2,
   RIE_Unimplemented           =  0x3,
   RIE_InvalidParamter         =  0x4,
} RIE_Responses;


RIE_Responses RadioGetAPIVersion        (unsigned long *pVersion);
RIE_Responses RadioInit                 (RIE_BaseConfigs BaseConfig);
RIE_Responses RadioPowerOff             (void);
RIE_Responses RadioTerminateRadioOp     (void);
RIE_Responses RadioSetFrequency         (unsigned long Frequency);
RIE_Responses RadioSetModulationType    (RIE_ModulationTypes ModulationType);
RIE_Responses RadioPayldManchesterEncode(RIE_BOOL bEnable);
RIE_Responses RadioPayldDataWhitening   (RIE_BOOL bEnable);
RIE_Responses RadioTxPacketFixedLen     (unsigned char Len, unsigned char *pData);
RIE_BOOL      RadioTxPacketComplete     (void);
RIE_Responses RadioTxSetPA              (RIE_PATypes PAType,RIE_PAPowerLevel Power);
RIE_Responses RadioTxCarrier            (void);
RIE_Responses RadioTxPreamble           (void);
RIE_Responses RadioRxPacketFixedLen     (unsigned char Len);
RIE_BOOL      RadioRxPacketAvailable    (void);
RIE_Responses RadioRxPacketRead         (unsigned char BufferLen,unsigned char *pPktLen,unsigned char *pData,signed char *pRSSIdBm);
RIE_Responses RadioRxBERTestMode        (void);


RIE_Responses RadioSwitchConfig         (RIE_BaseConfigs BaseConfig);
RIE_Responses RadioRadioGetRSSI         (signed char *pRSSIdBm);
RIE_Responses RadioTxSetPower           (RIE_PAPowerLevel Power);


RIE_Responses RadioTxPacketVariableLen  (unsigned char Len, unsigned char *pData);
RIE_Responses RadioRxPacketVariableLen  (void);


RIE_Responses RadioDeInit               (void);





#line 35 "..\\..\\Common\\include.h"

#line 1 "..\\..\\DasLib\\AdcLib.h"



















 

extern int AdcPd(int iPd);
extern int AdcInit(int iRefBuf, int iInt, int iDMA);
extern int AdcCnv(int iMode, int iStart);
extern int AdcRd(int iCal);
extern int AdcSta(void);
extern int AdcCfg(int iChan, int iRef, int iClk, int iAcq);


#line 37 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\ClkLib.h"














 

extern int SysClkCfg(int iCd, int iClkScr, int iClkOut, int iXosc);
extern int PerClkIni(int iMode, int iClk);
extern int PerClkAct(int iEnable, int iClk);
extern int PerClkPd(int iEnable, int iClk);
extern int ExtClkCfg(int iXosc);
#line 38 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\DioLib.h"



















 
#line 22 "..\\..\\DasLib\\DioLib.h"

#line 31 "..\\..\\DasLib\\DioLib.h"


extern int DioCfg(ADI_GPIO_TypeDef *pPort, int iMpx);
extern int DioDrv(ADI_GPIO_TypeDef *pPort, int iOen, int iPul, int iOce);
extern int DioOen(ADI_GPIO_TypeDef *pPort, int iOen);
extern int DioPul(ADI_GPIO_TypeDef *pPort, int iPul);
extern int DioOce(ADI_GPIO_TypeDef *pPort, int iOce);
extern int DioTriState(ADI_GPIO_TypeDef *pPort); 


extern int DioCfgPin(ADI_GPIO_TypeDef *pPort, int iPin, int iMode);  
extern int DioOenPin(ADI_GPIO_TypeDef *pPort, int iPin, int iOen);   
extern int DioPulPin(ADI_GPIO_TypeDef *pPort, int iPin, int iPul);   
extern int DioOcePin(ADI_GPIO_TypeDef *pPort, int iPin, int iOce);   
extern int DioTriStatePin(ADI_GPIO_TypeDef *pPort, int iPin);        

extern int DioRd(ADI_GPIO_TypeDef *pPort);
extern int DioWr(ADI_GPIO_TypeDef *pPort, int iVal);
extern int DioSet(ADI_GPIO_TypeDef *pPort, int iVal);
extern int DioClr(ADI_GPIO_TypeDef *pPort, int iVal);
extern int DioTgl(ADI_GPIO_TypeDef *pPort, int iVal);




#line 39 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\DmaLib.h"
















 
#line 19 "..\\..\\DasLib\\DmaLib.h"


typedef struct dmaDesc
{
   unsigned int srcEndPtr;
   unsigned int destEndPtr;
   unsigned int ctrlCfgVal;
   unsigned int reserved4Bytes;
} DmaDesc;


 







extern int DmaInit(void); 
extern int DmaTransferSetup(int iChan, int iNumVals, unsigned char *pucDMA);
extern int DmaChanSetup (unsigned int iChan, unsigned char iEnable, int iPriority); 



#line 55 "..\\..\\DasLib\\DmaLib.h"







#line 40 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\FeeLib.h"














 

#line 18 "..\\..\\DasLib\\FeeLib.h"






extern int FeeMErs(void);
extern int FeePErs(unsigned long lPage);
extern int FeeWrPro(unsigned long lKey);
extern int FeeWrProTmp(unsigned long lKey);
extern int FeeRdPro(int iMde);
extern int FeeRdProTmp(int iMde);
extern int FeeWrEn(int iMde);
extern int FeeSta(void);
extern int FeeFAKey(unsigned long long udKey);
extern int FeeIntAbt(unsigned int iAEN0, unsigned int iAEN1, unsigned int iAEN2);
extern int FeeAbtAdr(void);
extern int FeeSign(unsigned long ulStartAddr, unsigned long ulEndAddr);
extern int FeeSig(void);
#line 41 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\GptLib.h"














 
#line 17 "..\\..\\DasLib\\GptLib.h"

extern int GptCfg(ADI_TIMER_TypeDef *pTMR, int iClkSrc, int iScale, int iMode);
extern int GptLd(ADI_TIMER_TypeDef *pTMR, int iTld);
extern int GptVal(ADI_TIMER_TypeDef *pTMR);
extern int GptCapRd(ADI_TIMER_TypeDef *pTMR);
extern int GptCapSrc(ADI_TIMER_TypeDef *pTMR, int iTCapSrc);
extern int GptSta(ADI_TIMER_TypeDef *pTMR);
extern int GptClrInt(ADI_TIMER_TypeDef *pTMR, int iSource);
extern int GptBsy(ADI_TIMER_TypeDef *pTMR);


#line 42 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\I2cLib.h"















 

#line 19 "..\\..\\DasLib\\I2cLib.h"

extern int I2cMCfg(int iDMACfg, int iIntSources, int iConfig);
extern int I2cStretch(int iMode, int iStretch);
extern int I2cFifoFlush(int iMode, int iFlush);
extern int I2cSCfg(int iDMACfg, int iIntSources, int iConfig);
extern int I2cRx(int iMode);
extern int I2cTx(int iMode, int iTx);
extern int I2cBaud(int iHighPeriod, int iLowPeriod);
extern int I2cMWrCfg(unsigned int uiDevAddr);
extern int I2cMRdCfg(unsigned int uiDevAddr, int iNumBytes, int iExt);
extern int I2cSta(int iMode);
extern int I2cMRdCnt(void);		
extern int I2cSGCallCfg(int iHWGCallAddr);
extern int I2cSIDCfg(int iSlaveID0, int iSlaveID1, int iSlaveID2, int iSlaveID3);	


#line 43 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\IntLib.h"














 

extern int EiCfg(int iEiNr, int iEnable, int iMode);
extern int EiClr(int iEiNr);
extern int NmiClr(void);


#line 44 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\PwmLib.h"














 

extern int PwmInit(unsigned int iPWMCP, unsigned int iPWMIEN, unsigned int iSYNC, unsigned int iTRIP);
extern int PwmClrInt(unsigned int iSource);
extern int PwmTime(int iPair, unsigned int uiFreq, unsigned int uiPWMH_High, unsigned int uiPWML_High); 
extern int PwmGo(unsigned int iPWMEN, unsigned int iHMODE);
extern int PwmHBCfg(unsigned int iENA, unsigned int iPOINV, unsigned int iHOFF, unsigned int iDIR);
extern int PwmInvert(int iInv1, int iInv3, int iInv5, int iInv7);
extern int PwmLoad(int iLoad);
#line 45 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\PwrLib.h"














 

extern int SramCfg(int iEnable);
extern int PwrSta(void);
extern int PsmCfg(int iEnable);
extern int PwrCfg(int iMode, int iExit);

#line 46 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\RstLib.h"














 

extern int RstClr(int iSource);
extern int RstSta(void);
extern int ShutSta(void);
#line 47 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\SpiLib.h"














 

#line 18 "..\\..\\DasLib\\SpiLib.h"

extern int SpiCfg(ADI_SPI_TypeDef *pSPI, int iFifoSize, int iMasterEn, int iConfig);
extern int SpiRx(ADI_SPI_TypeDef *pSPI);
extern int SpiTx(ADI_SPI_TypeDef *pSPI, int iTx);
extern int SpiSta(ADI_SPI_TypeDef *pSPI);
extern int SpiBaud(ADI_SPI_TypeDef *pSPI, int iClkDiv, int iCserr);
extern int SpiFifoFlush(ADI_SPI_TypeDef *pSPI, int iTxFlush, int iRxFlush);
extern int SpiTxFifoFlush(ADI_SPI_TypeDef *pSPI, int iTxFlush);
extern int SpiRxFifoFlush(ADI_SPI_TypeDef *pSPI, int iRxFlush);
extern int SpiDma(ADI_SPI_TypeDef *pSPI, int iDmaRxSel, int iDmaTxSel, int iDmaEn);
extern int SpiCountRd(ADI_SPI_TypeDef *pSPI);

#line 48 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\UrtLib.h"



















 

extern int UrtLinCfg(int iChan, int iBaud, int iBits, int iFormat);
extern int UrtLinSta(int iChan);

extern int UrtTx(int iChan, int iTx);
extern int UrtRx(int iChan);

extern int UrtIntCfg(int iChan, int iIrq);
extern int UrtIntSta(int iChan);

extern int UrtModCfg(int iChan, int iMcr, int iWr);
extern int UrtModSta(int iChan);

extern int UrtDma(int iChan, int iDmaSel);
extern int UrtBrk(int iChan, int iBrk);

#line 49 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\WdtLib.h"














 

extern int WdtCfg(int iPre, int iInt, int iPd);
extern int WdtGo(int iEnable);
extern int WdtLd(int iTld);
extern int WdtVal(void);
extern int WdtSta(void);
extern int WdtClrInt(int iSource);

#line 50 "..\\..\\Common\\include.h"
#line 1 "..\\..\\DasLib\\WutLib.h"














 

extern int WutCfg(int iMode, int iWake, int iPre, int iClkSrc);
extern int WutCfgInt(int iSource, int iEnable);
extern int WutClrInt(int iSource);
extern int WutGo(int iEnable);
extern int WutInc(int iInc);
extern unsigned long WutLdRd(int iField);
extern int WutLdWr(int iField, unsigned long lTld);
extern int WutSta(void);
extern long WutVal(void);

#line 51 "..\\..\\Common\\include.h"


#line 67 "src\\SD_SPI\\diskio.c"






static
void dly_us(UINT n)
{
    BYTE i;
    while(n--)
        i=(16000000/1000000);   
                                    
        while(i--);
}

static
BYTE _mmc (
    BYTE dat 
){
{
	SpiTx(((ADI_SPI_TypeDef *)0x40004400UL), dat);		            
	while ((SpiSta(((ADI_SPI_TypeDef *)0x40004400UL)) & (0x1 << 5 )) != (0x1 << 5 )) ; 
	return SpiRx(((ADI_SPI_TypeDef *)0x40004400UL));              
}
}







 

 
#line 124 "src\\SD_SPI\\diskio.c"


static
DSTATUS Stat = 0x01;     

static
BYTE CardType;           



 
 
 

static
void xmit_mmc (
    const BYTE* buff,     
    UINT bc               
)
{
    BYTE d;


    do {
        d = *buff++;     
        _mmc(d);
    } while (--bc);
}



 
 
 

static
void rcvr_mmc (
    BYTE *buff,     
    UINT bc         
)
{
    do {
        *buff++ = _mmc(0xff);             
    } while (--bc);
}



 
 
 

static
int wait_ready (void)     
{
    BYTE d;
    UINT tmr;


    for (tmr = 5000; tmr; tmr--) {     
        rcvr_mmc(&d, 1);
        if (d == 0xFF) break;
        dly_us(100);
    }

    return tmr ? 1 : 0;
}



 
 
 

static
void deselect (void)
{
    BYTE d;

    DioSet(((ADI_GPIO_TypeDef *)0x40006000UL),DioRd(((ADI_GPIO_TypeDef *)0x40006000UL))&0xf7);
    rcvr_mmc(&d, 1); 
}



 
 
 

static
int select (void)     
{
    BYTE d;

    DioSet(((ADI_GPIO_TypeDef *)0x40006000UL),DioRd(((ADI_GPIO_TypeDef *)0x40006000UL))|0x08);
    rcvr_mmc(&d, 1);     

    if (wait_ready()) return 1;     
    deselect();
    return 0;             
}



 
 
 

static
int rcvr_datablock (     
    BYTE *buff,             
    UINT btr             
)
{
    BYTE d[2];
    UINT tmr;


    for (tmr = 1000; tmr; tmr--) { 
        rcvr_mmc(d, 1);
        if (d[0] != 0xFF) break;
        dly_us(100);
    }
    if (d[0] != 0xFE) return 0; 

    rcvr_mmc(buff, btr); 
    rcvr_mmc(d, 2); 

    return 1; 
}



 
 
 

static
int xmit_datablock ( 
    const BYTE *buff, 
    BYTE token 
)
{
    BYTE d[10];


    if (!wait_ready()) return 0;

    d[0] = token;
    xmit_mmc(d, 1);              
    if (token != 0xFD) {         
        xmit_mmc(buff, 512);     
        rcvr_mmc(d, 2);          
        rcvr_mmc(d, 10);         


















 
        if (((d[0] & 0x1F) != 0x05)&&((d[1] & 0x1F) != 0x05))
             
            return 0;
    }

    return 1;
}

 
 
 
void SPI_init(void){
	  DioCfg(((ADI_GPIO_TypeDef *)0x40006000UL),(0x1 << 0 ) | (0x1 << 2 ) | (0x1 << 4 ) | (0x1 << 6 )); 
    SpiBaud(((ADI_SPI_TypeDef *)0x40004400UL),0x3F,(0x1 << 7 ));
    SpiCfg(((ADI_SPI_TypeDef *)0x40004400UL),(0x0 << 14 ),(0x1 << 1 ),(0x1 << 0 )|(0x1 << 2 )|(0x1 << 3 )|(0x1 << 6 )); 
}
 
 
 

static
BYTE send_cmd (         
    BYTE cmd,         
    DWORD arg         
)
{
    BYTE n, d, buf[6];


    if (cmd & 0x80) {     
        cmd &= 0x7F;
        n = send_cmd((55), 0);
        if (n > 1) return n;
    }

     
    if (cmd != (12)) {
        deselect();
        if (!select()) return 0xFF;
    }

     
    buf[0] = 0x40 | cmd;             
    buf[1] = (BYTE)(arg >> 24);         
    buf[2] = (BYTE)(arg >> 16);         
    buf[3] = (BYTE)(arg >> 8);         
    buf[4] = (BYTE)arg;                 
    n = 0x01;                         
    if (cmd == (0)) n = 0x95;         
    if (cmd == (8)) n = 0x87;         
    buf[5] = n;
    xmit_mmc(buf, 6);

     
    if (cmd == (12)) rcvr_mmc(&d, 1); 
    n = 10; 
    do
        rcvr_mmc(&d, 1);
    while ((d & 0x80) && --n);

    return d;             
}







 


 
 
 

DSTATUS disk_status (
    BYTE drv             
)
{
    if (drv) return 0x01;

    return Stat;
}



 
 
 

DSTATUS disk_initialize (
    BYTE drv         
)
{
    BYTE n, ty, cmd, buf[4];
    UINT tmr;
    DSTATUS s;

	  SPI_init();

    if (drv) return RES_NOTRDY;

    dly_us(10000); 

     
    for (n = 10; n; n--) rcvr_mmc(buf, 1);

    ty = 0;
    if (send_cmd((0), 0) == 1) {             
        if (send_cmd((8), 0x1AA) == 1) {     
            rcvr_mmc(buf, 4);  
             
            if (buf[2] == 0x01 && buf[3] == 0xAA) {
                 
                for (tmr = 1000; tmr; tmr--) {
                    if (send_cmd((0x80+41), 1UL << 30) == 0) break;
                    dly_us(1000);
                }
                 
                if (tmr && send_cmd((58), 0) == 0) {
                    rcvr_mmc(buf, 4);
                    ty = (buf[0] & 0x40) ? 0x04 | 0x08 : 0x04; 
                }
            }
        } else {                                 
            if (send_cmd((0x80+41), 0) <= 1)     {
                ty = 0x02; cmd = (0x80+41);       
            } else {
                ty = 0x01; cmd = (1);         
            }
            for (tmr = 1000; tmr; tmr--) {       
                if (send_cmd(cmd, 0) == 0) break;
                dly_us(1000);
            }
            if (!tmr || send_cmd((16), 512)!= 0) 
                ty = 0;
        }
    }
    CardType = ty;
    s = ty ? 0 : 0x01;
    Stat = s;

    deselect();

    return s;
}



 
 
 

DRESULT disk_read (
    BYTE drv,             
    BYTE *buff,           
    DWORD sector,         
    UINT count            
)
{
    BYTE cmd;


    if (disk_status(drv) & 0x01) return RES_NOTRDY;
     
    if (!(CardType & 0x08)) sector *= 512;

    cmd = count > 1 ? (18) : (17); 
    if (send_cmd(cmd, sector) == 0) {
        do {
            if (!rcvr_datablock(buff, 512)) break;
            buff += 512;
        } while (--count);
        if (cmd == (18)) send_cmd((12), 0); 
    }
    deselect();

    return count ? RES_ERROR : RES_OK;
}



 
 
 

DRESULT disk_write (
    BYTE drv,             
    const BYTE *buff,     
    DWORD sector,         
    UINT count            
)
{
    if (disk_status(drv) & 0x01) return RES_NOTRDY;
     
    if (!(CardType & 0x08)) sector *= 512;

    if (count == 1) {                        
        if ((send_cmd((24), sector) == 0)   
            && xmit_datablock(buff, 0xFE))
            count = 0;
    }
    else {                                   
        if (CardType & (0x02|0x04)) send_cmd((0x80+23), count);
        if (send_cmd((25), sector) == 0) {  
            do {
                if (!xmit_datablock(buff, 0xFC)) break;
                buff += 512;
            } while (--count);
            if (!xmit_datablock(0, 0xFD))     
                count = 1;
        }
    }
    deselect();

    return count ? RES_ERROR : RES_OK;
}


 
 
 

DRESULT disk_ioctl (
    BYTE drv,         
    BYTE ctrl,        
    void *buff        
)
{
    DRESULT res;
    BYTE n, csd[16];
    DWORD cs;

     
    if (disk_status(drv) & 0x01) return RES_NOTRDY;

    res = RES_ERROR;
    switch (ctrl) {
        case 0 :         
            if (select()) res = RES_OK;
            break;

        case 1 :  
            if ((send_cmd((9), 0) == 0) && rcvr_datablock(csd, 16)) {
                if ((csd[0] >> 6) == 1) {     
                    cs = csd[9] + ((WORD)csd[8] << 8) +
                            ((DWORD)(csd[7] & 63) << 16) + 1;
                    *(DWORD*)buff = cs << 10;
                } else {                             
                    n = (csd[5] & 15) + ((csd[10] & 128) >> 7) +
                            ((csd[9] & 3) << 1) + 2;
                    cs = (csd[8] >> 6) + ((WORD)csd[7] << 2) +
                            ((WORD)(csd[6] & 3) << 10) + 1;
                    *(DWORD*)buff = cs << (n - 9);
                }
                res = RES_OK;
            }
            break;

        case 3 : 
            *(DWORD*)buff = 128;
            res = RES_OK;
            break;

        default:
            res = RES_PARERR;
    }

    deselect();

    return res;
}
