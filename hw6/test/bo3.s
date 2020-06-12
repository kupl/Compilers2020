{
  int x;
  int y;
  int z;
  int[10] a;

  read(x);
  read(y);
  z = 2 * y;

  if (z == x) {
    if (x > y + 10) {
       a[x] = 0; /* bug (e.g., x = 30, y = 15) */
    }
  } 
}
