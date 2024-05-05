import 'package:flutter/material.dart';

import 'package:helpinghand/model/ad.dart';

class AdNotifier {
  final ValueNotifier<Ad?> currentAd = ValueNotifier<Ad?>(null);

  void selectAd(Ad? ad) {
    currentAd.value = ad;
  }

  void clear() {
    currentAd.value = null;
  }
}
