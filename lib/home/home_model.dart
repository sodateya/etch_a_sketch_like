import 'dart:math';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  late double y = 0;
  late double x = 0;
  late Stack canvas = Stack(
    children: dots,
  );
  List<Widget> dots = [];

  void changeValueY(double val) {
    y = val;
  }

  void changeValueX(double val) {
    x = val;
  }

  void addFrame(Widget frame) {
    dots.add(frame);
    notifyListeners();
  }

  void rest(Widget frame) {
    dots = [frame];
    notifyListeners();
  }

  void addDot(double x, double y) {
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
