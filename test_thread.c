#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#define SLEEP_TIME 100

lock_t* lk;

void f1(void* arg1, void* arg2) {
  int num = *(int*)arg1;
  if (num) lock_acquire(lk);
  printf(1, "1. sleep for %d ticks\n", SLEEP_TIME);
  sleep(SLEEP_TIME);
  if (num) lock_release(lk);
  exit();
}

void f2(void* arg1, void* arg2) {
  int num = *(int*)arg1;
  if (num) lock_acquire(lk);
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
  sleep(SLEEP_TIME);
  if (num) lock_release(lk);
  exit();
}

void f3(void* arg1, void* arg2) {
  int num = *(int*)arg1;
  if (num) lock_acquire(lk);
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
  sleep(SLEEP_TIME);
  if (num) lock_release(lk);
  exit();
}

int
main(int argc, char *argv[])
{
  lock_init(lk);
  int arg1 = 1, arg2 = 1;

  printf(1, "below should be sequential print statements:\n");
  thread_create(&f1, (void *)&arg1, (void *)&arg2);
	printf(1, "make t1\n");
  /*thread_create(&f2, (void *)&arg1, (void *)&arg2);
  printf(1, "make t2\n");
	thread_create(&f3, (void *)&arg1, (void *)&arg2);
  printf(1, "make t3\n");
	thread_join();
  printf(1, "join 1\n");
  thread_join();
  printf(1, "join 2\n");*/
  thread_join();
  printf(1, "join 3\n");

  arg1 = 0;
  printf(1, "below should be a jarbled mess:\n");
  thread_create(&f1, (void *)&arg1, (void *)&arg2);
  thread_create(&f2, (void *)&arg1, (void *)&arg2);
  thread_create(&f3, (void *)&arg1, (void *)&arg2);
  thread_join();
  thread_join();
  thread_join();
  
  exit();
}
