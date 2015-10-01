#line 1 "src\\SD_SPI\\ff.c"















 


#line 1 "src\\SD_SPI\\ff.h"















 










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



#line 28 "src\\SD_SPI\\ff.h"
#line 1 "src\\SD_SPI\\ffconf.h"


 





 






 






 









 








 




 



 



 




 




 




 






















 















 





 











 









 




 


 








 







 









 





 











 





 












 











 



















 























 

#line 29 "src\\SD_SPI\\ff.h"






 

#line 49 "src\\SD_SPI\\ff.h"





 

#line 68 "src\\SD_SPI\\ff.h"
typedef char TCHAR;








 

typedef struct {
	BYTE	fs_type;		 
	BYTE	drv;			 
	BYTE	csize;			 
	BYTE	n_fats;			 
	BYTE	wflag;			 
	BYTE	fsi_flag;		 
	WORD	id;				 
	WORD	n_rootdir;		 
#line 95 "src\\SD_SPI\\ff.h"
	DWORD	last_clust;		 
	DWORD	free_clust;		 




	DWORD	n_fatent;		 
	DWORD	fsize;			 
	DWORD	volbase;		 
	DWORD	fatbase;		 
	DWORD	dirbase;		 
	DWORD	database;		 
	DWORD	winsect;		 
	BYTE	win[512];	 
} FATFS;



 

typedef struct {
	FATFS*	fs;				 
	WORD	id;				 
	BYTE	flag;			 
	BYTE	err;			 
	DWORD	fptr;			 
	DWORD	fsize;			 
	DWORD	sclust;			 
	DWORD	clust;			 
	DWORD	dsect;			 

	DWORD	dir_sect;		 
	BYTE*	dir_ptr;		 


	DWORD*	cltbl;			 


	UINT	lockid;			 


	BYTE	buf[512];	 

} FIL;



 

typedef struct {
	FATFS*	fs;				 
	WORD	id;				 
	WORD	index;			 
	DWORD	sclust;			 
	DWORD	clust;			 
	DWORD	sect;			 
	BYTE*	dir;			 
	BYTE*	fn;				 

	UINT	lockid;			 
#line 161 "src\\SD_SPI\\ff.h"
	const TCHAR*	pat;	 

} DIR;



 

typedef struct {
	DWORD	fsize;			 
	WORD	fdate;			 
	WORD	ftime;			 
	BYTE	fattrib;		 
	TCHAR	fname[13];		 




} FILINFO;



 

typedef enum {
	FR_OK = 0,				 
	FR_DISK_ERR,			 
	FR_INT_ERR,				 
	FR_NOT_READY,			 
	FR_NO_FILE,				 
	FR_NO_PATH,				 
	FR_INVALID_NAME,		 
	FR_DENIED,				 
	FR_EXIST,				 
	FR_INVALID_OBJECT,		 
	FR_WRITE_PROTECTED,		 
	FR_INVALID_DRIVE,		 
	FR_NOT_ENABLED,			 
	FR_NO_FILESYSTEM,		 
	FR_MKFS_ABORTED,		 
	FR_TIMEOUT,				 
	FR_LOCKED,				 
	FR_NOT_ENOUGH_CORE,		 
	FR_TOO_MANY_OPEN_FILES,	 
	FR_INVALID_PARAMETER	 
} FRESULT;



 
 

FRESULT f_open (FIL* fp, const TCHAR* path, BYTE mode);				 
FRESULT f_close (FIL* fp);											 
FRESULT f_read (FIL* fp, void* buff, UINT btr, UINT* br);			 
FRESULT f_write (FIL* fp, const void* buff, UINT btw, UINT* bw);	 
FRESULT f_forward (FIL* fp, UINT(*func)(const BYTE*,UINT), UINT btf, UINT* bf);	 
FRESULT f_lseek (FIL* fp, DWORD ofs);								 
FRESULT f_truncate (FIL* fp);										 
FRESULT f_sync (FIL* fp);											 
FRESULT f_opendir (DIR* dp, const TCHAR* path);						 
FRESULT f_closedir (DIR* dp);										 
FRESULT f_readdir (DIR* dp, FILINFO* fno);							 
FRESULT f_findfirst (DIR* dp, FILINFO* fno, const TCHAR* path, const TCHAR* pattern);	 
FRESULT f_findnext (DIR* dp, FILINFO* fno);							 
FRESULT f_mkdir (const TCHAR* path);								 
FRESULT f_unlink (const TCHAR* path);								 
FRESULT f_rename (const TCHAR* path_old, const TCHAR* path_new);	 
FRESULT f_stat (const TCHAR* path, FILINFO* fno);					 
FRESULT f_chmod (const TCHAR* path, BYTE attr, BYTE mask);			 
FRESULT f_utime (const TCHAR* path, const FILINFO* fno);			 
FRESULT f_chdir (const TCHAR* path);								 
FRESULT f_chdrive (const TCHAR* path);								 
FRESULT f_getcwd (TCHAR* buff, UINT len);							 
FRESULT f_getfree (const TCHAR* path, DWORD* nclst, FATFS** fatfs);	 
FRESULT f_getlabel (const TCHAR* path, TCHAR* label, DWORD* vsn);	 
FRESULT f_setlabel (const TCHAR* label);							 
FRESULT f_mount (FATFS* fs, const TCHAR* path, BYTE opt);			 
FRESULT f_mkfs (const TCHAR* path, BYTE sfd, UINT au);				 
FRESULT f_fdisk (BYTE pdrv, const DWORD szt[], void* work);			 
int f_putc (TCHAR c, FIL* fp);										 
int f_puts (const TCHAR* str, FIL* cp);								 
int f_printf (FIL* fp, const TCHAR* str, ...);						 
TCHAR* f_gets (TCHAR* buff, int len, FIL* fp);						 

#line 252 "src\\SD_SPI\\ff.h"








 
 

 




 
#line 277 "src\\SD_SPI\\ff.h"

 
#line 285 "src\\SD_SPI\\ff.h"




 
 


 




#line 306 "src\\SD_SPI\\ff.h"


 






 

#line 325 "src\\SD_SPI\\ff.h"


 




 
 

#line 346 "src\\SD_SPI\\ff.h"





#line 20 "src\\SD_SPI\\ff.c"
#line 1 "src\\SD_SPI\\diskio.h"


 











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


 






 

 






 





 






 




 










#line 21 "src\\SD_SPI\\ff.c"






 






 
#line 45 "src\\SD_SPI\\ff.c"




 
#line 58 "src\\SD_SPI\\ff.c"


 
#line 69 "src\\SD_SPI\\ff.c"


 




typedef struct {
	FATFS *fs;		 
	DWORD clu;		 
	WORD idx;		 
	WORD ctr;		 
} FILESEM;




 

#line 130 "src\\SD_SPI\\ff.c"

#line 281 "src\\SD_SPI\\ff.c"


 




#line 303 "src\\SD_SPI\\ff.c"







 
#line 318 "src\\SD_SPI\\ff.c"


 






 

#line 366 "src\\SD_SPI\\ff.c"

#line 388 "src\\SD_SPI\\ff.c"




 
 
 



 




static FATFS *FatFs[1];	 
static WORD Fsid;				 






static FILESEM Files[1];	 


#line 439 "src\\SD_SPI\\ff.c"


static const BYTE ExCvt[] = {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F,0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, 0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, 0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, 0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF};	 











 


 
 
 

 
static
void mem_cpy (void* dst, const void* src, UINT cnt) {
	BYTE *d = (BYTE*)dst;
	const BYTE *s = (const BYTE*)src;

#line 473 "src\\SD_SPI\\ff.c"
	while (cnt--)
		*d++ = *s++;
}

 
static
void mem_set (void* dst, int val, UINT cnt) {
	BYTE *d = (BYTE*)dst;

	while (cnt--)
		*d++ = (BYTE)val;
}

 
static
int mem_cmp (const void* dst, const void* src, UINT cnt) {
	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
	int r = 0;

	while (cnt-- && (r = *d++ - *s++) == 0) ;
	return r;
}

 
static
int chk_chr (const char* str, int chr) {
	while (*str && *str != chr) str++;
	return *str;
}




 
 
 
#line 534 "src\\SD_SPI\\ff.c"




 
 
 


static
FRESULT chk_lock (	 
	DIR* dp,		 
	int acc			 
)
{
	UINT i, be;

	 
	for (i = be = 0; i < 1; i++) {
		if (Files[i].fs) {	 
			if (Files[i].fs == dp->fs &&	 	 
				Files[i].clu == dp->sclust &&
				Files[i].idx == dp->index) break;
		} else {			 
			be = 1;
		}
	}
	if (i == 1)	 
		return (be || acc == 2) ? FR_OK : FR_TOO_MANY_OPEN_FILES;	 

	 
	return (acc || Files[i].ctr == 0x100) ? FR_LOCKED : FR_OK;
}


static
int enq_lock (void)	 
{
	UINT i;

	for (i = 0; i < 1 && Files[i].fs; i++) ;
	return (i == 1) ? 0 : 1;
}


static
UINT inc_lock (	 
	DIR* dp,	 
	int acc		 
)
{
	UINT i;


	for (i = 0; i < 1; i++) {	 
		if (Files[i].fs == dp->fs &&
			Files[i].clu == dp->sclust &&
			Files[i].idx == dp->index) break;
	}

	if (i == 1) {				 
		for (i = 0; i < 1 && Files[i].fs; i++) ;
		if (i == 1) return 0;	 
		Files[i].fs = dp->fs;
		Files[i].clu = dp->sclust;
		Files[i].idx = dp->index;
		Files[i].ctr = 0;
	}

	if (acc && Files[i].ctr) return 0;	 

	Files[i].ctr = acc ? 0x100 : Files[i].ctr + 1;	 

	return i + 1;
}


static
FRESULT dec_lock (	 
	UINT i			 
)
{
	WORD n;
	FRESULT res;


	if (--i < 1) {	 
		n = Files[i].ctr;
		if (n == 0x100) n = 0;		 
		if (n) n--;					 
		Files[i].ctr = n;
		if (!n) Files[i].fs = 0;	 
		res = FR_OK;
	} else {
		res = FR_INT_ERR;			 
	}
	return res;
}


static
void clear_lock (	 
	FATFS *fs
)
{
	UINT i;

	for (i = 0; i < 1; i++) {
		if (Files[i].fs == fs) Files[i].fs = 0;
	}
}





 
 
 

static
FRESULT sync_window (
	FATFS* fs		 
)
{
	DWORD wsect;
	UINT nf;
	FRESULT res = FR_OK;


	if (fs->wflag) {	 
		wsect = fs->winsect;	 
		if (disk_write(fs->drv, fs->win, wsect, 1) != RES_OK) {
			res = FR_DISK_ERR;
		} else {
			fs->wflag = 0;
			if (wsect - fs->fatbase < fs->fsize) {		 
				for (nf = fs->n_fats; nf >= 2; nf--) {	 
					wsect += fs->fsize;
					disk_write(fs->drv, fs->win, wsect, 1);
				}
			}
		}
	}
	return res;
}



static
FRESULT move_window (
	FATFS* fs,		 
	DWORD sector	 
)
{
	FRESULT res = FR_OK;


	if (sector != fs->winsect) {	 

		res = sync_window(fs);		 

		if (res == FR_OK) {			 
			if (disk_read(fs->drv, fs->win, sector, 1) != RES_OK) {
				sector = 0xFFFFFFFF;	 
				res = FR_DISK_ERR;
			}
			fs->winsect = sector;
		}
	}
	return res;
}




 
 
 

static
FRESULT sync_fs (	 
	FATFS* fs		 
)
{
	FRESULT res;


	res = sync_window(fs);
	if (res == FR_OK) {
		 
		if (fs->fs_type == 3 && fs->fsi_flag == 1) {
			 
			mem_set(fs->win, 0, ((UINT)512));
			*(BYTE*)(fs->win + 510)=(BYTE)(0xAA55); *((BYTE*)(fs->win + 510)+1)=(BYTE)((WORD)(0xAA55)>>8);
			*(BYTE*)(fs->win + 0)=(BYTE)(0x41615252); *((BYTE*)(fs->win + 0)+1)=(BYTE)((WORD)(0x41615252)>>8); *((BYTE*)(fs->win + 0)+2)=(BYTE)((DWORD)(0x41615252)>>16); *((BYTE*)(fs->win + 0)+3)=(BYTE)((DWORD)(0x41615252)>>24);
			*(BYTE*)(fs->win + 484)=(BYTE)(0x61417272); *((BYTE*)(fs->win + 484)+1)=(BYTE)((WORD)(0x61417272)>>8); *((BYTE*)(fs->win + 484)+2)=(BYTE)((DWORD)(0x61417272)>>16); *((BYTE*)(fs->win + 484)+3)=(BYTE)((DWORD)(0x61417272)>>24);
			*(BYTE*)(fs->win + 488)=(BYTE)(fs->free_clust); *((BYTE*)(fs->win + 488)+1)=(BYTE)((WORD)(fs->free_clust)>>8); *((BYTE*)(fs->win + 488)+2)=(BYTE)((DWORD)(fs->free_clust)>>16); *((BYTE*)(fs->win + 488)+3)=(BYTE)((DWORD)(fs->free_clust)>>24);
			*(BYTE*)(fs->win + 492)=(BYTE)(fs->last_clust); *((BYTE*)(fs->win + 492)+1)=(BYTE)((WORD)(fs->last_clust)>>8); *((BYTE*)(fs->win + 492)+2)=(BYTE)((DWORD)(fs->last_clust)>>16); *((BYTE*)(fs->win + 492)+3)=(BYTE)((DWORD)(fs->last_clust)>>24);
			 
			fs->winsect = fs->volbase + 1;
			disk_write(fs->drv, fs->win, fs->winsect, 1);
			fs->fsi_flag = 0;
		}
		 
		if (disk_ioctl(fs->drv, 0, 0) != RES_OK)
			res = FR_DISK_ERR;
	}

	return res;
}





 
 
 
 

DWORD clust2sect (	 
	FATFS* fs,		 
	DWORD clst		 
)
{
	clst -= 2;
	if (clst >= fs->n_fatent - 2) return 0;		 
	return clst * fs->csize + fs->database;
}




 
 
 
 

DWORD get_fat (	 
	FATFS* fs,	 
	DWORD clst	 
)
{
	UINT wc, bc;
	BYTE *p;
	DWORD val;


	if (clst < 2 || clst >= fs->n_fatent) {	 
		val = 1;	 

	} else {
		val = 0xFFFFFFFF;	 

		switch (fs->fs_type) {
		case 1 :
			bc = (UINT)clst; bc += bc / 2;
			if (move_window(fs, fs->fatbase + (bc / ((UINT)512))) != FR_OK) break;
			wc = fs->win[bc++ % ((UINT)512)];
			if (move_window(fs, fs->fatbase + (bc / ((UINT)512))) != FR_OK) break;
			wc |= fs->win[bc % ((UINT)512)] << 8;
			val = clst & 1 ? wc >> 4 : (wc & 0xFFF);
			break;

		case 2 :
			if (move_window(fs, fs->fatbase + (clst / (((UINT)512) / 2))) != FR_OK) break;
			p = &fs->win[clst * 2 % ((UINT)512)];
			val = (WORD)(((WORD)*((BYTE*)(p)+1)<<8)|(WORD)*(BYTE*)(p));
			break;

		case 3 :
			if (move_window(fs, fs->fatbase + (clst / (((UINT)512) / 4))) != FR_OK) break;
			p = &fs->win[clst * 4 % ((UINT)512)];
			val = (DWORD)(((DWORD)*((BYTE*)(p)+3)<<24)|((DWORD)*((BYTE*)(p)+2)<<16)|((WORD)*((BYTE*)(p)+1)<<8)| *(BYTE*)(p)) & 0x0FFFFFFF;
			break;

		default:
			val = 1;	 
		}
	}

	return val;
}




 
 
 
 


FRESULT put_fat (
	FATFS* fs,	 
	DWORD clst,	 
	DWORD val	 
)
{
	UINT bc;
	BYTE *p;
	FRESULT res;


	if (clst < 2 || clst >= fs->n_fatent) {	 
		res = FR_INT_ERR;

	} else {
		switch (fs->fs_type) {
		case 1 :
			bc = (UINT)clst; bc += bc / 2;
			res = move_window(fs, fs->fatbase + (bc / ((UINT)512)));
			if (res != FR_OK) break;
			p = &fs->win[bc++ % ((UINT)512)];
			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;
			fs->wflag = 1;
			res = move_window(fs, fs->fatbase + (bc / ((UINT)512)));
			if (res != FR_OK) break;
			p = &fs->win[bc % ((UINT)512)];
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));
			fs->wflag = 1;
			break;

		case 2 :
			res = move_window(fs, fs->fatbase + (clst / (((UINT)512) / 2)));
			if (res != FR_OK) break;
			p = &fs->win[clst * 2 % ((UINT)512)];
			*(BYTE*)(p)=(BYTE)((WORD)val); *((BYTE*)(p)+1)=(BYTE)((WORD)((WORD)val)>>8);
			fs->wflag = 1;
			break;

		case 3 :
			res = move_window(fs, fs->fatbase + (clst / (((UINT)512) / 4)));
			if (res != FR_OK) break;
			p = &fs->win[clst * 4 % ((UINT)512)];
			val |= (DWORD)(((DWORD)*((BYTE*)(p)+3)<<24)|((DWORD)*((BYTE*)(p)+2)<<16)|((WORD)*((BYTE*)(p)+1)<<8)| *(BYTE*)(p)) & 0xF0000000;
			*(BYTE*)(p)=(BYTE)(val); *((BYTE*)(p)+1)=(BYTE)((WORD)(val)>>8); *((BYTE*)(p)+2)=(BYTE)((DWORD)(val)>>16); *((BYTE*)(p)+3)=(BYTE)((DWORD)(val)>>24);
			fs->wflag = 1;
			break;

		default :
			res = FR_INT_ERR;
		}
	}

	return res;
}





 
 
 

static
FRESULT remove_chain (
	FATFS* fs,			 
	DWORD clst			 
)
{
	FRESULT res;
	DWORD nxt;




	if (clst < 2 || clst >= fs->n_fatent) {	 
		res = FR_INT_ERR;

	} else {
		res = FR_OK;
		while (clst < fs->n_fatent) {			 
			nxt = get_fat(fs, clst);			 
			if (nxt == 0) break;				 
			if (nxt == 1) { res = FR_INT_ERR; break; }	 
			if (nxt == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }	 
			res = put_fat(fs, clst, 0);			 
			if (res != FR_OK) break;
			if (fs->free_clust != 0xFFFFFFFF) {	 
				fs->free_clust++;
				fs->fsi_flag |= 1;
			}
#line 929 "src\\SD_SPI\\ff.c"
			clst = nxt;	 
		}
	}

	return res;
}





 
 
 

static
DWORD create_chain (	 
	FATFS* fs,			 
	DWORD clst			 
)
{
	DWORD cs, ncl, scl;
	FRESULT res;


	if (clst == 0) {		 
		scl = fs->last_clust;			 
		if (!scl || scl >= fs->n_fatent) scl = 1;
	}
	else {					 
		cs = get_fat(fs, clst);			 
		if (cs < 2) return 1;			 
		if (cs == 0xFFFFFFFF) return cs;	 
		if (cs < fs->n_fatent) return cs;	 
		scl = clst;
	}

	ncl = scl;				 
	for (;;) {
		ncl++;							 
		if (ncl >= fs->n_fatent) {		 
			ncl = 2;
			if (ncl > scl) return 0;	 
		}
		cs = get_fat(fs, ncl);			 
		if (cs == 0) break;				 
		if (cs == 0xFFFFFFFF || cs == 1) 
			return cs;
		if (ncl == scl) return 0;		 
	}

	res = put_fat(fs, ncl, 0x0FFFFFFF);	 
	if (res == FR_OK && clst != 0) {
		res = put_fat(fs, clst, ncl);	 
	}
	if (res == FR_OK) {
		fs->last_clust = ncl;			 
		if (fs->free_clust != 0xFFFFFFFF) {
			fs->free_clust--;
			fs->fsi_flag |= 1;
		}
	} else {
		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;
	}

	return ncl;		 
}





 
 
 


static
DWORD clmt_clust (	 
	FIL* fp,		 
	DWORD ofs		 
)
{
	DWORD cl, ncl, *tbl;


	tbl = fp->cltbl + 1;	 
	cl = ofs / ((UINT)512) / fp->fs->csize;	 
	for (;;) {
		ncl = *tbl++;			 
		if (!ncl) return 0;		 
		if (cl < ncl) break;	 
		cl -= ncl; tbl++;		 
	}
	return cl + *tbl;	 
}





 
 
 

static
FRESULT dir_sdi (
	DIR* dp,		 
	UINT idx		 
)
{
	DWORD clst, sect;
	UINT ic;


	dp->index = (WORD)idx;	 
	clst = dp->sclust;		 
	if (clst == 1 || clst >= dp->fs->n_fatent)	 
		return FR_INT_ERR;
	if (!clst && dp->fs->fs_type == 3)	 
		clst = dp->fs->dirbase;

	if (clst == 0) {	 
		if (idx >= dp->fs->n_rootdir)	 
			return FR_INT_ERR;
		sect = dp->fs->dirbase;
	}
	else {				 
		ic = ((UINT)512) / 32 * dp->fs->csize;	 
		while (idx >= ic) {	 
			clst = get_fat(dp->fs, clst);				 
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	 
			if (clst < 2 || clst >= dp->fs->n_fatent)	 
				return FR_INT_ERR;
			idx -= ic;
		}
		sect = clust2sect(dp->fs, clst);
	}
	dp->clust = clst;	 
	if (!sect) return FR_INT_ERR;
	dp->sect = sect + idx / (((UINT)512) / 32);					 
	dp->dir = dp->fs->win + (idx % (((UINT)512) / 32)) * 32;	 

	return FR_OK;
}




 
 
 

static
FRESULT dir_next (	 
	DIR* dp,		 
	int stretch		 
)
{
	DWORD clst;
	UINT i;

	UINT c;



	i = dp->index + 1;
	if (!(i & 0xFFFF) || !dp->sect)	 
		return FR_NO_FILE;

	if (!(i % (((UINT)512) / 32))) {	 
		dp->sect++;					 

		if (!dp->clust) {		 
			if (i >= dp->fs->n_rootdir)	 
				return FR_NO_FILE;
		}
		else {					 
			if (((i / (((UINT)512) / 32)) & (dp->fs->csize - 1)) == 0) {	 
				clst = get_fat(dp->fs, dp->clust);				 
				if (clst <= 1) return FR_INT_ERR;
				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
				if (clst >= dp->fs->n_fatent) {					 

					if (!stretch) return FR_NO_FILE;			 
					clst = create_chain(dp->fs, dp->clust);		 
					if (clst == 0) return FR_DENIED;			 
					if (clst == 1) return FR_INT_ERR;
					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
					 
					if (sync_window(dp->fs)) return FR_DISK_ERR; 
					mem_set(dp->fs->win, 0, ((UINT)512));		 
					dp->fs->winsect = clust2sect(dp->fs, clst);	 
					for (c = 0; c < dp->fs->csize; c++) {		 
						dp->fs->wflag = 1;
						if (sync_window(dp->fs)) return FR_DISK_ERR;
						dp->fs->winsect++;
					}
					dp->fs->winsect -= c;						 




				}
				dp->clust = clst;				 
				dp->sect = clust2sect(dp->fs, clst);
			}
		}
	}

	dp->index = (WORD)i;	 
	dp->dir = dp->fs->win + (i % (((UINT)512) / 32)) * 32;	 

	return FR_OK;
}




 
 
 


static
FRESULT dir_alloc (
	DIR* dp,	 
	UINT nent	 
)
{
	FRESULT res;
	UINT n;


	res = dir_sdi(dp, 0);
	if (res == FR_OK) {
		n = 0;
		do {
			res = move_window(dp->fs, dp->sect);
			if (res != FR_OK) break;
			if (dp->dir[0] == 0xE5 || dp->dir[0] == 0) {	 
				if (++n == nent) break;	 
			} else {
				n = 0;					 
			}
			res = dir_next(dp, 1);		 
		} while (res == FR_OK);
	}
	if (res == FR_NO_FILE) res = FR_DENIED;	 
	return res;
}





 
 
 

static
DWORD ld_clust (
	FATFS* fs,	 
	BYTE* dir	 
)
{
	DWORD cl;

	cl = (WORD)(((WORD)*((BYTE*)(dir + 26)+1)<<8)|(WORD)*(BYTE*)(dir + 26));
	if (fs->fs_type == 3)
		cl |= (DWORD)(WORD)(((WORD)*((BYTE*)(dir + 20)+1)<<8)|(WORD)*(BYTE*)(dir + 20)) << 16;

	return cl;
}



static
void st_clust (
	BYTE* dir,	 
	DWORD cl	 
)
{
	*(BYTE*)(dir + 26)=(BYTE)(cl); *((BYTE*)(dir + 26)+1)=(BYTE)((WORD)(cl)>>8);
	*(BYTE*)(dir + 20)=(BYTE)(cl >> 16); *((BYTE*)(dir + 20)+1)=(BYTE)((WORD)(cl >> 16)>>8);
}





 
 
 
#line 1322 "src\\SD_SPI\\ff.c"




 
 
 
#line 1381 "src\\SD_SPI\\ff.c"




 
 
 
#line 1401 "src\\SD_SPI\\ff.c"




 
 
 

static
FRESULT dir_find (
	DIR* dp			 
)
{
	FRESULT res;
	BYTE c, *dir;




	res = dir_sdi(dp, 0);			 
	if (res != FR_OK) return res;




	do {
		res = move_window(dp->fs, dp->sect);
		if (res != FR_OK) break;
		dir = dp->dir;					 
		c = dir[0];
		if (c == 0) { res = FR_NO_FILE; break; }	 
#line 1454 "src\\SD_SPI\\ff.c"
		if (!(dir[11] & 0x08) && !mem_cmp(dir, dp->fn, 11))  
			break;

		res = dir_next(dp, 0);		 
	} while (res == FR_OK);

	return res;
}




 
 
 

static
FRESULT dir_read (
	DIR* dp,		 
	int vol			 
)
{
	FRESULT res;
	BYTE a, c, *dir;




	res = FR_NO_FILE;
	while (dp->sect) {
		res = move_window(dp->fs, dp->sect);
		if (res != FR_OK) break;
		dir = dp->dir;					 
		c = dir[0];
		if (c == 0) { res = FR_NO_FILE; break; }	 
		a = dir[11] & 0x3F;
#line 1509 "src\\SD_SPI\\ff.c"
		if (c != 0xE5 && (0 || c != '.') && a != 0x0F && (int)((a & ~0x20) == 0x08) == vol)	 
			break;

		res = dir_next(dp, 0);				 
		if (res != FR_OK) break;
	}

	if (res != FR_OK) dp->sect = 0;

	return res;
}





 
 
 

static
FRESULT dir_register (	 
	DIR* dp				 
)
{
	FRESULT res;
#line 1581 "src\\SD_SPI\\ff.c"
	res = dir_alloc(dp, 1);		 


	if (res == FR_OK) {				 
		res = move_window(dp->fs, dp->sect);
		if (res == FR_OK) {
			mem_set(dp->dir, 0, 32);	 
			mem_cpy(dp->dir, dp->fn, 11);	 



			dp->fs->wflag = 1;
		}
	}

	return res;
}





 
 
 

static
FRESULT dir_remove (	 
	DIR* dp				 
)
{
	FRESULT res;
#line 1632 "src\\SD_SPI\\ff.c"
	res = dir_sdi(dp, dp->index);
	if (res == FR_OK) {
		res = move_window(dp->fs, dp->sect);
		if (res == FR_OK) {
			mem_set(dp->dir, 0, 32);	 
			*dp->dir = 0xE5;
			dp->fs->wflag = 1;
		}
	}


	return res;
}





 
 
 

static
void get_fileinfo (		 
	DIR* dp,			 
	FILINFO* fno	 	 
)
{
	UINT i;
	TCHAR *p, c;
	BYTE *dir;




	p = fno->fname;
	if (dp->sect) {		 
		dir = dp->dir;
		i = 0;
		while (i < 11) {		 
			c = (TCHAR)dir[i++];
			if (c == ' ') continue;				 
			if (c == 0x05) c = (TCHAR)0xE5;	 
			if (i == 9) *p++ = '.';				 
#line 1686 "src\\SD_SPI\\ff.c"
			*p++ = c;
		}
		fno->fattrib = dir[11];				 
		fno->fsize = (DWORD)(((DWORD)*((BYTE*)(dir + 28)+3)<<24)|((DWORD)*((BYTE*)(dir + 28)+2)<<16)|((WORD)*((BYTE*)(dir + 28)+1)<<8)| *(BYTE*)(dir + 28));	 
		fno->fdate = (WORD)(((WORD)*((BYTE*)(dir + 24)+1)<<8)|(WORD)*(BYTE*)(dir + 24));	 
		fno->ftime = (WORD)(((WORD)*((BYTE*)(dir + 22)+1)<<8)|(WORD)*(BYTE*)(dir + 22));	 
	}
	*p = 0;		 

#line 1714 "src\\SD_SPI\\ff.c"
}





 
 
 

static
WCHAR get_achar (		 
	const TCHAR** ptr	 
)
{
	WCHAR chr;


	chr = (BYTE)*(*ptr)++;					 
	if ((((chr)>= 'a')&&((chr)<= 'z'))) chr -= 0x20;			 
	if (0 && 0)		 
		chr = chr << 8 | (BYTE)*(*ptr)++;

	if (chr >= 0x80) chr = ExCvt[chr - 0x80];	 




	return chr;
}


static
int pattern_matching (	 
	const TCHAR* pat,	 
	const TCHAR* nam,	 
	int skip,			 
	int inf				 
)
{
	const TCHAR *pp, *np;
	WCHAR pc, nc;
	int nm, nx;


	while (skip--) {				 
		if (!get_achar(&nam)) return 0;	 
	}
	if (!*pat && inf) return 1;		 

	do {
		pp = pat; np = nam;			 
		for (;;) {
			if (*pp == '?' || *pp == '*') {	 
				nm = nx = 0;
				do {				 
					if (*pp++ == '?') nm++; else nx = 1;
				} while (*pp == '?' || *pp == '*');
				if (pattern_matching(pp, np, nm, nx)) return 1;	 
				nc = *np; break;	 
			}
			pc = get_achar(&pp);	 
			nc = get_achar(&np);	 
			if (pc != nc) break;	 
			if (!pc) return 1;		 
		}
		get_achar(&nam);			 
	} while (inf && nc);			 

	return 0;
}





 
 
 

static
FRESULT create_name (
	DIR* dp,			 
	const TCHAR** path	 
)
{
#line 1922 "src\\SD_SPI\\ff.c"
	BYTE b, c, d, *sfn;
	UINT ni, si, i;
	const char *p;

	 
	for (p = *path; *p == '/' || *p == '\\'; p++) ;	 
	sfn = dp->fn;
	mem_set(sfn, ' ', 11);
	si = i = b = 0; ni = 8;
#line 1944 "src\\SD_SPI\\ff.c"
	for (;;) {
		c = (BYTE)p[si++];
		if (c <= ' ' || c == '/' || c == '\\') break;	 
		if (c == '.' || i >= ni) {
			if (ni != 8 || c != '.') return FR_INVALID_NAME;
			i = 8; ni = 11;
			b <<= 2; continue;
		}
		if (c >= 0x80) {				 
			b |= 3;						 

			c = ExCvt[c - 0x80];		 





		}
		if (0) {				 
			d = (BYTE)p[si++];			 
			if (!0 || i >= ni - 1)	 
				return FR_INVALID_NAME;
			sfn[i++] = c;
			sfn[i++] = d;
		} else {						 
			if (chk_chr("\"*+,:;<=>\?[]|\x7F", c))	 
				return FR_INVALID_NAME;
			if ((((c)>= 'A')&&((c)<= 'Z'))) {			 
				b |= 2;
			} else {
				if ((((c)>= 'a')&&((c)<= 'z'))) {		 
					b |= 1; c -= 0x20;
				}
			}
			sfn[i++] = c;
		}
	}
	*path = &p[si];						 
	c = (c <= ' ') ? 0x04 : 0;		 

	if (!i) return FR_INVALID_NAME;		 
	if (sfn[0] == 0xE5) sfn[0] = 0x05;	 

	if (ni == 8) b <<= 2;
	if ((b & 0x03) == 0x01) c |= 0x10;	 
	if ((b & 0x0C) == 0x04) c |= 0x08;	 

	sfn[11] = c;		 

	return FR_OK;

}




 
 
 

static
FRESULT follow_path (	 
	DIR* dp,			 
	const TCHAR* path	 
)
{
	FRESULT res;
	BYTE *dir, ns;


#line 2021 "src\\SD_SPI\\ff.c"
	if (*path == '/' || *path == '\\')		 
		path++;
	dp->sclust = 0;							 


	if ((UINT)*path < ' ') {				 
		res = dir_sdi(dp, 0);
		dp->dir = 0;
	} else {								 
		for (;;) {
			res = create_name(dp, &path);	 
			if (res != FR_OK) break;
			res = dir_find(dp);				 
			ns = dp->fn[11];
			if (res != FR_OK) {				 
				if (res == FR_NO_FILE) {	 
					if (0 && (ns & 0x20)) {	 
						dp->sclust = 0; dp->dir = 0;	 
						if (!(ns & 0x04)) continue;	 
						res = FR_OK;					 
					} else {							 
						if (!(ns & 0x04)) res = FR_NO_PATH;	 
					}
				}
				break;
			}
			if (ns & 0x04) break;			 
			dir = dp->dir;						 
			if (!(dir[11] & 0x10)) {	 
				res = FR_NO_PATH; break;
			}
			dp->sclust = ld_clust(dp->fs, dir);
		}
	}

	return res;
}




 
 
 

static
int get_ldnumber (		 
	const TCHAR** path	 
)
{
	const TCHAR *tp, *tt;
	UINT i;
	int vol = -1;
#line 2080 "src\\SD_SPI\\ff.c"


	if (*path) {	 
		for (tt = *path; (UINT)*tt >= (0 ? ' ' : '!') && *tt != ':'; tt++) ;	 
		if (*tt == ':') {	 
			tp = *path;
			i = *tp++ - '0';
			if (i < 10 && tp == tt) {	 
				if (i < 1) {	 
					vol = (int)i;
					*path = ++tt;
				}
			}
#line 2109 "src\\SD_SPI\\ff.c"
			return vol;
		}



		vol = 0;		 

	}
	return vol;
}




 
 
 

static
BYTE check_fs (	 
	FATFS* fs,	 
	DWORD sect	 
)
{
	fs->wflag = 0; fs->winsect = 0xFFFFFFFF;	 
	if (move_window(fs, sect) != FR_OK)			 
		return 3;

	if ((WORD)(((WORD)*((BYTE*)(&fs->win[510])+1)<<8)|(WORD)*(BYTE*)(&fs->win[510])) != 0xAA55)	 
		return 2;

	if (((DWORD)(((DWORD)*((BYTE*)(&fs->win[54])+3)<<24)|((DWORD)*((BYTE*)(&fs->win[54])+2)<<16)|((WORD)*((BYTE*)(&fs->win[54])+1)<<8)| *(BYTE*)(&fs->win[54])) & 0xFFFFFF) == 0x544146)		 
		return 0;
	if (((DWORD)(((DWORD)*((BYTE*)(&fs->win[82])+3)<<24)|((DWORD)*((BYTE*)(&fs->win[82])+2)<<16)|((WORD)*((BYTE*)(&fs->win[82])+1)<<8)| *(BYTE*)(&fs->win[82])) & 0xFFFFFF) == 0x544146)	 
		return 0;

	return 1;
}




 
 
 

static
FRESULT find_volume (	 
	FATFS** rfs,		 
	const TCHAR** path,	 
	BYTE wmode			 
)
{
	BYTE fmt, *pt;
	int vol;
	DSTATUS stat;
	DWORD bsect, fasize, tsect, sysect, nclst, szbfat, br[4];
	WORD nrsv;
	FATFS *fs;
	UINT i;


	 
	*rfs = 0;
	vol = get_ldnumber(path);
	if (vol < 0) return FR_INVALID_DRIVE;

	 
	fs = FatFs[vol];					 
	if (!fs) return FR_NOT_ENABLED;		 

	;						 
	*rfs = fs;							 

	if (fs->fs_type) {					 
		stat = disk_status(fs->drv);
		if (!(stat & 0x01)) {		 
			if (!0 && wmode && (stat & 0x04))	 
				return FR_WRITE_PROTECTED;
			return FR_OK;				 
		}
	}

	 
	 

	fs->fs_type = 0;					 
	fs->drv = (BYTE)(vol);				 
	stat = disk_initialize(fs->drv);	 
	if (stat & 0x01)				 
		return FR_NOT_READY;			 
	if (!0 && wmode && (stat & 0x04))	 
		return FR_WRITE_PROTECTED;




	 
	bsect = 0;
	fmt = check_fs(fs, bsect);					 
	if (fmt == 1 || (!fmt && (0))) {	 
		for (i = 0; i < 4; i++) {			 
			pt = fs->win + 446 + i * 16;
			br[i] = pt[4] ? (DWORD)(((DWORD)*((BYTE*)(&pt[8])+3)<<24)|((DWORD)*((BYTE*)(&pt[8])+2)<<16)|((WORD)*((BYTE*)(&pt[8])+1)<<8)| *(BYTE*)(&pt[8])) : 0;
		}
		i = 0;						 
		if (i) i--;
		do {								 
			bsect = br[i];
			fmt = bsect ? check_fs(fs, bsect) : 2;	 
		} while (!0 && fmt && ++i < 4);
	}
	if (fmt == 3) return FR_DISK_ERR;		 
	if (fmt) return FR_NO_FILESYSTEM;		 

	 

	if ((WORD)(((WORD)*((BYTE*)(fs->win + 11)+1)<<8)|(WORD)*(BYTE*)(fs->win + 11)) != ((UINT)512))	 
		return FR_NO_FILESYSTEM;

	fasize = (WORD)(((WORD)*((BYTE*)(fs->win + 22)+1)<<8)|(WORD)*(BYTE*)(fs->win + 22));			 
	if (!fasize) fasize = (DWORD)(((DWORD)*((BYTE*)(fs->win + 36)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 36)+2)<<16)|((WORD)*((BYTE*)(fs->win + 36)+1)<<8)| *(BYTE*)(fs->win + 36));
	fs->fsize = fasize;

	fs->n_fats = fs->win[16];					 
	if (fs->n_fats != 1 && fs->n_fats != 2)				 
		return FR_NO_FILESYSTEM;
	fasize *= fs->n_fats;								 

	fs->csize = fs->win[13];				 
	if (!fs->csize || (fs->csize & (fs->csize - 1)))	 
		return FR_NO_FILESYSTEM;

	fs->n_rootdir = (WORD)(((WORD)*((BYTE*)(fs->win + 17)+1)<<8)|(WORD)*(BYTE*)(fs->win + 17));	 
	if (fs->n_rootdir % (((UINT)512) / 32))				 
		return FR_NO_FILESYSTEM;

	tsect = (WORD)(((WORD)*((BYTE*)(fs->win + 19)+1)<<8)|(WORD)*(BYTE*)(fs->win + 19));			 
	if (!tsect) tsect = (DWORD)(((DWORD)*((BYTE*)(fs->win + 32)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 32)+2)<<16)|((WORD)*((BYTE*)(fs->win + 32)+1)<<8)| *(BYTE*)(fs->win + 32));

	nrsv = (WORD)(((WORD)*((BYTE*)(fs->win + 14)+1)<<8)|(WORD)*(BYTE*)(fs->win + 14));			 
	if (!nrsv) return FR_NO_FILESYSTEM;					 

	 
	sysect = nrsv + fasize + fs->n_rootdir / (((UINT)512) / 32);	 
	if (tsect < sysect) return FR_NO_FILESYSTEM;		 
	nclst = (tsect - sysect) / fs->csize;				 
	if (!nclst) return FR_NO_FILESYSTEM;				 
	fmt = 1;
	if (nclst >= 4086U) fmt = 2;
	if (nclst >= 65526U) fmt = 3;

	 
	fs->n_fatent = nclst + 2;							 
	fs->volbase = bsect;								 
	fs->fatbase = bsect + nrsv; 						 
	fs->database = bsect + sysect;						 
	if (fmt == 3) {
		if (fs->n_rootdir) return FR_NO_FILESYSTEM;		 
		fs->dirbase = (DWORD)(((DWORD)*((BYTE*)(fs->win + 44)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 44)+2)<<16)|((WORD)*((BYTE*)(fs->win + 44)+1)<<8)| *(BYTE*)(fs->win + 44));	 
		szbfat = fs->n_fatent * 4;						 
	} else {
		if (!fs->n_rootdir)	return FR_NO_FILESYSTEM;	 
		fs->dirbase = fs->fatbase + fasize;				 
		szbfat = (fmt == 2) ?					 
			fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
	}
	if (fs->fsize < (szbfat + (((UINT)512) - 1)) / ((UINT)512))	 
		return FR_NO_FILESYSTEM;


	 
	fs->last_clust = fs->free_clust = 0xFFFFFFFF;

	 
	fs->fsi_flag = 0x80;

	if (fmt == 3				 
		&& (WORD)(((WORD)*((BYTE*)(fs->win + 48)+1)<<8)|(WORD)*(BYTE*)(fs->win + 48)) == 1
		&& move_window(fs, bsect + 1) == FR_OK)
	{
		fs->fsi_flag = 0;
		if ((WORD)(((WORD)*((BYTE*)(fs->win + 510)+1)<<8)|(WORD)*(BYTE*)(fs->win + 510)) == 0xAA55	 
			&& (DWORD)(((DWORD)*((BYTE*)(fs->win + 0)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 0)+2)<<16)|((WORD)*((BYTE*)(fs->win + 0)+1)<<8)| *(BYTE*)(fs->win + 0)) == 0x41615252
			&& (DWORD)(((DWORD)*((BYTE*)(fs->win + 484)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 484)+2)<<16)|((WORD)*((BYTE*)(fs->win + 484)+1)<<8)| *(BYTE*)(fs->win + 484)) == 0x61417272)
		{

			fs->free_clust = (DWORD)(((DWORD)*((BYTE*)(fs->win + 488)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 488)+2)<<16)|((WORD)*((BYTE*)(fs->win + 488)+1)<<8)| *(BYTE*)(fs->win + 488));


			fs->last_clust = (DWORD)(((DWORD)*((BYTE*)(fs->win + 492)+3)<<24)|((DWORD)*((BYTE*)(fs->win + 492)+2)<<16)|((WORD)*((BYTE*)(fs->win + 492)+1)<<8)| *(BYTE*)(fs->win + 492));

		}
	}


	fs->fs_type = fmt;	 
	fs->id = ++Fsid;	 




	clear_lock(fs);


	return FR_OK;
}




 
 
 

static
FRESULT validate (	 
	void* obj		 
)
{
	FIL *fil = (FIL*)obj;	 


	if (!fil || !fil->fs || !fil->fs->fs_type || fil->fs->id != fil->id)
		return FR_INVALID_OBJECT;

	;		 

	if (disk_status(fil->fs->drv) & 0x01)
		return FR_NOT_READY;

	return FR_OK;
}








 



 
 
 

FRESULT f_mount (
	FATFS* fs,			 
	const TCHAR* path,	 
	BYTE opt			 
)
{
	FATFS *cfs;
	int vol;
	FRESULT res;
	const TCHAR *rp = path;


	vol = get_ldnumber(&rp);
	if (vol < 0) return FR_INVALID_DRIVE;
	cfs = FatFs[vol];					 

	if (cfs) {

		clear_lock(cfs);




		cfs->fs_type = 0;				 
	}

	if (fs) {
		fs->fs_type = 0;				 



	}
	FatFs[vol] = fs;					 

	if (!fs || opt != 1) return FR_OK;	 

	res = find_volume(&fs, &path, 0);	 
	return res;
}




 
 
 

FRESULT f_open (
	FIL* fp,			 
	const TCHAR* path,	 
	BYTE mode			 
)
{
	FRESULT res;
	DIR dj;
	BYTE *dir;
	BYTE sfn[12];

	DWORD dw, cl;



	if (!fp) return FR_INVALID_OBJECT;
	fp->fs = 0;			 

	 

	mode &= 0x01 | 0x02 | 0x08 | 0x10 | 0x04;
	res = find_volume(&dj.fs, &path, (BYTE)(mode & ~0x01));




	if (res == FR_OK) {
		(dj). fn = sfn;
		res = follow_path(&dj, path);	 
		dir = dj.dir;

		if (res == FR_OK) {
			if (!dir)	 
				res = FR_INVALID_NAME;

			else
				res = chk_lock(&dj, (mode & ~0x01) ? 1 : 0);

		}
		 
		if (mode & (0x08 | 0x10 | 0x04)) {
			if (res != FR_OK) {					 
				if (res == FR_NO_FILE)			 

					res = enq_lock() ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;



				mode |= 0x08;		 
				dir = dj.dir;					 
			}
			else {								 
				if (dir[11] & (0x01 | 0x10)) {	 
					res = FR_DENIED;
				} else {
					if (mode & 0x04)	 
						res = FR_EXIST;
				}
			}
			if (res == FR_OK && (mode & 0x08)) {	 
				dw = ((DWORD)(2015 - 1980) << 25 | (DWORD)2 << 21 | (DWORD)1 << 16);				 
				*(BYTE*)(dir + 14)=(BYTE)(dw); *((BYTE*)(dir + 14)+1)=(BYTE)((WORD)(dw)>>8); *((BYTE*)(dir + 14)+2)=(BYTE)((DWORD)(dw)>>16); *((BYTE*)(dir + 14)+3)=(BYTE)((DWORD)(dw)>>24);
				dir[11] = 0;				 
				*(BYTE*)(dir + 28)=(BYTE)(0); *((BYTE*)(dir + 28)+1)=(BYTE)((WORD)(0)>>8); *((BYTE*)(dir + 28)+2)=(BYTE)((DWORD)(0)>>16); *((BYTE*)(dir + 28)+3)=(BYTE)((DWORD)(0)>>24); 
				cl = ld_clust(dj.fs, dir);		 
				st_clust(dir, 0);				 
				dj.fs->wflag = 1;
				if (cl) {						 
					dw = dj.fs->winsect;
					res = remove_chain(dj.fs, cl);
					if (res == FR_OK) {
						dj.fs->last_clust = cl - 1;	 
						res = move_window(dj.fs, dw);
					}
				}
			}
		}
		else {	 
			if (res == FR_OK) {					 
				if (dir[11] & 0x10) {	 
					res = FR_NO_FILE;
				} else {
					if ((mode & 0x02) && (dir[11] & 0x01))  
						res = FR_DENIED;
				}
			}
		}
		if (res == FR_OK) {
			if (mode & 0x08)		 
				mode |= 0x20;
			fp->dir_sect = dj.fs->winsect;		 
			fp->dir_ptr = dir;

			fp->lockid = inc_lock(&dj, (mode & ~0x01) ? 1 : 0);
			if (!fp->lockid) res = FR_INT_ERR;

		}

#line 2514 "src\\SD_SPI\\ff.c"
		;

		if (res == FR_OK) {
			fp->flag = mode;					 
			fp->err = 0;						 
			fp->sclust = ld_clust(dj.fs, dir);	 
			fp->fsize = (DWORD)(((DWORD)*((BYTE*)(dir + 28)+3)<<24)|((DWORD)*((BYTE*)(dir + 28)+2)<<16)|((WORD)*((BYTE*)(dir + 28)+1)<<8)| *(BYTE*)(dir + 28));	 
			fp->fptr = 0;						 
			fp->dsect = 0;

			fp->cltbl = 0;						 

			fp->fs = dj.fs;	 					 
			fp->id = fp->fs->id;
		}
	}

	return res;
}




 
 
 

FRESULT f_read (
	FIL* fp, 		 
	void* buff,		 
	UINT btr,		 
	UINT* br		 
)
{
	FRESULT res;
	DWORD clst, sect, remain;
	UINT rcnt, cc;
	BYTE csect, *rbuff = (BYTE*)buff;


	*br = 0;	 

	res = validate(fp);							 
	if (res != FR_OK) return res;
	if (fp->err)								 
		return (FRESULT)fp->err;
	if (!(fp->flag & 0x01)) 					 
		return FR_DENIED;
	remain = fp->fsize - fp->fptr;
	if (btr > remain) btr = (UINT)remain;		 

	for ( ;  btr;								 
		rbuff += rcnt, fp->fptr += rcnt, *br += rcnt, btr -= rcnt) {
		if ((fp->fptr % ((UINT)512)) == 0) {		 
			csect = (BYTE)(fp->fptr / ((UINT)512) & (fp->fs->csize - 1));	 
			if (!csect) {						 
				if (fp->fptr == 0) {			 
					clst = fp->sclust;			 
				} else {						 

					if (fp->cltbl)
						clst = clmt_clust(fp, fp->fptr);	 
					else

						clst = get_fat(fp->fs, fp->clust);	 
				}
				if (clst < 2) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
				if (clst == 0xFFFFFFFF) { fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
				fp->clust = clst;				 
			}
			sect = clust2sect(fp->fs, fp->clust);	 
			if (!sect) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
			sect += csect;
			cc = btr / ((UINT)512);				 
			if (cc) {							 
				if (csect + cc > fp->fs->csize)	 
					cc = fp->fs->csize - csect;
				if (disk_read(fp->fs->drv, rbuff, sect, cc) != RES_OK)
					{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };





				if ((fp->flag & 0x40) && fp->dsect - sect < cc)
					mem_cpy(rbuff + ((fp->dsect - sect) * ((UINT)512)), fp->buf, ((UINT)512));


				rcnt = ((UINT)512) * cc;			 
				continue;
			}

			if (fp->dsect != sect) {			 

				if (fp->flag & 0x40) {		 
					if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
						{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
					fp->flag &= ~0x40;
				}

				if (disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)	 
					{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
			}

			fp->dsect = sect;
		}
		rcnt = ((UINT)512) - ((UINT)fp->fptr % ((UINT)512));	 
		if (rcnt > btr) rcnt = btr;





		mem_cpy(rbuff, &fp->buf[fp->fptr % ((UINT)512)], rcnt);	 

	}

	return FR_OK;
}





 
 
 

FRESULT f_write (
	FIL* fp,			 
	const void *buff,	 
	UINT btw,			 
	UINT* bw			 
)
{
	FRESULT res;
	DWORD clst, sect;
	UINT wcnt, cc;
	const BYTE *wbuff = (const BYTE*)buff;
	BYTE csect;


	*bw = 0;	 

	res = validate(fp);						 
	if (res != FR_OK) return res;
	if (fp->err)							 
		return (FRESULT)fp->err;
	if (!(fp->flag & 0x02))				 
		return FR_DENIED;
	if (fp->fptr + btw < fp->fptr) btw = 0;	 

	for ( ;  btw;							 
		wbuff += wcnt, fp->fptr += wcnt, *bw += wcnt, btw -= wcnt) {
		if ((fp->fptr % ((UINT)512)) == 0) {	 
			csect = (BYTE)(fp->fptr / ((UINT)512) & (fp->fs->csize - 1));	 
			if (!csect) {					 
				if (fp->fptr == 0) {		 
					clst = fp->sclust;		 
					if (clst == 0)			 
						clst = create_chain(fp->fs, 0);	 
				} else {					 

					if (fp->cltbl)
						clst = clmt_clust(fp, fp->fptr);	 
					else

						clst = create_chain(fp->fs, fp->clust);	 
				}
				if (clst == 0) break;		 
				if (clst == 1) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
				if (clst == 0xFFFFFFFF) { fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
				fp->clust = clst;			 
				if (fp->sclust == 0) fp->sclust = clst;	 
			}




			if (fp->flag & 0x40) {		 
				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
					{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
				fp->flag &= ~0x40;
			}

			sect = clust2sect(fp->fs, fp->clust);	 
			if (!sect) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
			sect += csect;
			cc = btw / ((UINT)512);			 
			if (cc) {						 
				if (csect + cc > fp->fs->csize)	 
					cc = fp->fs->csize - csect;
				if (disk_write(fp->fs->drv, wbuff, sect, cc) != RES_OK)
					{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
#line 2715 "src\\SD_SPI\\ff.c"
				if (fp->dsect - sect < cc) {  
					mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * ((UINT)512)), ((UINT)512));
					fp->flag &= ~0x40;
				}


				wcnt = ((UINT)512) * cc;		 
				continue;
			}
#line 2730 "src\\SD_SPI\\ff.c"
			if (fp->dsect != sect) {		 
				if (fp->fptr < fp->fsize &&
					disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)
						{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
			}

			fp->dsect = sect;
		}
		wcnt = ((UINT)512) - ((UINT)fp->fptr % ((UINT)512)); 
		if (wcnt > btw) wcnt = btw;
#line 2746 "src\\SD_SPI\\ff.c"
		mem_cpy(&fp->buf[fp->fptr % ((UINT)512)], wbuff, wcnt);	 
		fp->flag |= 0x40;

	}

	if (fp->fptr > fp->fsize) fp->fsize = fp->fptr;	 
	fp->flag |= 0x20;						 

	return FR_OK;
}




 
 
 

FRESULT f_sync (
	FIL* fp		 
)
{
	FRESULT res;
	DWORD tm;
	BYTE *dir;


	res = validate(fp);					 
	if (res == FR_OK) {
		if (fp->flag & 0x20) {	 
			 

			if (fp->flag & 0x40) {
				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
					return FR_DISK_ERR;
				fp->flag &= ~0x40;
			}

			 
			res = move_window(fp->fs, fp->dir_sect);
			if (res == FR_OK) {
				dir = fp->dir_ptr;
				dir[11] |= 0x20;					 
				*(BYTE*)(dir + 28)=(BYTE)(fp->fsize); *((BYTE*)(dir + 28)+1)=(BYTE)((WORD)(fp->fsize)>>8); *((BYTE*)(dir + 28)+2)=(BYTE)((DWORD)(fp->fsize)>>16); *((BYTE*)(dir + 28)+3)=(BYTE)((DWORD)(fp->fsize)>>24);	 
				st_clust(dir, fp->sclust);					 
				tm = ((DWORD)(2015 - 1980) << 25 | (DWORD)2 << 21 | (DWORD)1 << 16);							 
				*(BYTE*)(dir + 22)=(BYTE)(tm); *((BYTE*)(dir + 22)+1)=(BYTE)((WORD)(tm)>>8); *((BYTE*)(dir + 22)+2)=(BYTE)((DWORD)(tm)>>16); *((BYTE*)(dir + 22)+3)=(BYTE)((DWORD)(tm)>>24);
				*(BYTE*)(dir + 18)=(BYTE)(0); *((BYTE*)(dir + 18)+1)=(BYTE)((WORD)(0)>>8);
				fp->flag &= ~0x20;
				fp->fs->wflag = 1;
				res = sync_fs(fp->fs);
			}
		}
	}

	return res;
}






 
 
 

FRESULT f_close (
	FIL *fp		 
)
{
	FRESULT res;



	res = f_sync(fp);					 
	if (res == FR_OK)

	{
		res = validate(fp);				 
		if (res == FR_OK) {




			res = dec_lock(fp->lockid);	 
			if (res == FR_OK)

				fp->fs = 0;				 



		}
	}
	return res;
}




 
 
 

#line 2977 "src\\SD_SPI\\ff.c"




 
 
 

FRESULT f_lseek (
	FIL* fp,		 
	DWORD ofs		 
)
{
	FRESULT res;
	DWORD clst, bcs, nsect, ifptr;

	DWORD cl, pcl, ncl, tcl, dsc, tlen, ulen, *tbl;



	res = validate(fp);					 
	if (res != FR_OK) return res;
	if (fp->err)						 
		return (FRESULT)fp->err;


	if (fp->cltbl) {	 
		if (ofs == 0xFFFFFFFF) {	 
			tbl = fp->cltbl;
			tlen = *tbl++; ulen = 2;	 
			cl = fp->sclust;			 
			if (cl) {
				do {
					 
					tcl = cl; ncl = 0; ulen += 2;	 
					do {
						pcl = cl; ncl++;
						cl = get_fat(fp->fs, cl);
						if (cl <= 1) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
						if (cl == 0xFFFFFFFF) { fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
					} while (cl == pcl + 1);
					if (ulen <= tlen) {		 
						*tbl++ = ncl; *tbl++ = tcl;
					}
				} while (cl < fp->fs->n_fatent);	 
			}
			*fp->cltbl = ulen;	 
			if (ulen <= tlen)
				*tbl = 0;		 
			else
				res = FR_NOT_ENOUGH_CORE;	 

		} else {						 
			if (ofs > fp->fsize)		 
				ofs = fp->fsize;
			fp->fptr = ofs;				 
			if (ofs) {
				fp->clust = clmt_clust(fp, ofs - 1);
				dsc = clust2sect(fp->fs, fp->clust);
				if (!dsc) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
				dsc += (ofs - 1) / ((UINT)512) & (fp->fs->csize - 1);
				if (fp->fptr % ((UINT)512) && dsc != fp->dsect) {	 


					if (fp->flag & 0x40) {		 
						if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
							{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
						fp->flag &= ~0x40;
					}

					if (disk_read(fp->fs->drv, fp->buf, dsc, 1) != RES_OK)	 
						{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };

					fp->dsect = dsc;
				}
			}
		}
	} else


	 
	{
		if (ofs > fp->fsize					 

			 && !(fp->flag & 0x02)

			) ofs = fp->fsize;

		ifptr = fp->fptr;
		fp->fptr = nsect = 0;
		if (ofs) {
			bcs = (DWORD)fp->fs->csize * ((UINT)512);	 
			if (ifptr > 0 &&
				(ofs - 1) / bcs >= (ifptr - 1) / bcs) {	 
				fp->fptr = (ifptr - 1) & ~(bcs - 1);	 
				ofs -= fp->fptr;
				clst = fp->clust;
			} else {									 
				clst = fp->sclust;						 

				if (clst == 0) {						 
					clst = create_chain(fp->fs, 0);
					if (clst == 1) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
					if (clst == 0xFFFFFFFF) { fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
					fp->sclust = clst;
				}

				fp->clust = clst;
			}
			if (clst != 0) {
				while (ofs > bcs) {						 

					if (fp->flag & 0x02) {			 
						clst = create_chain(fp->fs, clst);	 
						if (clst == 0) {				 
							ofs = bcs; break;
						}
					} else

						clst = get_fat(fp->fs, clst);	 
					if (clst == 0xFFFFFFFF) { fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
					if (clst <= 1 || clst >= fp->fs->n_fatent) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
					fp->clust = clst;
					fp->fptr += bcs;
					ofs -= bcs;
				}
				fp->fptr += ofs;
				if (ofs % ((UINT)512)) {
					nsect = clust2sect(fp->fs, clst);	 
					if (!nsect) { fp->err = (BYTE)(FR_INT_ERR); return FR_INT_ERR; };
					nsect += ofs / ((UINT)512);
				}
			}
		}
		if (fp->fptr % ((UINT)512) && nsect != fp->dsect) {	 


			if (fp->flag & 0x40) {			 
				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
					{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };
				fp->flag &= ~0x40;
			}

			if (disk_read(fp->fs->drv, fp->buf, nsect, 1) != RES_OK)	 
				{ fp->err = (BYTE)(FR_DISK_ERR); return FR_DISK_ERR; };

			fp->dsect = nsect;
		}

		if (fp->fptr > fp->fsize) {			 
			fp->fsize = fp->fptr;
			fp->flag |= 0x20;
		}

	}

	return res;
}




 
 
 

FRESULT f_opendir (
	DIR* dp,			 
	const TCHAR* path	 
)
{
	FRESULT res;
	FATFS* fs;
	BYTE sfn[12];


	if (!dp) return FR_INVALID_OBJECT;

	 
	res = find_volume(&fs, &path, 0);
	if (res == FR_OK) {
		dp->fs = fs;
		(*dp). fn = sfn;
		res = follow_path(dp, path);			 
		;
		if (res == FR_OK) {						 
			if (dp->dir) {						 
				if (dp->dir[11] & 0x10)	 
					dp->sclust = ld_clust(fs, dp->dir);
				else							 
					res = FR_NO_PATH;
			}
			if (res == FR_OK) {
				dp->id = fs->id;
				res = dir_sdi(dp, 0);			 

				if (res == FR_OK) {
					if (dp->sclust) {
						dp->lockid = inc_lock(dp, 0);	 
						if (!dp->lockid)
							res = FR_TOO_MANY_OPEN_FILES;
					} else {
						dp->lockid = 0;	 
					}
				}

			}
		}
		if (res == FR_NO_FILE) res = FR_NO_PATH;
	}
	if (res != FR_OK) dp->fs = 0;		 

	return res;
}




 
 
 

FRESULT f_closedir (
	DIR *dp		 
)
{
	FRESULT res;


	res = validate(dp);
	if (res == FR_OK) {




		if (dp->lockid)				 
			res = dec_lock(dp->lockid);
		if (res == FR_OK)

			dp->fs = 0;				 



	}
	return res;
}




 
 
 

FRESULT f_readdir (
	DIR* dp,			 
	FILINFO* fno		 
)
{
	FRESULT res;
	BYTE sfn[12];


	res = validate(dp);						 
	if (res == FR_OK) {
		if (!fno) {
			res = dir_sdi(dp, 0);			 
		} else {
			(*dp). fn = sfn;
			res = dir_read(dp, 0);			 
			if (res == FR_NO_FILE) {		 
				dp->sect = 0;
				res = FR_OK;
			}
			if (res == FR_OK) {				 
				get_fileinfo(dp, fno);		 
				res = dir_next(dp, 0);		 
				if (res == FR_NO_FILE) {
					dp->sect = 0;
					res = FR_OK;
				}
			}
			;
		}
	}

	return res;
}




 
 
 

FRESULT f_findnext (
	DIR* dp,		 
	FILINFO* fno	 
)
{
	FRESULT res;


	for (;;) {
		res = f_readdir(dp, fno);		 
		if (res != FR_OK || !fno || !fno->fname[0]) break;	 



		if (pattern_matching(dp->pat, fno->fname, 0, 0)) break;	 
	}
	return res;

}



 
 
 

FRESULT f_findfirst (
	DIR* dp,				 
	FILINFO* fno,			 
	const TCHAR* path,		 
	const TCHAR* pattern	 
)
{
	FRESULT res;


	dp->pat = pattern;		 
	res = f_opendir(dp, path);		 
	if (res == FR_OK)
		res = f_findnext(dp, fno);	 
	return res;
}






 
 
 

FRESULT f_stat (
	const TCHAR* path,	 
	FILINFO* fno		 
)
{
	FRESULT res;
	DIR dj;
	BYTE sfn[12];


	 
	res = find_volume(&dj.fs, &path, 0);
	if (res == FR_OK) {
		(dj). fn = sfn;
		res = follow_path(&dj, path);	 
		if (res == FR_OK) {				 
			if (dj.dir) {		 
				if (fno) get_fileinfo(&dj, fno);
			} else {			 
				res = FR_INVALID_NAME;
			}
		}
		;
	}

	return res;
}




 
 
 

FRESULT f_getfree (
	const TCHAR* path,	 
	DWORD* nclst,		 
	FATFS** fatfs		 
)
{
	FRESULT res;
	FATFS *fs;
	DWORD n, clst, sect, stat;
	UINT i;
	BYTE fat, *p;


	 
	res = find_volume(fatfs, &path, 0);
	fs = *fatfs;
	if (res == FR_OK) {
		 
		if (fs->free_clust <= fs->n_fatent - 2) {
			*nclst = fs->free_clust;
		} else {
			 
			fat = fs->fs_type;
			n = 0;
			if (fat == 1) {
				clst = 2;
				do {
					stat = get_fat(fs, clst);
					if (stat == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }
					if (stat == 1) { res = FR_INT_ERR; break; }
					if (stat == 0) n++;
				} while (++clst < fs->n_fatent);
			} else {
				clst = fs->n_fatent;
				sect = fs->fatbase;
				i = 0; p = 0;
				do {
					if (!i) {
						res = move_window(fs, sect++);
						if (res != FR_OK) break;
						p = fs->win;
						i = ((UINT)512);
					}
					if (fat == 2) {
						if ((WORD)(((WORD)*((BYTE*)(p)+1)<<8)|(WORD)*(BYTE*)(p)) == 0) n++;
						p += 2; i -= 2;
					} else {
						if (((DWORD)(((DWORD)*((BYTE*)(p)+3)<<24)|((DWORD)*((BYTE*)(p)+2)<<16)|((WORD)*((BYTE*)(p)+1)<<8)| *(BYTE*)(p)) & 0x0FFFFFFF) == 0) n++;
						p += 4; i -= 4;
					}
				} while (--clst);
			}
			fs->free_clust = n;
			fs->fsi_flag |= 1;
			*nclst = n;
		}
	}
	return res;
}




 
 
 

FRESULT f_truncate (
	FIL* fp		 
)
{
	FRESULT res;
	DWORD ncl;


	res = validate(fp);						 
	if (res == FR_OK) {
		if (fp->err) {						 
			res = (FRESULT)fp->err;
		} else {
			if (!(fp->flag & 0x02))		 
				res = FR_DENIED;
		}
	}
	if (res == FR_OK) {
		if (fp->fsize > fp->fptr) {
			fp->fsize = fp->fptr;	 
			fp->flag |= 0x20;
			if (fp->fptr == 0) {	 
				res = remove_chain(fp->fs, fp->sclust);
				fp->sclust = 0;
			} else {				 
				ncl = get_fat(fp->fs, fp->clust);
				res = FR_OK;
				if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
				if (ncl == 1) res = FR_INT_ERR;
				if (res == FR_OK && ncl < fp->fs->n_fatent) {
					res = put_fat(fp->fs, fp->clust, 0x0FFFFFFF);
					if (res == FR_OK) res = remove_chain(fp->fs, ncl);
				}
			}

			if (res == FR_OK && (fp->flag & 0x40)) {
				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
					res = FR_DISK_ERR;
				else
					fp->flag &= ~0x40;
			}

		}
		if (res != FR_OK) fp->err = (FRESULT)res;
	}

	return res;
}




 
 
 

FRESULT f_unlink (
	const TCHAR* path		 
)
{
	FRESULT res;
	DIR dj, sdj;
	BYTE *dir;
	DWORD dclst = 0;
	BYTE sfn[12];


	 
	res = find_volume(&dj.fs, &path, 1);
	if (res == FR_OK) {
		(dj). fn = sfn;
		res = follow_path(&dj, path);		 
		if (0 && res == FR_OK && (dj.fn[11] & 0x20))
			res = FR_INVALID_NAME;			 

		if (res == FR_OK) res = chk_lock(&dj, 2);	 

		if (res == FR_OK) {					 
			dir = dj.dir;
			if (!dir) {
				res = FR_INVALID_NAME;		 
			} else {
				if (dir[11] & 0x01)
					res = FR_DENIED;		 
			}
			if (res == FR_OK) {
				dclst = ld_clust(dj.fs, dir);
				if (dclst && (dir[11] & 0x10)) {	 





					{
						mem_cpy(&sdj, &dj, sizeof (DIR));	 
						sdj.sclust = dclst;
						res = dir_sdi(&sdj, 2);
						if (res == FR_OK) {
							res = dir_read(&sdj, 0);			 
							if (res == FR_OK) res = FR_DENIED;	 
							if (res == FR_NO_FILE) res = FR_OK;	 
						}
					}
				}
			}
			if (res == FR_OK) {
				res = dir_remove(&dj);		 
				if (res == FR_OK && dclst)	 
					res = remove_chain(dj.fs, dclst);
				if (res == FR_OK) res = sync_fs(dj.fs);
			}
		}
		;
	}

	return res;
}




 
 
 

FRESULT f_mkdir (
	const TCHAR* path		 
)
{
	FRESULT res;
	DIR dj;
	BYTE *dir, n;
	DWORD dsc, dcl, pcl, tm = ((DWORD)(2015 - 1980) << 25 | (DWORD)2 << 21 | (DWORD)1 << 16);
	BYTE sfn[12];


	 
	res = find_volume(&dj.fs, &path, 1);
	if (res == FR_OK) {
		(dj). fn = sfn;
		res = follow_path(&dj, path);			 
		if (res == FR_OK) res = FR_EXIST;		 
		if (0 && res == FR_NO_FILE && (dj.fn[11] & 0x20))
			res = FR_INVALID_NAME;
		if (res == FR_NO_FILE) {				 
			dcl = create_chain(dj.fs, 0);		 
			res = FR_OK;
			if (dcl == 0) res = FR_DENIED;		 
			if (dcl == 1) res = FR_INT_ERR;
			if (dcl == 0xFFFFFFFF) res = FR_DISK_ERR;
			if (res == FR_OK)					 
				res = sync_window(dj.fs);
			if (res == FR_OK) {					 
				dsc = clust2sect(dj.fs, dcl);
				dir = dj.fs->win;
				mem_set(dir, 0, ((UINT)512));
				mem_set(dir + 0, ' ', 11);	 
				dir[0] = '.';
				dir[11] = 0x10;
				*(BYTE*)(dir + 22)=(BYTE)(tm); *((BYTE*)(dir + 22)+1)=(BYTE)((WORD)(tm)>>8); *((BYTE*)(dir + 22)+2)=(BYTE)((DWORD)(tm)>>16); *((BYTE*)(dir + 22)+3)=(BYTE)((DWORD)(tm)>>24);
				st_clust(dir, dcl);
				mem_cpy(dir + 32, dir, 32); 	 
				dir[32 + 1] = '.'; pcl = dj.sclust;
				if (dj.fs->fs_type == 3 && pcl == dj.fs->dirbase)
					pcl = 0;
				st_clust(dir + 32, pcl);
				for (n = dj.fs->csize; n; n--) {	 
					dj.fs->winsect = dsc++;
					dj.fs->wflag = 1;
					res = sync_window(dj.fs);
					if (res != FR_OK) break;
					mem_set(dir, 0, ((UINT)512));
				}
			}
			if (res == FR_OK) res = dir_register(&dj);	 
			if (res != FR_OK) {
				remove_chain(dj.fs, dcl);			 
			} else {
				dir = dj.dir;
				dir[11] = 0x10;				 
				*(BYTE*)(dir + 22)=(BYTE)(tm); *((BYTE*)(dir + 22)+1)=(BYTE)((WORD)(tm)>>8); *((BYTE*)(dir + 22)+2)=(BYTE)((DWORD)(tm)>>16); *((BYTE*)(dir + 22)+3)=(BYTE)((DWORD)(tm)>>24);	 
				st_clust(dir, dcl);					 
				dj.fs->wflag = 1;
				res = sync_fs(dj.fs);
			}
		}
		;
	}

	return res;
}




 
 
 

FRESULT f_chmod (
	const TCHAR* path,	 
	BYTE attr,			 
	BYTE mask			 
)
{
	FRESULT res;
	DIR dj;
	BYTE *dir;
	BYTE sfn[12];


	 
	res = find_volume(&dj.fs, &path, 1);
	if (res == FR_OK) {
		(dj). fn = sfn;
		res = follow_path(&dj, path);		 
		;
		if (0 && res == FR_OK && (dj.fn[11] & 0x20))
			res = FR_INVALID_NAME;
		if (res == FR_OK) {
			dir = dj.dir;
			if (!dir) {						 
				res = FR_INVALID_NAME;
			} else {						 
				mask &= 0x01|0x02|0x04|0x20;	 
				dir[11] = (attr & mask) | (dir[11] & (BYTE)~mask);	 
				dj.fs->wflag = 1;
				res = sync_fs(dj.fs);
			}
		}
	}

	return res;
}




 
 
 

FRESULT f_rename (
	const TCHAR* path_old,	 
	const TCHAR* path_new	 
)
{
	FRESULT res;
	DIR djo, djn;
	BYTE buf[21], *dir;
	DWORD dw;
	BYTE sfn[12];


	 
	res = find_volume(&djo.fs, &path_old, 1);
	if (res == FR_OK) {
		djn.fs = djo.fs;
		(djo). fn = sfn;
		res = follow_path(&djo, path_old);		 
		if (0 && res == FR_OK && (djo.fn[11] & 0x20))
			res = FR_INVALID_NAME;

		if (res == FR_OK) res = chk_lock(&djo, 2);

		if (res == FR_OK) {						 
			if (!djo.dir) {						 
				res = FR_NO_FILE;
			} else {
				mem_cpy(buf, djo.dir + 11, 21);	 
				mem_cpy(&djn, &djo, sizeof (DIR));		 
				if (get_ldnumber(&path_new) >= 0)		 
					res = follow_path(&djn, path_new);	 
				else
					res = FR_INVALID_DRIVE;
				if (res == FR_OK) res = FR_EXIST;		 
				if (res == FR_NO_FILE) { 				 
					res = dir_register(&djn);			 
					if (res == FR_OK) {
 
						dir = djn.dir;					 
						mem_cpy(dir + 13, buf + 2, 19);
						dir[11] = buf[0] | 0x20;
						djo.fs->wflag = 1;
						if ((dir[11] & 0x10) && djo.sclust != djn.sclust) {	 
							dw = clust2sect(djo.fs, ld_clust(djo.fs, dir));
							if (!dw) {
								res = FR_INT_ERR;
							} else {
								res = move_window(djo.fs, dw);
								dir = djo.fs->win + 32 * 1;	 
								if (res == FR_OK && dir[1] == '.') {
									st_clust(dir, djn.sclust);
									djo.fs->wflag = 1;
								}
							}
						}
						if (res == FR_OK) {
							res = dir_remove(&djo);		 
							if (res == FR_OK)
								res = sync_fs(djo.fs);
						}
 
					}
				}
			}
		}
		;
	}

	return res;
}




 
 
 

FRESULT f_utime (
	const TCHAR* path,	 
	const FILINFO* fno	 
)
{
	FRESULT res;
	DIR dj;
	BYTE *dir;
	BYTE sfn[12];


	 
	res = find_volume(&dj.fs, &path, 1);
	if (res == FR_OK) {
		(dj). fn = sfn;
		res = follow_path(&dj, path);	 
		;
		if (0 && res == FR_OK && (dj.fn[11] & 0x20))
			res = FR_INVALID_NAME;
		if (res == FR_OK) {
			dir = dj.dir;
			if (!dir) {					 
				res = FR_INVALID_NAME;
			} else {					 
				*(BYTE*)(dir + 22)=(BYTE)(fno->ftime); *((BYTE*)(dir + 22)+1)=(BYTE)((WORD)(fno->ftime)>>8);
				*(BYTE*)(dir + 24)=(BYTE)(fno->fdate); *((BYTE*)(dir + 24)+1)=(BYTE)((WORD)(fno->fdate)>>8);
				dj.fs->wflag = 1;
				res = sync_fs(dj.fs);
			}
		}
	}

	return res;
}









#line 3950 "src\\SD_SPI\\ff.c"



 
 
 
#line 4010 "src\\SD_SPI\\ff.c"



#line 4331 "src\\SD_SPI\\ff.c"





 
 
 

TCHAR* f_gets (
	TCHAR* buff,	 
	int len,		 
	FIL* fp			 
)
{
	int n = 0;
	TCHAR c, *p = buff;
	BYTE s[2];
	UINT rc;


	while (n < len - 1) {	 
#line 4397 "src\\SD_SPI\\ff.c"
		f_read(fp, s, 1, &rc);
		if (rc != 1) break;
		c = s[0];

		if (2 == 2 && c == '\r') continue;	 
		*p++ = c;
		n++;
		if (c == '\n') break;		 
	}
	*p = 0;
	return n ? buff : 0;			 
}




#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"








 

 
 
#line 57 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"
    typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 







#line 138 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"



#line 147 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"

 

#line 4415 "src\\SD_SPI\\ff.c"
 
 
 

typedef struct {
	FIL* fp;
	int idx, nchr;
	BYTE buf[64];
} putbuff;


static
void putc_bfd (
	putbuff* pb,
	TCHAR c
)
{
	UINT bw;
	int i;


	if (2 == 2 && c == '\n')	  
		putc_bfd(pb, '\r');

	i = pb->idx;	 
	if (i < 0) return;

#line 4469 "src\\SD_SPI\\ff.c"
	pb->buf[i++] = (BYTE)c;


	if (i >= (int)(sizeof pb->buf) - 3) {	 
		f_write(pb->fp, pb->buf, (UINT)i, &bw);
		i = (bw == (UINT)i) ? 0 : -1;
	}
	pb->idx = i;
	pb->nchr++;
}



int f_putc (
	TCHAR c,	 
	FIL* fp		 
)
{
	putbuff pb;
	UINT nw;


	pb.fp = fp;			 
	pb.nchr = pb.idx = 0;

	putc_bfd(&pb, c);	 

	if (   pb.idx >= 0	 
		&& f_write(pb.fp, pb.buf, (UINT)pb.idx, &nw) == FR_OK
		&& (UINT)pb.idx == nw) return pb.nchr;
	return (-1);
}




 
 
 

int f_puts (
	const TCHAR* str,	 
	FIL* fp				 
)
{
	putbuff pb;
	UINT nw;


	pb.fp = fp;				 
	pb.nchr = pb.idx = 0;

	while (*str)			 
		putc_bfd(&pb, *str++);

	if (   pb.idx >= 0		 
		&& f_write(pb.fp, pb.buf, (UINT)pb.idx, &nw) == FR_OK
		&& (UINT)pb.idx == nw) return pb.nchr;
	return (-1);
}




 
 
 

int f_printf (
	FIL* fp,			 
	const TCHAR* fmt,	 
	...					 
)
{
	va_list arp;
	BYTE f, r;
	UINT nw, i, j, w;
	DWORD v;
	TCHAR c, d, s[16], *p;
	putbuff pb;


	pb.fp = fp;				 
	pb.nchr = pb.idx = 0;

	__va_start(arp, fmt);

	for (;;) {
		c = *fmt++;
		if (c == 0) break;			 
		if (c != '%') {				 
			putc_bfd(&pb, c);
			continue;
		}
		w = f = 0;
		c = *fmt++;
		if (c == '0') {				 
			f = 1; c = *fmt++;
		} else {
			if (c == '-') {			 
				f = 2; c = *fmt++;
			}
		}
		while ((((c)>= '0')&&((c)<= '9'))) {		 
			w = w * 10 + c - '0';
			c = *fmt++;
		}
		if (c == 'l' || c == 'L') {	 
			f |= 4; c = *fmt++;
		}
		if (!c) break;
		d = c;
		if ((((d)>= 'a')&&((d)<= 'z'))) d -= 0x20;
		switch (d) {				 
		case 'S' :					 
			p = __va_arg(arp, TCHAR*);
			for (j = 0; p[j]; j++) ;
			if (!(f & 2)) {
				while (j++ < w) putc_bfd(&pb, ' ');
			}
			while (*p) putc_bfd(&pb, *p++);
			while (j++ < w) putc_bfd(&pb, ' ');
			continue;
		case 'C' :					 
			putc_bfd(&pb, (TCHAR)__va_arg(arp, int)); continue;
		case 'B' :					 
			r = 2; break;
		case 'O' :					 
			r = 8; break;
		case 'D' :					 
		case 'U' :					 
			r = 10; break;
		case 'X' :					 
			r = 16; break;
		default:					 
			putc_bfd(&pb, c); continue;
		}

		 
		v = (f & 4) ? (DWORD)__va_arg(arp, long) : ((d == 'D') ? (DWORD)(long)__va_arg(arp, int) : (DWORD)__va_arg(arp, unsigned int));
		if (d == 'D' && (v & 0x80000000)) {
			v = 0 - v;
			f |= 8;
		}
		i = 0;
		do {
			d = (TCHAR)(v % r); v /= r;
			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
			s[i++] = d + '0';
		} while (v && i < sizeof s / sizeof s[0]);
		if (f & 8) s[i++] = '-';
		j = i; d = (f & 1) ? '0' : ' ';
		while (!(f & 2) && j++ < w) putc_bfd(&pb, d);
		do putc_bfd(&pb, s[--i]); while (i);
		while (j++ < w) putc_bfd(&pb, d);
	}

	__va_end(arp);

	if (   pb.idx >= 0		 
		&& f_write(pb.fp, pb.buf, (UINT)pb.idx, &nw) == FR_OK
		&& (UINT)pb.idx == nw) return pb.nchr;
	return (-1);
}

