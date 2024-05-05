import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/main_giris_one_screen/main_giris_one_screen.dart';
import 'package:helpinghand/presentation/root/root.dart';
import 'package:helpinghand/service/auth/auth_service.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/imageLogoVektor.png',
            width: 100, // Genişlik
            height: 100, // Yükseklik
          ),
          Image.asset(
            ImageConstant.HelpinHand,
            width: 200, // Genişlik
            height: 200,
          ),
          SizedBox(width: 10),
        ],
      ),
      nextScreen: AuthService().checkLogin() ? Root() : MainGirisOneScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Color(0XFF304674),
      duration: 2500,
    );
  }
}
