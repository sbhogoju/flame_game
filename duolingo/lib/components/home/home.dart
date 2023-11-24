import 'dart:async';
import 'package:duolingo/components/home/bottom_bar.dart';
import 'package:duolingo/components/home/middle_section.dart';
import 'package:duolingo/components/home/top_bar.dart';
import 'package:duolingo/main.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class HomeComponent extends Component with HasGameRef<DuolingoGame> {
  int selectedIndex = 0;

  List<String> overlayStrings = ['menu0', 'menu1'];

  void changeIndex(int index) {
    game.world.remove(game.world.lastChild()!);
    super.game.overlays.removeAll(overlayStrings);
    selectedIndex = index;
    super.game.overlays.add('menu$selectedIndex');
    modifyBottom();
  }

  void modifyBottom() {
    var bottom = BottomBar(
        key: ComponentKey.named("$selectedIndex"),
        position: Vector2(0, 1950),
        selectedIndex: selectedIndex,
        selectIndex: changeIndex);
    game.world.add(bottom);
  }

  @override
  Future<FutureOr<void>> onLoad() async {
    super.onLoad();
    await Flame.images.load('klondike-sprites.png');
    await Flame.images.load('nut-april.png');
    var top = TopBar(position: Vector2(0, 0));
    var mainArea = MainSection(position: Vector2(0, 300));
    super.game.overlays.add('menu0');

    game.world.add(top);
    game.world.add(mainArea);
    modifyBottom();

    game.camera.viewfinder.visibleGameSize = Vector2(1000, 2000);
    game.camera.viewfinder.position = Vector2(500, 0);
    game.camera.viewfinder.anchor = Anchor.topCenter;
  }
}
