import 'dart:async';
import 'dart:ui';

import 'package:duolingo/main.dart';
import 'package:duolingo/sprites.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';

//// TOP BAR

class TopBar extends PositionComponent with TapCallbacks {
  TopBar({super.position});
  @override
  void render(Canvas canvas) {
    _renderTopBar(canvas);
  }

  @override
  FutureOr<void> onLoad() {
    add(PositionComponent(children: [
      SpriteButtonComponent(
          position: Vector2(50, 150),
          size: Vector2(100, 100),
          button: duolingoSprite(MySprites.play),
          buttonDown: duolingoSprite(MySprites.playPressed)),
      SpriteButtonComponent(
          position: Vector2(250, 150),
          size: Vector2(100, 100),
          button: duolingoSprite(MySprites.settings),
          buttonDown: duolingoSprite(MySprites.settingsPressed)),
      SpriteButtonComponent(
          position: Vector2(450, 150),
          size: Vector2(100, 100),
          button: duolingoSprite(MySprites.key),
          buttonDown: duolingoSprite(MySprites.keyPressed))
    ]));
    return super.onLoad();
  }

  static final cardRRect = RRect.fromRectAndRadius(
    const Rect.fromLTWH(0, 0, 1000, 300),
    const Radius.circular(0),
  );

  static final Paint backBorderPaint2 = Paint()
    ..color = const Color.fromARGB(255, 255, 255, 255)
    ..style = PaintingStyle.fill
    ..strokeWidth = 1;

  void _renderTopBar(Canvas canvas) {
    canvas.drawRRect(cardRRect, backBorderPaint2);
  }
}

////
