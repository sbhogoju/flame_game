import 'dart:async';
import 'dart:math';
import 'package:duolingo/login.dart';
import 'package:duolingo/sprites.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/layout.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
// import 'package:flutter/widgets.dart';
import 'package:flame/src/components/route.dart';

void main() {
  runApp(GameWidget(game: MyGame(), overlayBuilderMap: {
    'menu0': (BuildContext context, MyGame game) {
      return const ScrollWidget(
        key: Key("0"),
      );
    },
    'menu1': (BuildContext context, MyGame game) {
      return const ScrollWidget2(
        key: Key("1"),
      );
    }
  }));
}

class MyGame extends FlameGame {
  int selectedIndex = 0;

  List<String> overlayStrings = ['menu0', 'menu1'];

  late RouterComponent router;

  void changeIndex(int index) {
    world.remove(world.lastChild()!);
    super.overlays.removeAll(overlayStrings);
    selectedIndex = index;
    super.overlays.add('menu$selectedIndex');
    modifyBottom();
  }

  void modifyBottom() {
    var bottom = BottomBar(
        key: ComponentKey.named("$selectedIndex"),
        position: Vector2(0, 1950),
        selectedIndex: selectedIndex,
        selectIndex: changeIndex);
    world.add(bottom);
  }

  @override
  Future<FutureOr<void>> onLoad() async {
    super.onLoad();

    add(router = RouterComponent(
        initialRoute: 'login', routes: {'login': Route(LoginComponent.new)}));
    await Flame.images.load('klondike-sprites.png');
    await Flame.images.load('nut-april.png');
    var top = TopBar(position: Vector2(0, 0));
    var mainArea = MainSection(position: Vector2(0, 300));
    super.overlays.add('menu0');

    world.add(top);
    world.add(mainArea);
    modifyBottom();

    camera.viewfinder.visibleGameSize = Vector2(1000, 2000);
    camera.viewfinder.position = Vector2(500, 0);
    camera.viewfinder.anchor = Anchor.topCenter;
  }
}

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
      MyButton(
          position: Vector2(50, 150),
          size: Vector2(100, 100),
          normalSprite: MySprites.play,
          pressedSprite: MySprites.playPressed),
      MyButton(
          position: Vector2(250, 150),
          size: Vector2(100, 100),
          normalSprite: MySprites.settings,
          pressedSprite: MySprites.settingsPressed),
      MyButton(
          position: Vector2(450, 150),
          size: Vector2(100, 100),
          normalSprite: MySprites.key,
          pressedSprite: MySprites.keyPressed)
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

Sprite duolingoSprite(SpriteDetails spriteDetails) {
  return Sprite(
    Flame.images.fromCache(spriteDetails.source),
    srcPosition: Vector2(spriteDetails.x, spriteDetails.y),
    srcSize: Vector2(spriteDetails.width, spriteDetails.height),
  );
}

class MyButton extends SpriteButtonComponent {
  MyButton(
      {super.position,
      super.size,
      required this.normalSprite,
      required this.pressedSprite});

  SpriteDetails normalSprite;
  SpriteDetails pressedSprite;

  Sprite? normal;
  Sprite? pressed;
  @override
  FutureOr<void> onLoad() async {
    normal = duolingoSprite(normalSprite);
    pressed = duolingoSprite(pressedSprite);
    return super.onLoad();
  }

  @override
  Sprite? get buttonDown => pressed;

  @override
  Sprite? get button => normal;
}

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 130, 16, 100),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.blueAccent,
            child: Text("Element $index"),
          );
        },
      ),
    );
  }
}

class ScrollWidget2 extends StatelessWidget {
  const ScrollWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 130, 16, 100),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Color.fromARGB(255, 68, 255, 109),
            child: Text("Element $index"),
          );
        },
      ),
    );
  }
}
