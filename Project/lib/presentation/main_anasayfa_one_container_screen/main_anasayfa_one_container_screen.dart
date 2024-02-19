import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/main_anasayfa_one_page/main_anasayfa_one_page.dart';
import 'package:helpinghand/presentation/main_anasayfa_three_page/main_anasayfa_three_page.dart';
import 'package:helpinghand/presentation/main_profil_one_page/main_profil_one_page.dart';
import 'package:helpinghand/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class MainAnasayfaOneContainerScreen extends StatelessWidget {
  MainAnasayfaOneContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.mainAnasayfaOnePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homefill0wght:
        return AppRoutes.mainAnasayfaOnePage;
      case BottomBarEnum.Pindropfill0:
        return AppRoutes.mainAnasayfaThreePage;
      case BottomBarEnum.Accountcircle:
        return AppRoutes.mainProfilOnePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.mainAnasayfaOnePage:
        return MainAnasayfaOnePage();
      case AppRoutes.mainAnasayfaThreePage:
        return MainAnasayfaThreePage();
      case AppRoutes.mainProfilOnePage:
        return MainProfilOnePage();
      default:
        return DefaultWidget();
    }
  }
}
