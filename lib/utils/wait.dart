import 'dart:ui';

Future sleepSum(int valueOne, int valueTwo) {
  return Future.delayed(const Duration(seconds: 1), () => valueOne + valueTwo);
}

Future wait({double speed = 0.5}) {
  final milisec = lerpDouble(100, 2000, speed)?.toInt() ?? 0;
  return Future.delayed(Duration(milliseconds: milisec));
}
