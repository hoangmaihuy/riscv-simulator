#include <unistd.h>
#include <string.h>

int main()
{
  char *s = "Hello world!";
  write(1, s, strlen(s));
}