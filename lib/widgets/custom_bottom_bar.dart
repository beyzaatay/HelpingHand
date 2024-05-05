import 'package:flutter/material.dart';

import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/root/root.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({this.onChanged});

  final Function(RootTabs)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeFill0Wght,
      activeIcon: ImageConstant.imgHomeFill0Wght,
      type: BottomBarEnum.Homefill0wght,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPinDropFill0,
      activeIcon: ImageConstant.imgPinDropFill0,
      type: BottomBarEnum.Pindropfill0,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAccountCircle,
      activeIcon: ImageConstant.imgAccountCircle,
      type: BottomBarEnum.Accountcircle,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.h),
        ),
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 42.adaptSize,
              width: 42.adaptSize,
              color: appTheme.gray500,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              color: appTheme.black900,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(RootTabs.values[index]);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Homefill0wght,
  Pindropfill0,
  Accountcircle,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
