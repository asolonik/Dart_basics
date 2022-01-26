class DelimetersCalculator {
  int calcGCD(int a, int b) {
    while (b != 0) {
      b = a % (a = b);
    }
    return a;
  }

  double calcLCM(int a, int b) {
    return a / calcGCD(a, b) * b;
  }
}
