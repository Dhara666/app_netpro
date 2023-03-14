import 'package:flutter/material.dart';

class RightArrow extends CustomPainter {
  Color color;
  RightArrow(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();

    path
      ..lineTo(size.width * .85, 0) // .85 amount of right gap
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width * .85, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}