import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GameHome extends FlameGame with TapDetector {
  late Squarecomponent player;

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(resolution: Vector2(400, 600));

    player = Squarecomponent()
      ..position = Vector2(200, 300)
      ..size = Vector2(50, 50)
      ..anchor = Anchor.center;
    // ..paint = Paint()..color = Colors.blue;

    add(player);
  }

  @override
  void onTapDown(TapDownInfo info) {
    player.position = info.eventPosition.global;
  }
}

class Squarecomponent extends PositionComponent {
  Paint paint = Paint()..color = Colors.blue;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), paint);
  }
}
