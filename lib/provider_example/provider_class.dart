import 'package:flutter/material.dart';

class TapNavigationprovider extends ChangeNotifier {
  int tapcount = 0;
  void getTapcount() {
    tapcount = (tapcount + 1) % 4;
    notifyListeners();
  }
}
