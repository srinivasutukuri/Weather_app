import 'dart:math';

import 'package:flutter/material.dart';
import 'package:texttheam/contant/colors.dart';

class WindPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var radius = min(centerx, centery);
    var brash = Paint()..color = AppColors.lightGrey;
    var indicaterbrash = Paint()..color = AppColors.white;
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 12;
    for (double i = 0; i < 360; i += 2) {
      var x1 = centerx + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerx + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerx + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerx + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), brash);
    }

    for (double i = 0; i < 360; i += 45) {
      var x1 = centerx + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerx + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerx + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerx + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), indicaterbrash);
    }

    var textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    var textRadius = outerCircleRadius - 20; // Position text inside the circle

    _drawText(canvas, textPainter, 'N', centerx, centery - textRadius); // 0° (N)
    _drawText(canvas, textPainter, 'E', centerx + textRadius, centery); // 90° (E)
    _drawText(canvas, textPainter, 'S', centerx, centery + textRadius); // 180° (S)
    _drawText(canvas, textPainter, 'W', centerx - textRadius, centery); // 270° (W)
  }

  // Helper function to draw text
  void _drawText(Canvas canvas, TextPainter textPainter, String text, double x, double y) {
    textPainter.text = TextSpan(
      text: text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(WindPainter oldDelegate) => true;
}
