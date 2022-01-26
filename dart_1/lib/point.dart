import 'dart:math';

class Point {
  int x;
  int y;
  int z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.unitVector() {
    return Point(1, 1, 1);
  }

  double distanceTo(Point anotherPoint) {
    return sqrt(pow(anotherPoint.x - x, 2) +
        pow(anotherPoint.y - y, 2) +
        pow(anotherPoint.z - z, 2));
  }
}
