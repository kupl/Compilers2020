{
  int n;
  read(n);
  if (n > 0) {
    int[10] a;
    int i;
    i = 9;
    a[i] = 1; /* safe */
  } else {
    int[20] a;
    int i;
    i = 19;
    a[i] = 2; /* safe */
  }
  a[i] = 3; /* safe */
}
