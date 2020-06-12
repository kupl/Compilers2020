{
  int i;
  int j;
  int[100] a;

  while (i < 100) {
    i++;
    j++;
  }
  print (i);
  print (j);
  a[j-1] = 0; /* safe */
}
