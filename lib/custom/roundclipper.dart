import 'package:flutter/material.dart';

class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);

    path.quadraticBezierTo(20, size.height - 20, 50, size.height - 20);

    path.lineTo(size.width - 50, size.height - 20);

    path.quadraticBezierTo(size.width - 20, size.height - 20, size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

@override
bool shouldReclip(CustomClipper<Path> oldClipper) {
  return false;
}

class WeatherClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 30, 50);
    path.quadraticBezierTo(size.width - 5, 60, size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
