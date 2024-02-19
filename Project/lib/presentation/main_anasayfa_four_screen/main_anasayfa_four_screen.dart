import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/main_anasayfa_one_page/main_anasayfa_one_page.dart';
import 'package:helpinghand/presentation/main_anasayfa_three_page/main_anasayfa_three_page.dart';
import 'package:helpinghand/presentation/main_profil_one_page/main_profil_one_page.dart';
import 'package:helpinghand/widgets/custom_bottom_bar.dart';
import 'package:helpinghand/widgets/custom_search_view.dart';

class MainAnasayfaFourScreen extends StatelessWidget {
  MainAnasayfaFourScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.deepPurple500,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.deepPurple500,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup68,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 30.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 46.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 42.h,
                    right: 43.h,
                  ),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "Search",
                  ),
                ),
                Spacer(),
                _buildMainAnasayfaFourStack(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainAnasayfaFourStack(BuildContext context) {
    return SizedBox(
      height: 395.v,
      width: 391.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 9.h),
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 8.v,
              ),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      right: 1.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 93.adaptSize,
                                width: 93.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    46.h,
                                  ),
                                ),
                              ),
                              SizedBox(height: 122.v),
                              Text(
                                "Address:",
                                style: CustomTextStyles.titleLargeGray800,
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 35,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 179.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowDownGray40001,
                                height: 16.v,
                                width: 27.h,
                                margin: EdgeInsets.only(left: 28.h),
                              ),
                              SizedBox(height: 6.v),
                              SizedBox(
                                width: 115.h,
                                child: Text(
                                  "Social aid Association",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleLargeGray800
                                      .copyWith(
                                    height: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 64,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVector,
                          height: 34.v,
                          width: 27.h,
                          margin: EdgeInsets.only(
                            top: 8.v,
                            bottom: 211.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 87.v),
                  Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 111.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 60.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.h,
                                  vertical: 2.v,
                                ),
                                decoration:
                                    AppDecoration.outlineBlack900.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder13,
                                ),
                                child: Text(
                                  "Clothes",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              Container(
                                width: 42.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.h,
                                  vertical: 2.v,
                                ),
                                decoration:
                                    AppDecoration.outlineBlack9001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder13,
                                ),
                                child: Text(
                                  "Food",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgHome,
                          height: 24.v,
                          width: 31.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.img1,
            height: 150.adaptSize,
            width: 150.adaptSize,
            alignment: Alignment.topLeft,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
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
