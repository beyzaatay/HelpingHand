import '../main_anasayfa_two_screen/widgets/categorychipview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/main_anasayfa_one_page/main_anasayfa_one_page.dart';
import 'package:helpinghand/presentation/main_anasayfa_three_page/main_anasayfa_three_page.dart';
import 'package:helpinghand/presentation/main_profil_one_page/main_profil_one_page.dart';
import 'package:helpinghand/widgets/custom_bottom_bar.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_icon_button.dart';
import 'package:helpinghand/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MainAnasayfaTwoScreen extends StatelessWidget {
  MainAnasayfaTwoScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 6.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgLogoVektR1,
                      height: 75.adaptSize,
                      width: 75.adaptSize),
                  SizedBox(height: 4.v),
                  _buildSearchFilterRow(context),
                  SizedBox(height: 32.v),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 1.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.h, vertical: 10.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder25),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(height: 9.v),
                            Text("Categories",
                                style: CustomTextStyles
                                    .titleLargePrimaryContainer),
                            SizedBox(height: 24.v),
                            _buildCategoryChipView(context),
                            Spacer(flex: 51),
                            Text("Help Type",
                                style: CustomTextStyles
                                    .titleLargePrimaryContainer),
                            SizedBox(height: 19.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 34.h, right: 37.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.h, vertical: 3.v),
                                          decoration: AppDecoration
                                              .fillSecondaryContainer
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder31),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 3.v),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgVectorGray500,
                                                    height: 42.v,
                                                    width: 55.h),
                                                SizedBox(height: 1.v),
                                                SizedBox(
                                                    width: 61.h,
                                                    child: Text("Assembly Area",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: CustomTextStyles
                                                            .labelLarge12
                                                            .copyWith(
                                                                height: 1.25)))
                                              ])),
                                      Container(
                                          margin: EdgeInsets.only(bottom: 6.v),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.h, vertical: 1.v),
                                          decoration: AppDecoration
                                              .fillSecondaryContainer
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder31),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(height: 6.v),
                                                CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgHome,
                                                    height: 39.v,
                                                    width: 49.h),
                                                SizedBox(height: 1.v),
                                                SizedBox(
                                                    width: 70.h,
                                                    child: Text(
                                                        "Distribution Area",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: CustomTextStyles
                                                            .labelLarge12
                                                            .copyWith(
                                                                height: 1.25)))
                                              ]))
                                    ])),
                            Spacer(flex: 48),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 7.v, bottom: 6.v),
                                          child: Text("Reset",
                                              style: CustomTextStyles
                                                  .titleLargePrimaryContainerSemiBold)),
                                      CustomElevatedButton(
                                          width: 118.h,
                                          text: "Apply",
                                          margin: EdgeInsets.only(left: 23.h),
                                          buttonTextStyle: CustomTextStyles
                                              .titleLargePrimaryContainerSemiBold,
                                          onPressed: () {
                                            onTapApply(context);
                                          })
                                    ]))
                          ]))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildSearchFilterRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 4.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: CustomSearchView(
                      controller: searchController, hintText: "Search"))),
          Padding(
              padding: EdgeInsets.only(left: 39.h),
              child: CustomIconButton(
                  height: 41.v,
                  width: 50.h,
                  padding: EdgeInsets.all(8.h),
                  onTap: () {
                    onTapBtnFilter(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgFilter)))
        ]));
  }

  /// Section Widget
  Widget _buildCategoryChipView(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Wrap(
                runSpacing: 20.v,
                spacing: 20.h,
                children: List<Widget>.generate(
                    8, (index) => CategorychipviewItemWidget()))));
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

  /// Navigates to the mainAnasayfaOneContainerScreen when the action is triggered.
  onTapBtnFilter(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainAnasayfaOneContainerScreen);
  }

  /// Navigates to the mainAnasayfaOneContainerScreen when the action is triggered.
  onTapApply(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainAnasayfaOneContainerScreen);
  }
}
