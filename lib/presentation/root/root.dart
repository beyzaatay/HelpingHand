import 'package:flutter/material.dart';

import 'package:helpinghand/model/ad.dart';
import 'package:helpinghand/notifiers/tab_notifier.dart';
import 'package:helpinghand/presentation/home/home.dart';
import 'package:helpinghand/presentation/main_giris_one_screen/main_giris_one_screen.dart';
import 'package:helpinghand/presentation/map/map_screen.dart';
import 'package:helpinghand/presentation/profile/profile.dart';
import 'package:helpinghand/service/database/database_service.dart';
import 'package:helpinghand/widgets/custom_bottom_bar.dart';

enum RootTabs {
  home,
  map,
  profile,
}

extension RootTabsExtension on RootTabs {
  String get name {
    switch (this) {
      case RootTabs.home:
        return "Home";
      case RootTabs.map:
        return "Map";
      case RootTabs.profile:
        return "Profile";
    }
  }

  Widget page(List<Ad> ads) {
    switch (this) {
      case RootTabs.home:
        return Home(ads);
      case RootTabs.map:
        return MapScreen(ads);
      case RootTabs.profile:
        return Profile();
    }
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  bool isLoading = true;
  late final List<Ad> totalAds;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        isLoading = true;
      });
      totalAds = await DatabaseService().getAds();

      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: tabNotifier.currentTab,
        builder: (context, index, _) {
          return Scaffold(
            body: body(index),
            bottomNavigationBar: CustomBottomBar(onChanged: (RootTabs type) {
              adNotifier.currentAd.value = null;
              tabNotifier.switchTab(RootTabs.values.indexOf(type));
            }),
          );
        });
  }

  Widget body(int index) {
    /*   return IndexedStack(
      index: index,
      children: RootTabs.values.map((e) => e.page).toList(),
    ); */
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RootTabs.values[index].page(totalAds);
  }
}
