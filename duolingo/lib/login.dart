import 'dart:async';

import 'package:duolingo/main.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart' hide Route;

class LoginComponent extends Component with HasGameRef<MyGame> {
  @override
  FutureOr<void> onLoad() {
    add(TextComponent(
      text: 'Login',
      anchor: Anchor.center,
      textRenderer:
          TextPaint(style: const TextStyle(fontSize: 50, color: Colors.white)),
      position: gameRef.size / 2,
    ));
    return super.onLoad();
  }
}
