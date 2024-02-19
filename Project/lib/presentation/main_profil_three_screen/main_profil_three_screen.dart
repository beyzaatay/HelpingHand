import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/main_anasayfa_one_page/main_anasayfa_one_page.dart';
import 'package:helpinghand/presentation/main_anasayfa_three_page/main_anasayfa_three_page.dart';
import 'package:helpinghand/presentation/main_profil_one_page/main_profil_one_page.dart';
import 'package:helpinghand/widgets/custom_bottom_bar.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_text_form_field.dart';

class MainProfilThreeScreen extends StatelessWidget {
  MainProfilThreeScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController editTextController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 6.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogoVektR1,
                height: 75.adaptSize,
                width: 75.adaptSize,
              ),
              SizedBox(height: 43.v),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 17.h,
                    vertical: 16.v,
                  ),
                  decoration: AppDecoration.outlineBlack.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder25,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(
                            children: [
                              Text(
                                "Advert",
                                style: theme.textTheme.titleLarge,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgPlus,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(
                                  left: 5.h,
                                  top: 5.v,
                                  bottom: 4.v,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 7.h,
                          right: 15.h,
                        ),
                        child: CustomTextFormField(
                          controller: editTextController,
                          textInputAction: TextInputAction.done,
                          borderDecoration:
                              TextFormFieldStyleHelper.outlineGray,
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Container(
                        height: 73.v,
                        width: 326.h,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(
                            20.h,
                          ),
                          border: Border.all(
                            color: appTheme.gray300,
                            width: 3.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.v),
                      SizedBox(
                        height: 232.v,
                        width: 326.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 73.v),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 73.v,
                                      width: 245.h,
                                      decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                        borderRadius: BorderRadius.circular(
                                          20.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.gray300,
                                          width: 3.h,
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgSettings,
                                      height: 49.v,
                                      width: 42.h,
                                      margin: EdgeInsets.only(
                                        left: 22.h,
                                        top: 6.v,
                                        bottom: 17.v,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 73.v,
                                width: 326.h,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    20.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.gray300,
                                    width: 3.h,
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgFilterListFilBlack900,
                              height: 45.adaptSize,
                              width: 45.adaptSize,
                              alignment: Alignment.bottomLeft,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgPlusOnprimary,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(
                                left: 37.h,
                                bottom: 31.v,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 52.h,
                                  top: 8.v,
                                  right: 52.h,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 54.h,
                                  vertical: 24.v,
                                ),
                                decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder25,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 25.v),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 82.adaptSize,
                                      width: 82.adaptSize,
                                    ),
                                    SizedBox(height: 12.v),
                                    Text(
                                      "Successful",
                                      style:
                                          CustomTextStyles.titleLargeGreen800,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                text: "Cancel",
                                margin: EdgeInsets.only(
                                  right: 23.h,
                                  bottom: 1.v,
                                ),
                                buttonStyle:
                                    CustomButtonStyles.outlineBlackTL231,
                              ),
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "Submit",
                                margin: EdgeInsets.only(left: 23.h),
                                buttonStyle:
                                    CustomButtonStyles.outlineBlackTL232,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
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
