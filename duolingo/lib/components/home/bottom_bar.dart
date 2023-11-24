import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:duolingo/main.dart';
import 'package:duolingo/sprites.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';

/// BOTTOM BAR

class BottomBar extends PositionComponent with TapCallbacks {
  BottomBar(
      {super.position,
      required this.selectedIndex,
      required this.selectIndex,
      super.key});

  int selectedIndex;
  Function selectIndex;

  @override
  void render(Canvas canvas) {
    _renderBottomBar(canvas);
  }

  @override
  FutureOr<void> onLoad() {
    add(PositionComponent(children: [
      SpriteButtonComponent(
          position: Vector2(50, 50),
          size: Vector2(100, 100),
          onPressed: () {
            selectIndex(0);
          },
          button: duolingoSprite(MySprites.play),
          buttonDown: duolingoSprite(MySprites.playPressed)),
      SpriteButtonComponent(
          position: Vector2(250, 50),
          size: Vector2(100, 100),
          onPressed: () {
            selectIndex(1);
          },
          button: duolingoSprite(MySprites.settings),
          buttonDown: duolingoSprite(MySprites.settingsPressed)),
      SpriteButtonComponent(
          position: Vector2(450, 50),
          size: Vector2(100, 100),
          onPressed: () {
            selectIndex(2);
          },
          button: duolingoSprite(MySprites.key),
          buttonDown: duolingoSprite(MySprites.keyPressed)),
      SpriteButtonComponent(
          position: Vector2(650, 50),
          size: Vector2(100, 100),
          onPressed: () {
            selectIndex(3);
          },
          button: duolingoSprite(MySprites.dashboard),
          buttonDown: duolingoSprite(MySprites.dashboardPressed)),
      SpriteButtonComponent(
          position: Vector2(850, 50),
          size: Vector2(100, 100),
          onPressed: () {
            selectIndex(4);
          },
          button: duolingoSprite(MySprites.info),
          buttonDown: duolingoSprite(MySprites.infoPressed)),
    ]));
    return super.onLoad();
  }

  static final cardRRect = RRect.fromRectAndRadius(
    const Rect.fromLTWH(0, 0, 1000, 200),
    const Radius.circular(0),
  );

  static final Paint selectedPaint = Paint()
    ..color = const Color.fromARGB(255, 0, 0, 0)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  static final Paint backBorderPaint2 = Paint()
    ..color = const Color.fromARGB(255, 255, 255, 255)
    ..style = PaintingStyle.fill
    ..strokeWidth = 1;

  void _renderBottomBar(Canvas canvas) {
    canvas.drawRRect(cardRRect, backBorderPaint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH((200 * (selectedIndex)) + 45, 45, 110, 110),
          const Radius.circular(8),
        ),
        selectedPaint);
  }

  void _drawSprite(
    Canvas canvas,
    Sprite sprite,
    double relativeX,
    double relativeY, {
    double scale = 1,
    bool rotate = false,
  }) {
    if (rotate) {
      canvas.save();
      canvas.translate(size.x / 2, size.y / 2);
      canvas.rotate(pi);
      canvas.translate(-size.x / 2, -size.y / 2);
    }
    sprite.render(
      canvas,
      position: Vector2(relativeX * size.x, relativeY * size.y),
      anchor: Anchor.center,
      size: sprite.srcSize.scaled(scale),
    );
    if (rotate) {
      canvas.restore();
    }
  }
}

//