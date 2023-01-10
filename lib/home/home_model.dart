import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeModel extends ChangeNotifier {
  late double y = 0;
  late double x = 0;
  late Stack canvas = Stack(
    children: dots,
  );

  final recorder = ui.PictureRecorder();

  List<Widget> dots = [];

  void changeValueY(double val) {
    y = val;
  }

  void changeValueX(double val) {
    x = val;
  }

  void addFrame(List<Widget> frame) {
    dots.insertAll(0, frame);
    notifyListeners();
  }

  void rest(Widget frame) {
    dots = [frame];
    notifyListeners();
  }

  addDot(double x, double y) {
    final Widget dot = Align(
        alignment: Alignment(x, y),
        child: Container(
          color: Colors.black,
          width: 2,
          height: 2,
        ));
    dots.add(dot);
    notifyListeners();
  }
}
