import 'dart:async';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flame/components.dart';

//// MAIN SECTION

class MainSection extends PositionComponent with TapCallbacks {
  MainSection({super.position});
  void render(Canvas canvas) {
    _renderMainArea(canvas);
  }

  @override
  FutureOr<void> onLoad() {
    return super.onLoad();
  }

  static final cardRRect = RRect.fromRectAndRadius(
    const Rect.fromLTWH(0, 0, 1000, 1700),
    const Radius.circular(0),
  );

  static final Paint backBorderPaint2 = Paint()
    ..color = Color.fromARGB(255, 255, 255, 255)
    ..style = PaintingStyle.fill
    ..strokeWidth = 1;

  void _renderMainArea(Canvas canvas) {
    canvas.drawRRect(cardRRect, backBorderPaint2);
  }
}

////