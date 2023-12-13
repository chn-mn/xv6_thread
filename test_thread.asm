
_test_thread:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  exit();
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
  lock_init(lk);
  int arg1 = 1, arg2 = 1;

  printf(1, "below should be sequential print statements:\n");
  thread_create(&f1, (void *)&arg1, (void *)&arg2);
   f:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  12:	8d 5d e0             	lea    -0x20(%ebp),%ebx
{
  15:	51                   	push   %ecx
  16:	83 ec 28             	sub    $0x28,%esp
  lock_init(lk);
  19:	ff 35 84 0e 00 00    	push   0xe84
  1f:	e8 cc 04 00 00       	call   4f0 <lock_init>
  printf(1, "below should be sequential print statements:\n");
  24:	58                   	pop    %eax
  25:	5a                   	pop    %edx
  26:	68 20 0a 00 00       	push   $0xa20
  2b:	6a 01                	push   $0x1
  int arg1 = 1, arg2 = 1;
  2d:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
  34:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  printf(1, "below should be sequential print statements:\n");
  3b:	e8 60 06 00 00       	call   6a0 <printf>
  thread_create(&f1, (void *)&arg1, (void *)&arg2);
  40:	83 c4 0c             	add    $0xc,%esp
  43:	56                   	push   %esi
  44:	53                   	push   %ebx
  45:	68 d0 00 00 00       	push   $0xd0
  4a:	e8 21 04 00 00       	call   470 <thread_create>
	printf(1, "make t1\n");
  4f:	59                   	pop    %ecx
  50:	58                   	pop    %eax
  51:	68 0d 0a 00 00       	push   $0xa0d
  56:	6a 01                	push   $0x1
  58:	e8 43 06 00 00       	call   6a0 <printf>
  printf(1, "make t3\n");
	thread_join();
  printf(1, "join 1\n");
  thread_join();
  printf(1, "join 2\n");*/
  thread_join();
  5d:	e8 4e 04 00 00       	call   4b0 <thread_join>
  printf(1, "join 3\n");
  62:	58                   	pop    %eax
  63:	5a                   	pop    %edx
  64:	68 16 0a 00 00       	push   $0xa16
  69:	6a 01                	push   $0x1
  6b:	e8 30 06 00 00       	call   6a0 <printf>

  arg1 = 0;
  printf(1, "below should be a jarbled mess:\n");
  70:	59                   	pop    %ecx
  71:	58                   	pop    %eax
  72:	68 50 0a 00 00       	push   $0xa50
  77:	6a 01                	push   $0x1
  arg1 = 0;
  79:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  printf(1, "below should be a jarbled mess:\n");
  80:	e8 1b 06 00 00       	call   6a0 <printf>
  thread_create(&f1, (void *)&arg1, (void *)&arg2);
  85:	83 c4 0c             	add    $0xc,%esp
  88:	56                   	push   %esi
  89:	53                   	push   %ebx
  8a:	68 d0 00 00 00       	push   $0xd0
  8f:	e8 dc 03 00 00       	call   470 <thread_create>
  thread_create(&f2, (void *)&arg1, (void *)&arg2);
  94:	83 c4 0c             	add    $0xc,%esp
  97:	56                   	push   %esi
  98:	53                   	push   %ebx
  99:	68 40 01 00 00       	push   $0x140
  9e:	e8 cd 03 00 00       	call   470 <thread_create>
  thread_create(&f3, (void *)&arg1, (void *)&arg2);
  a3:	83 c4 0c             	add    $0xc,%esp
  a6:	56                   	push   %esi
  a7:	53                   	push   %ebx
  a8:	68 b0 01 00 00       	push   $0x1b0
  ad:	e8 be 03 00 00       	call   470 <thread_create>
  thread_join();
  b2:	e8 f9 03 00 00       	call   4b0 <thread_join>
  thread_join();
  b7:	e8 f4 03 00 00       	call   4b0 <thread_join>
  thread_join();
  bc:	e8 ef 03 00 00       	call   4b0 <thread_join>
  
  exit();
  c1:	e8 70 04 00 00       	call   536 <exit>
  c6:	66 90                	xchg   %ax,%ax
  c8:	66 90                	xchg   %ax,%ax
  ca:	66 90                	xchg   %ax,%ax
  cc:	66 90                	xchg   %ax,%ax
  ce:	66 90                	xchg   %ax,%ax

000000d0 <f1>:
void f1(void* arg1, void* arg2) {
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
  d6:	8b 45 08             	mov    0x8(%ebp),%eax
  d9:	8b 10                	mov    (%eax),%edx
  db:	85 d2                	test   %edx,%edx
  dd:	75 25                	jne    104 <f1+0x34>
  printf(1, "1. sleep for %d ticks\n", SLEEP_TIME);
  df:	83 ec 04             	sub    $0x4,%esp
  e2:	6a 64                	push   $0x64
  e4:	68 c8 09 00 00       	push   $0x9c8
  e9:	6a 01                	push   $0x1
  eb:	e8 b0 05 00 00       	call   6a0 <printf>
  sleep(SLEEP_TIME);
  f0:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  f7:	e8 ca 04 00 00       	call   5c6 <sleep>
  fc:	83 c4 10             	add    $0x10,%esp
  exit();
  ff:	e8 32 04 00 00       	call   536 <exit>
  if (num) lock_acquire(lk);
 104:	83 ec 0c             	sub    $0xc,%esp
 107:	ff 35 84 0e 00 00    	push   0xe84
 10d:	e8 ee 03 00 00       	call   500 <lock_acquire>
  printf(1, "1. sleep for %d ticks\n", SLEEP_TIME);
 112:	83 c4 0c             	add    $0xc,%esp
 115:	6a 64                	push   $0x64
 117:	68 c8 09 00 00       	push   $0x9c8
 11c:	6a 01                	push   $0x1
 11e:	e8 7d 05 00 00       	call   6a0 <printf>
  sleep(SLEEP_TIME);
 123:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 12a:	e8 97 04 00 00       	call   5c6 <sleep>
  if (num) lock_release(lk);
 12f:	58                   	pop    %eax
 130:	ff 35 84 0e 00 00    	push   0xe84
 136:	e8 e5 03 00 00       	call   520 <lock_release>
 13b:	83 c4 10             	add    $0x10,%esp
 13e:	eb bf                	jmp    ff <f1+0x2f>

00000140 <f2>:
void f2(void* arg1, void* arg2) {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	8b 10                	mov    (%eax),%edx
 14b:	85 d2                	test   %edx,%edx
 14d:	75 25                	jne    174 <f2+0x34>
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
 14f:	83 ec 04             	sub    $0x4,%esp
 152:	6a 64                	push   $0x64
 154:	68 df 09 00 00       	push   $0x9df
 159:	6a 01                	push   $0x1
 15b:	e8 40 05 00 00       	call   6a0 <printf>
  sleep(SLEEP_TIME);
 160:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 167:	e8 5a 04 00 00       	call   5c6 <sleep>
 16c:	83 c4 10             	add    $0x10,%esp
  exit();
 16f:	e8 c2 03 00 00       	call   536 <exit>
  if (num) lock_acquire(lk);
 174:	83 ec 0c             	sub    $0xc,%esp
 177:	ff 35 84 0e 00 00    	push   0xe84
 17d:	e8 7e 03 00 00       	call   500 <lock_acquire>
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
 182:	83 c4 0c             	add    $0xc,%esp
 185:	6a 64                	push   $0x64
 187:	68 df 09 00 00       	push   $0x9df
 18c:	6a 01                	push   $0x1
 18e:	e8 0d 05 00 00       	call   6a0 <printf>
  sleep(SLEEP_TIME);
 193:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 19a:	e8 27 04 00 00       	call   5c6 <sleep>
  if (num) lock_release(lk);
 19f:	58                   	pop    %eax
 1a0:	ff 35 84 0e 00 00    	push   0xe84
 1a6:	e8 75 03 00 00       	call   520 <lock_release>
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	eb bf                	jmp    16f <f2+0x2f>

000001b0 <f3>:
void f3(void* arg1, void* arg2) {
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
 1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 1b9:	8b 10                	mov    (%eax),%edx
 1bb:	85 d2                	test   %edx,%edx
 1bd:	75 25                	jne    1e4 <f3+0x34>
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
 1bf:	83 ec 04             	sub    $0x4,%esp
 1c2:	6a 64                	push   $0x64
 1c4:	68 f6 09 00 00       	push   $0x9f6
 1c9:	6a 01                	push   $0x1
 1cb:	e8 d0 04 00 00       	call   6a0 <printf>
  sleep(SLEEP_TIME);
 1d0:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1d7:	e8 ea 03 00 00       	call   5c6 <sleep>
 1dc:	83 c4 10             	add    $0x10,%esp
  exit();
 1df:	e8 52 03 00 00       	call   536 <exit>
  if (num) lock_acquire(lk);
 1e4:	83 ec 0c             	sub    $0xc,%esp
 1e7:	ff 35 84 0e 00 00    	push   0xe84
 1ed:	e8 0e 03 00 00       	call   500 <lock_acquire>
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
 1f2:	83 c4 0c             	add    $0xc,%esp
 1f5:	6a 64                	push   $0x64
 1f7:	68 f6 09 00 00       	push   $0x9f6
 1fc:	6a 01                	push   $0x1
 1fe:	e8 9d 04 00 00       	call   6a0 <printf>
  sleep(SLEEP_TIME);
 203:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 20a:	e8 b7 03 00 00       	call   5c6 <sleep>
  if (num) lock_release(lk);
 20f:	58                   	pop    %eax
 210:	ff 35 84 0e 00 00    	push   0xe84
 216:	e8 05 03 00 00       	call   520 <lock_release>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb bf                	jmp    1df <f3+0x2f>

00000220 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 220:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 221:	31 c0                	xor    %eax,%eax
{
 223:	89 e5                	mov    %esp,%ebp
 225:	53                   	push   %ebx
 226:	8b 4d 08             	mov    0x8(%ebp),%ecx
 229:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 230:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 234:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 237:	83 c0 01             	add    $0x1,%eax
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strcpy+0x10>
    ;
  return os;
}
 23e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 241:	89 c8                	mov    %ecx,%eax
 243:	c9                   	leave  
 244:	c3                   	ret    
 245:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
 257:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 25a:	0f b6 02             	movzbl (%edx),%eax
 25d:	84 c0                	test   %al,%al
 25f:	75 17                	jne    278 <strcmp+0x28>
 261:	eb 3a                	jmp    29d <strcmp+0x4d>
 263:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 267:	90                   	nop
 268:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 26c:	83 c2 01             	add    $0x1,%edx
 26f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 272:	84 c0                	test   %al,%al
 274:	74 1a                	je     290 <strcmp+0x40>
    p++, q++;
 276:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 278:	0f b6 19             	movzbl (%ecx),%ebx
 27b:	38 c3                	cmp    %al,%bl
 27d:	74 e9                	je     268 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 27f:	29 d8                	sub    %ebx,%eax
}
 281:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 284:	c9                   	leave  
 285:	c3                   	ret    
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 290:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 294:	31 c0                	xor    %eax,%eax
 296:	29 d8                	sub    %ebx,%eax
}
 298:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29b:	c9                   	leave  
 29c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 29d:	0f b6 19             	movzbl (%ecx),%ebx
 2a0:	31 c0                	xor    %eax,%eax
 2a2:	eb db                	jmp    27f <strcmp+0x2f>
 2a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <strlen>:

uint
strlen(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2b6:	80 3a 00             	cmpb   $0x0,(%edx)
 2b9:	74 15                	je     2d0 <strlen+0x20>
 2bb:	31 c0                	xor    %eax,%eax
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
 2c0:	83 c0 01             	add    $0x1,%eax
 2c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2c7:	89 c1                	mov    %eax,%ecx
 2c9:	75 f5                	jne    2c0 <strlen+0x10>
    ;
  return n;
}
 2cb:	89 c8                	mov    %ecx,%eax
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    
 2cf:	90                   	nop
  for(n = 0; s[n]; n++)
 2d0:	31 c9                	xor    %ecx,%ecx
}
 2d2:	5d                   	pop    %ebp
 2d3:	89 c8                	mov    %ecx,%eax
 2d5:	c3                   	ret    
 2d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ed:	89 d7                	mov    %edx,%edi
 2ef:	fc                   	cld    
 2f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2f5:	89 d0                	mov    %edx,%eax
 2f7:	c9                   	leave  
 2f8:	c3                   	ret    
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <strchr>:

char*
strchr(const char *s, char c)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 45 08             	mov    0x8(%ebp),%eax
 306:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 30a:	0f b6 10             	movzbl (%eax),%edx
 30d:	84 d2                	test   %dl,%dl
 30f:	75 12                	jne    323 <strchr+0x23>
 311:	eb 1d                	jmp    330 <strchr+0x30>
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 31c:	83 c0 01             	add    $0x1,%eax
 31f:	84 d2                	test   %dl,%dl
 321:	74 0d                	je     330 <strchr+0x30>
    if(*s == c)
 323:	38 d1                	cmp    %dl,%cl
 325:	75 f1                	jne    318 <strchr+0x18>
      return (char*)s;
  return 0;
}
 327:	5d                   	pop    %ebp
 328:	c3                   	ret    
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 330:	31 c0                	xor    %eax,%eax
}
 332:	5d                   	pop    %ebp
 333:	c3                   	ret    
 334:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <gets>:

char*
gets(char *buf, int max)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 345:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 348:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 349:	31 db                	xor    %ebx,%ebx
{
 34b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 34e:	eb 27                	jmp    377 <gets+0x37>
    cc = read(0, &c, 1);
 350:	83 ec 04             	sub    $0x4,%esp
 353:	6a 01                	push   $0x1
 355:	57                   	push   %edi
 356:	6a 00                	push   $0x0
 358:	e8 f1 01 00 00       	call   54e <read>
    if(cc < 1)
 35d:	83 c4 10             	add    $0x10,%esp
 360:	85 c0                	test   %eax,%eax
 362:	7e 1d                	jle    381 <gets+0x41>
      break;
    buf[i++] = c;
 364:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 368:	8b 55 08             	mov    0x8(%ebp),%edx
 36b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 36f:	3c 0a                	cmp    $0xa,%al
 371:	74 1d                	je     390 <gets+0x50>
 373:	3c 0d                	cmp    $0xd,%al
 375:	74 19                	je     390 <gets+0x50>
  for(i=0; i+1 < max; ){
 377:	89 de                	mov    %ebx,%esi
 379:	83 c3 01             	add    $0x1,%ebx
 37c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 37f:	7c cf                	jl     350 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 381:	8b 45 08             	mov    0x8(%ebp),%eax
 384:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 388:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38b:	5b                   	pop    %ebx
 38c:	5e                   	pop    %esi
 38d:	5f                   	pop    %edi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    
  buf[i] = '\0';
 390:	8b 45 08             	mov    0x8(%ebp),%eax
 393:	89 de                	mov    %ebx,%esi
 395:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 399:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39c:	5b                   	pop    %ebx
 39d:	5e                   	pop    %esi
 39e:	5f                   	pop    %edi
 39f:	5d                   	pop    %ebp
 3a0:	c3                   	ret    
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b5:	83 ec 08             	sub    $0x8,%esp
 3b8:	6a 00                	push   $0x0
 3ba:	ff 75 08             	push   0x8(%ebp)
 3bd:	e8 b4 01 00 00       	call   576 <open>
  if(fd < 0)
 3c2:	83 c4 10             	add    $0x10,%esp
 3c5:	85 c0                	test   %eax,%eax
 3c7:	78 27                	js     3f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3c9:	83 ec 08             	sub    $0x8,%esp
 3cc:	ff 75 0c             	push   0xc(%ebp)
 3cf:	89 c3                	mov    %eax,%ebx
 3d1:	50                   	push   %eax
 3d2:	e8 b7 01 00 00       	call   58e <fstat>
  close(fd);
 3d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3da:	89 c6                	mov    %eax,%esi
  close(fd);
 3dc:	e8 7d 01 00 00       	call   55e <close>
  return r;
 3e1:	83 c4 10             	add    $0x10,%esp
}
 3e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3e7:	89 f0                	mov    %esi,%eax
 3e9:	5b                   	pop    %ebx
 3ea:	5e                   	pop    %esi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3f5:	eb ed                	jmp    3e4 <stat+0x34>
 3f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fe:	66 90                	xchg   %ax,%ax

00000400 <atoi>:

int
atoi(const char *s)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 407:	0f be 02             	movsbl (%edx),%eax
 40a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 40d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 410:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 415:	77 1e                	ja     435 <atoi+0x35>
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 420:	83 c2 01             	add    $0x1,%edx
 423:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 426:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 42a:	0f be 02             	movsbl (%edx),%eax
 42d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 430:	80 fb 09             	cmp    $0x9,%bl
 433:	76 eb                	jbe    420 <atoi+0x20>
  return n;
}
 435:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 438:	89 c8                	mov    %ecx,%eax
 43a:	c9                   	leave  
 43b:	c3                   	ret    
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	8b 45 10             	mov    0x10(%ebp),%eax
 447:	8b 55 08             	mov    0x8(%ebp),%edx
 44a:	56                   	push   %esi
 44b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 44e:	85 c0                	test   %eax,%eax
 450:	7e 13                	jle    465 <memmove+0x25>
 452:	01 d0                	add    %edx,%eax
  dst = vdst;
 454:	89 d7                	mov    %edx,%edi
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 460:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 461:	39 f8                	cmp    %edi,%eax
 463:	75 fb                	jne    460 <memmove+0x20>
  return vdst;
}
 465:	5e                   	pop    %esi
 466:	89 d0                	mov    %edx,%eax
 468:	5f                   	pop    %edi
 469:	5d                   	pop    %ebp
 46a:	c3                   	ret    
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <thread_create>:

int 
thread_create(void* fcn, void* arg1, void* arg2)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	83 ec 14             	sub    $0x14,%esp
	void* stack = malloc(PGSIZE);
 476:	68 00 10 00 00       	push   $0x1000
 47b:	e8 50 04 00 00       	call   8d0 <malloc>

	if(stack == 0)
 480:	83 c4 10             	add    $0x10,%esp
 483:	85 c0                	test   %eax,%eax
 485:	74 14                	je     49b <thread_create+0x2b>
		return -1;

	return clone(fcn, arg1, arg2, stack);
 487:	50                   	push   %eax
 488:	ff 75 10             	push   0x10(%ebp)
 48b:	ff 75 0c             	push   0xc(%ebp)
 48e:	ff 75 08             	push   0x8(%ebp)
 491:	e8 40 01 00 00       	call   5d6 <clone>
 496:	83 c4 10             	add    $0x10,%esp
}
 499:	c9                   	leave  
 49a:	c3                   	ret    
 49b:	c9                   	leave  
		return -1;
 49c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 4a1:	c3                   	ret    
 4a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004b0 <thread_join>:

int
thread_join()
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	83 ec 34             	sub    $0x34,%esp
	void *stack;
	int pid = join(&stack);
 4b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b9:	50                   	push   %eax
 4ba:	e8 1f 01 00 00       	call   5de <join>
	
	if(pid >= 0)
 4bf:	83 c4 10             	add    $0x10,%esp
 4c2:	85 c0                	test   %eax,%eax
 4c4:	79 0a                	jns    4d0 <thread_join+0x20>
		free(stack);

	return pid;
}
 4c6:	c9                   	leave  
 4c7:	c3                   	ret    
 4c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop
		free(stack);
 4d0:	83 ec 0c             	sub    $0xc,%esp
 4d3:	ff 75 f4             	push   -0xc(%ebp)
 4d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4d9:	e8 62 03 00 00       	call   840 <free>
 4de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4e1:	83 c4 10             	add    $0x10,%esp
}
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    
 4e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <lock_init>:

void lock_init(lock_t *lock){
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
	lock->flag = 0;
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4fc:	5d                   	pop    %ebp
 4fd:	c3                   	ret    
 4fe:	66 90                	xchg   %ax,%ax

00000500 <lock_acquire>:

// only first thread can get 0 from fetch_and_add
void lock_acquire(lock_t *lock){
 500:	55                   	push   %ebp
  asm volatile("movl %0,%%cr3" : : "r" (val));
}

static inline int fetch_and_add(int* variable, int value)
{
    __asm__ volatile("lock; xaddl %0, %1"
 501:	b9 01 00 00 00       	mov    $0x1,%ecx
 506:	89 e5                	mov    %esp,%ebp
 508:	8b 55 08             	mov    0x8(%ebp),%edx
 50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop
 510:	89 c8                	mov    %ecx,%eax
 512:	f0 0f c1 02          	lock xadd %eax,(%edx)
	while(fetch_and_add((int*)&lock->flag, 1) != 0)
 516:	85 c0                	test   %eax,%eax
 518:	75 f6                	jne    510 <lock_acquire+0x10>
		;
}
 51a:	5d                   	pop    %ebp
 51b:	c3                   	ret    
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000520 <lock_release>:
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 52c:	5d                   	pop    %ebp
 52d:	c3                   	ret    

0000052e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 52e:	b8 01 00 00 00       	mov    $0x1,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <exit>:
SYSCALL(exit)
 536:	b8 02 00 00 00       	mov    $0x2,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <wait>:
SYSCALL(wait)
 53e:	b8 03 00 00 00       	mov    $0x3,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <pipe>:
SYSCALL(pipe)
 546:	b8 04 00 00 00       	mov    $0x4,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <read>:
SYSCALL(read)
 54e:	b8 05 00 00 00       	mov    $0x5,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <write>:
SYSCALL(write)
 556:	b8 10 00 00 00       	mov    $0x10,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <close>:
SYSCALL(close)
 55e:	b8 15 00 00 00       	mov    $0x15,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <kill>:
SYSCALL(kill)
 566:	b8 06 00 00 00       	mov    $0x6,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <exec>:
SYSCALL(exec)
 56e:	b8 07 00 00 00       	mov    $0x7,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <open>:
SYSCALL(open)
 576:	b8 0f 00 00 00       	mov    $0xf,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <mknod>:
SYSCALL(mknod)
 57e:	b8 11 00 00 00       	mov    $0x11,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <unlink>:
SYSCALL(unlink)
 586:	b8 12 00 00 00       	mov    $0x12,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <fstat>:
SYSCALL(fstat)
 58e:	b8 08 00 00 00       	mov    $0x8,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <link>:
SYSCALL(link)
 596:	b8 13 00 00 00       	mov    $0x13,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <mkdir>:
SYSCALL(mkdir)
 59e:	b8 14 00 00 00       	mov    $0x14,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <chdir>:
SYSCALL(chdir)
 5a6:	b8 09 00 00 00       	mov    $0x9,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <dup>:
SYSCALL(dup)
 5ae:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <getpid>:
SYSCALL(getpid)
 5b6:	b8 0b 00 00 00       	mov    $0xb,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <sbrk>:
SYSCALL(sbrk)
 5be:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <sleep>:
SYSCALL(sleep)
 5c6:	b8 0d 00 00 00       	mov    $0xd,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <uptime>:
SYSCALL(uptime)
 5ce:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <clone>:
SYSCALL(clone)
 5d6:	b8 16 00 00 00       	mov    $0x16,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <join>:
SYSCALL(join)
 5de:	b8 17 00 00 00       	mov    $0x17,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    
 5e6:	66 90                	xchg   %ax,%ax
 5e8:	66 90                	xchg   %ax,%ax
 5ea:	66 90                	xchg   %ax,%ax
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 3c             	sub    $0x3c,%esp
 5f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5fc:	89 d1                	mov    %edx,%ecx
{
 5fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 601:	85 d2                	test   %edx,%edx
 603:	0f 89 7f 00 00 00    	jns    688 <printint+0x98>
 609:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 60d:	74 79                	je     688 <printint+0x98>
    neg = 1;
 60f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 616:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 618:	31 db                	xor    %ebx,%ebx
 61a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 620:	89 c8                	mov    %ecx,%eax
 622:	31 d2                	xor    %edx,%edx
 624:	89 cf                	mov    %ecx,%edi
 626:	f7 75 c4             	divl   -0x3c(%ebp)
 629:	0f b6 92 d0 0a 00 00 	movzbl 0xad0(%edx),%edx
 630:	89 45 c0             	mov    %eax,-0x40(%ebp)
 633:	89 d8                	mov    %ebx,%eax
 635:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 638:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 63b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 63e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 641:	76 dd                	jbe    620 <printint+0x30>
  if(neg)
 643:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 646:	85 c9                	test   %ecx,%ecx
 648:	74 0c                	je     656 <printint+0x66>
    buf[i++] = '-';
 64a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 64f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 651:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 656:	8b 7d b8             	mov    -0x48(%ebp),%edi
 659:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 65d:	eb 07                	jmp    666 <printint+0x76>
 65f:	90                   	nop
    putc(fd, buf[i]);
 660:	0f b6 13             	movzbl (%ebx),%edx
 663:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 666:	83 ec 04             	sub    $0x4,%esp
 669:	88 55 d7             	mov    %dl,-0x29(%ebp)
 66c:	6a 01                	push   $0x1
 66e:	56                   	push   %esi
 66f:	57                   	push   %edi
 670:	e8 e1 fe ff ff       	call   556 <write>
  while(--i >= 0)
 675:	83 c4 10             	add    $0x10,%esp
 678:	39 de                	cmp    %ebx,%esi
 67a:	75 e4                	jne    660 <printint+0x70>
}
 67c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 688:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 68f:	eb 87                	jmp    618 <printint+0x28>
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop

000006a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 6ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 6af:	0f b6 13             	movzbl (%ebx),%edx
 6b2:	84 d2                	test   %dl,%dl
 6b4:	74 6a                	je     720 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 6b6:	8d 45 10             	lea    0x10(%ebp),%eax
 6b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c4:	eb 36                	jmp    6fc <printf+0x5c>
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
 6d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6d8:	83 f8 25             	cmp    $0x25,%eax
 6db:	74 15                	je     6f2 <printf+0x52>
  write(fd, &c, 1);
 6dd:	83 ec 04             	sub    $0x4,%esp
 6e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	56                   	push   %esi
 6e7:	e8 6a fe ff ff       	call   556 <write>
 6ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 6ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6f2:	0f b6 13             	movzbl (%ebx),%edx
 6f5:	83 c3 01             	add    $0x1,%ebx
 6f8:	84 d2                	test   %dl,%dl
 6fa:	74 24                	je     720 <printf+0x80>
    c = fmt[i] & 0xff;
 6fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6ff:	85 c9                	test   %ecx,%ecx
 701:	74 cd                	je     6d0 <printf+0x30>
      }
    } else if(state == '%'){
 703:	83 f9 25             	cmp    $0x25,%ecx
 706:	75 ea                	jne    6f2 <printf+0x52>
      if(c == 'd'){
 708:	83 f8 25             	cmp    $0x25,%eax
 70b:	0f 84 07 01 00 00    	je     818 <printf+0x178>
 711:	83 e8 63             	sub    $0x63,%eax
 714:	83 f8 15             	cmp    $0x15,%eax
 717:	77 17                	ja     730 <printf+0x90>
 719:	ff 24 85 78 0a 00 00 	jmp    *0xa78(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 720:	8d 65 f4             	lea    -0xc(%ebp),%esp
 723:	5b                   	pop    %ebx
 724:	5e                   	pop    %esi
 725:	5f                   	pop    %edi
 726:	5d                   	pop    %ebp
 727:	c3                   	ret    
 728:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 736:	6a 01                	push   $0x1
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 73e:	e8 13 fe ff ff       	call   556 <write>
        putc(fd, c);
 743:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 747:	83 c4 0c             	add    $0xc,%esp
 74a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 74d:	6a 01                	push   $0x1
 74f:	57                   	push   %edi
 750:	56                   	push   %esi
 751:	e8 00 fe ff ff       	call   556 <write>
        putc(fd, c);
 756:	83 c4 10             	add    $0x10,%esp
      state = 0;
 759:	31 c9                	xor    %ecx,%ecx
 75b:	eb 95                	jmp    6f2 <printf+0x52>
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 10 00 00 00       	mov    $0x10,%ecx
 768:	6a 00                	push   $0x0
 76a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 76d:	8b 10                	mov    (%eax),%edx
 76f:	89 f0                	mov    %esi,%eax
 771:	e8 7a fe ff ff       	call   5f0 <printint>
        ap++;
 776:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 77a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77d:	31 c9                	xor    %ecx,%ecx
 77f:	e9 6e ff ff ff       	jmp    6f2 <printf+0x52>
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 788:	8b 45 d0             	mov    -0x30(%ebp),%eax
 78b:	8b 10                	mov    (%eax),%edx
        ap++;
 78d:	83 c0 04             	add    $0x4,%eax
 790:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 793:	85 d2                	test   %edx,%edx
 795:	0f 84 8d 00 00 00    	je     828 <printf+0x188>
        while(*s != 0){
 79b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 79e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 7a0:	84 c0                	test   %al,%al
 7a2:	0f 84 4a ff ff ff    	je     6f2 <printf+0x52>
 7a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7ab:	89 d3                	mov    %edx,%ebx
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7b3:	83 c3 01             	add    $0x1,%ebx
 7b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7b9:	6a 01                	push   $0x1
 7bb:	57                   	push   %edi
 7bc:	56                   	push   %esi
 7bd:	e8 94 fd ff ff       	call   556 <write>
        while(*s != 0){
 7c2:	0f b6 03             	movzbl (%ebx),%eax
 7c5:	83 c4 10             	add    $0x10,%esp
 7c8:	84 c0                	test   %al,%al
 7ca:	75 e4                	jne    7b0 <printf+0x110>
      state = 0;
 7cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7cf:	31 c9                	xor    %ecx,%ecx
 7d1:	e9 1c ff ff ff       	jmp    6f2 <printf+0x52>
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e8:	6a 01                	push   $0x1
 7ea:	e9 7b ff ff ff       	jmp    76a <printf+0xca>
 7ef:	90                   	nop
        putc(fd, *ap);
 7f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7f8:	6a 01                	push   $0x1
 7fa:	57                   	push   %edi
 7fb:	56                   	push   %esi
        putc(fd, *ap);
 7fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7ff:	e8 52 fd ff ff       	call   556 <write>
        ap++;
 804:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 808:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80b:	31 c9                	xor    %ecx,%ecx
 80d:	e9 e0 fe ff ff       	jmp    6f2 <printf+0x52>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 818:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 81b:	83 ec 04             	sub    $0x4,%esp
 81e:	e9 2a ff ff ff       	jmp    74d <printf+0xad>
 823:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 827:	90                   	nop
          s = "(null)";
 828:	ba 71 0a 00 00       	mov    $0xa71,%edx
        while(*s != 0){
 82d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 830:	b8 28 00 00 00       	mov    $0x28,%eax
 835:	89 d3                	mov    %edx,%ebx
 837:	e9 74 ff ff ff       	jmp    7b0 <printf+0x110>
 83c:	66 90                	xchg   %ax,%ax
 83e:	66 90                	xchg   %ax,%ax

00000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	a1 88 0e 00 00       	mov    0xe88,%eax
{
 846:	89 e5                	mov    %esp,%ebp
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	53                   	push   %ebx
 84b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 84e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 858:	89 c2                	mov    %eax,%edx
 85a:	8b 00                	mov    (%eax),%eax
 85c:	39 ca                	cmp    %ecx,%edx
 85e:	73 30                	jae    890 <free+0x50>
 860:	39 c1                	cmp    %eax,%ecx
 862:	72 04                	jb     868 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 864:	39 c2                	cmp    %eax,%edx
 866:	72 f0                	jb     858 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 f8                	cmp    %edi,%eax
 870:	74 30                	je     8a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 872:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 875:	8b 42 04             	mov    0x4(%edx),%eax
 878:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 87b:	39 f1                	cmp    %esi,%ecx
 87d:	74 3a                	je     8b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 87f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 881:	5b                   	pop    %ebx
  freep = p;
 882:	89 15 88 0e 00 00    	mov    %edx,0xe88
}
 888:	5e                   	pop    %esi
 889:	5f                   	pop    %edi
 88a:	5d                   	pop    %ebp
 88b:	c3                   	ret    
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 890:	39 c2                	cmp    %eax,%edx
 892:	72 c4                	jb     858 <free+0x18>
 894:	39 c1                	cmp    %eax,%ecx
 896:	73 c0                	jae    858 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 898:	8b 73 fc             	mov    -0x4(%ebx),%esi
 89b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 89e:	39 f8                	cmp    %edi,%eax
 8a0:	75 d0                	jne    872 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 8a2:	03 70 04             	add    0x4(%eax),%esi
 8a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a8:	8b 02                	mov    (%edx),%eax
 8aa:	8b 00                	mov    (%eax),%eax
 8ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 8af:	8b 42 04             	mov    0x4(%edx),%eax
 8b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8b5:	39 f1                	cmp    %esi,%ecx
 8b7:	75 c6                	jne    87f <free+0x3f>
    p->s.size += bp->s.size;
 8b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 8bc:	89 15 88 0e 00 00    	mov    %edx,0xe88
    p->s.size += bp->s.size;
 8c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8c8:	89 0a                	mov    %ecx,(%edx)
}
 8ca:	5b                   	pop    %ebx
 8cb:	5e                   	pop    %esi
 8cc:	5f                   	pop    %edi
 8cd:	5d                   	pop    %ebp
 8ce:	c3                   	ret    
 8cf:	90                   	nop

000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8dc:	8b 3d 88 0e 00 00    	mov    0xe88,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	8d 70 07             	lea    0x7(%eax),%esi
 8e5:	c1 ee 03             	shr    $0x3,%esi
 8e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8eb:	85 ff                	test   %edi,%edi
 8ed:	0f 84 9d 00 00 00    	je     990 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8f8:	39 f1                	cmp    %esi,%ecx
 8fa:	73 6a                	jae    966 <malloc+0x96>
 8fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 901:	39 de                	cmp    %ebx,%esi
 903:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 906:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 90d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 910:	eb 17                	jmp    929 <malloc+0x59>
 912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 918:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 91a:	8b 48 04             	mov    0x4(%eax),%ecx
 91d:	39 f1                	cmp    %esi,%ecx
 91f:	73 4f                	jae    970 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 921:	8b 3d 88 0e 00 00    	mov    0xe88,%edi
 927:	89 c2                	mov    %eax,%edx
 929:	39 d7                	cmp    %edx,%edi
 92b:	75 eb                	jne    918 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 92d:	83 ec 0c             	sub    $0xc,%esp
 930:	ff 75 e4             	push   -0x1c(%ebp)
 933:	e8 86 fc ff ff       	call   5be <sbrk>
  if(p == (char*)-1)
 938:	83 c4 10             	add    $0x10,%esp
 93b:	83 f8 ff             	cmp    $0xffffffff,%eax
 93e:	74 1c                	je     95c <malloc+0x8c>
  hp->s.size = nu;
 940:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 943:	83 ec 0c             	sub    $0xc,%esp
 946:	83 c0 08             	add    $0x8,%eax
 949:	50                   	push   %eax
 94a:	e8 f1 fe ff ff       	call   840 <free>
  return freep;
 94f:	8b 15 88 0e 00 00    	mov    0xe88,%edx
      if((p = morecore(nunits)) == 0)
 955:	83 c4 10             	add    $0x10,%esp
 958:	85 d2                	test   %edx,%edx
 95a:	75 bc                	jne    918 <malloc+0x48>
        return 0;
  }
}
 95c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 95f:	31 c0                	xor    %eax,%eax
}
 961:	5b                   	pop    %ebx
 962:	5e                   	pop    %esi
 963:	5f                   	pop    %edi
 964:	5d                   	pop    %ebp
 965:	c3                   	ret    
    if(p->s.size >= nunits){
 966:	89 d0                	mov    %edx,%eax
 968:	89 fa                	mov    %edi,%edx
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 970:	39 ce                	cmp    %ecx,%esi
 972:	74 4c                	je     9c0 <malloc+0xf0>
        p->s.size -= nunits;
 974:	29 f1                	sub    %esi,%ecx
 976:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 979:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 97c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 97f:	89 15 88 0e 00 00    	mov    %edx,0xe88
}
 985:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 988:	83 c0 08             	add    $0x8,%eax
}
 98b:	5b                   	pop    %ebx
 98c:	5e                   	pop    %esi
 98d:	5f                   	pop    %edi
 98e:	5d                   	pop    %ebp
 98f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 990:	c7 05 88 0e 00 00 8c 	movl   $0xe8c,0xe88
 997:	0e 00 00 
    base.s.size = 0;
 99a:	bf 8c 0e 00 00       	mov    $0xe8c,%edi
    base.s.ptr = freep = prevp = &base;
 99f:	c7 05 8c 0e 00 00 8c 	movl   $0xe8c,0xe8c
 9a6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 9ab:	c7 05 90 0e 00 00 00 	movl   $0x0,0xe90
 9b2:	00 00 00 
    if(p->s.size >= nunits){
 9b5:	e9 42 ff ff ff       	jmp    8fc <malloc+0x2c>
 9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 08                	mov    (%eax),%ecx
 9c2:	89 0a                	mov    %ecx,(%edx)
 9c4:	eb b9                	jmp    97f <malloc+0xaf>
