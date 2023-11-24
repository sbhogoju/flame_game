import 'dart:async';

import 'package:duolingo/main.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Route;

class LoginComponent extends Component
    with TapCallbacks, HasGameRef<DuolingoGame> {
  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) => game.router.pushReplacementNamed('home');

  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(const Color.fromARGB(255, 93, 82, 165)),
      TextComponent(
        text: 'Login',
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 50, color: Colors.white)),
        position: gameRef.size / 2,
      ),
    ]);
    return super.onLoad();
  }
}

class Background extends Component {
  Background(this.color);
  final Color color;

  @override
  void render(Canvas canvas) {
    canvas.drawColor(color, BlendMode.srcATop);
  }
}
