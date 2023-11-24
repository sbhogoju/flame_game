import 'dart:async';
import 'package:duolingo/components/home/home.dart';
import 'package:duolingo/components/login.dart';
import 'package:duolingo/overlays/scroll_one.dart';
import 'package:duolingo/overlays/scroll_two.dart';
import 'package:duolingo/sprites.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

void main() {
  runApp(GameWidget(game: DuolingoGame(), overlayBuilderMap: {
    'menu0': (BuildContext context, DuolingoGame game) {
      return const ScrollWidget(
        key: Key("0"),
      );
    },
    'menu1': (BuildContext context, DuolingoGame game) {
      return const ScrollWidget2(
        key: Key("1"),
      );
    }
  }));
}

class DuolingoGame extends FlameGame {
  late RouterComponent router;
  @override
  FutureOr<void> onLoad() {
    add(router = RouterComponent(initialRoute: 'login', routes: {
      'login': Route(LoginComponent.new),
      'home': Route(HomeComponent.new)
    }));
    return super.onLoad();
  }
}

Sprite duolingoSprite(SpriteDetails spriteDetails) {
  return Sprite(
    Flame.images.fromCache(spriteDetails.source),
    srcPosition: Vector2(spriteDetails.x, spriteDetails.y),
    srcSize: Vector2(spriteDetails.width, spriteDetails.height),
  );
}
