class MySprites {
  static const String nutApril = "nut-april.png";
  static SpriteDetails play =
      SpriteDetails(source: nutApril, x: 46, y: 22, height: 75, width: 75);
  static SpriteDetails playPressed =
      SpriteDetails(source: nutApril, x: 46, y: 109, height: 75, width: 75);
  static SpriteDetails settings =
      SpriteDetails(source: nutApril, x: 130, y: 22, height: 75, width: 75);
  static SpriteDetails settingsPressed =
      SpriteDetails(source: nutApril, x: 130, y: 109, height: 75, width: 75);
  static SpriteDetails key =
      SpriteDetails(source: nutApril, x: 213, y: 22, height: 75, width: 75);
  static SpriteDetails keyPressed =
      SpriteDetails(source: nutApril, x: 213, y: 109, height: 75, width: 75);
  static SpriteDetails dashboard =
      SpriteDetails(source: nutApril, x: 297, y: 22, height: 75, width: 75);
  static SpriteDetails dashboardPressed =
      SpriteDetails(source: nutApril, x: 297, y: 109, height: 75, width: 75);
  static SpriteDetails info =
      SpriteDetails(source: nutApril, x: 380, y: 22, height: 75, width: 75);
  static SpriteDetails infoPressed =
      SpriteDetails(source: nutApril, x: 380, y: 109, height: 75, width: 75);
}

class SpriteDetails {
  SpriteDetails(
      {required this.source,
      required this.x,
      required this.y,
      required this.width,
      required this.height});
  String source;
  double x;
  double y;
  double width;
  double height;
}
