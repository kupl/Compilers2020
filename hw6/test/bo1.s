{
  int i;
  int[1000] a;

  while (i < 1000) {
    i++;
  }
  a[i] = 1; /* bug: 'i' should be 'i-1' */
}
