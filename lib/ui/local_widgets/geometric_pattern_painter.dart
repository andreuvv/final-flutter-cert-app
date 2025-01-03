import 'package:flutter/material.dart';
import 'dart:math';

class GeometricPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    const double squareSize = 70;
    const double spacing = 100;
    final Random random = Random();

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        if (random.nextBool()) {
          // Randomly decide the color of the square
          if (random.nextBool()) {
            paint.color = Colors.white.withOpacity(0.1);
          } else {
            paint.color = Colors.white.withOpacity(0.3);
          }

          canvas.save();
          canvas.translate(x + squareSize / 2, y + squareSize / 2);
          canvas.rotate(pi / 4);
          canvas.drawRect(
            const Rect.fromLTWH(-squareSize / 2, -squareSize / 2, squareSize, squareSize),
            paint,
          );
          canvas.restore();
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
