import 'package:flutter/material.dart';

import 'package:helpinghand/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:helpinghand/presentation/main_giris_one_screen/main_giris_one_screen.dart';

class AppRoutes {
  static const String mainGirisOneScreen = '/main_giris_one_screen';

  static const String mainSifreOneScreen = '/main_sifre_one_screen';

  static const String mainSifreTwoScreen = '/main_sifre_two_screen';

  static const String mainKayitOneScreen = '/presentation/main_kayit_one_screen';

  static const String mainAnasayfaOnePage = '/main_anasayfa_one_page';

  static const String mainAnasayfaOneContainerScreen =
      '/main_anasayfa_one_container_screen';

  static const String mainAnasayfaTwoScreen = '/main_anasayfa_two_screen';

  static const String mainAnasayfaThreePage = '/main_anasayfa_three_page';

  static const String mainAnasayfaFourScreen = '/main_anasayfa_four_screen';

  static const String mainProfilOnePage = '/main_profil_one_page';

  static const String mainProfilTwoScreen = '/main_profil_two_screen';

  static const String mainProfilThreeScreen = '/main_profil_three_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    mainGirisOneScreen: (context) => MainGirisOneScreen(),
/*     mainAnasayfaOneContainerScreen: (context) =>
        MainAnasayfaOneContainerScreen(),
    mainAnasayfaTwoScreen: (context) => MainAnasayfaTwoScreen(),
    mainAnasayfaFourScreen: (context) => MainAnasayfaFourScreen(),
    mainProfilTwoScreen: (context) => MainProfilTwoScreen(),
    mainProfilThreeScreen: (context) => MainProfilThreeScreen(), */
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
