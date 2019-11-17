int[] myX = {50, 80, 20, 30, 70,30, 20, 80, 100, 10};

fill(0);
for (int i = 0; i < myX.length; i++) {
  rect(0, i*10, myX[i], 8);
}
