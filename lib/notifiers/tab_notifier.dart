import 'package:flutter/material.dart';

final TabNotifier tabNotifier = TabNotifier();

class TabNotifier {
  final ValueNotifier<int> currentTab = ValueNotifier<int>(0);

  void switchTab(int value) {
    currentTab.value = value;
  }
}
