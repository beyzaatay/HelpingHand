import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';

class MainProfilOnePage extends StatelessWidget {
  const MainProfilOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillBlueGray,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 6.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogoVektR1,
                          height: 75.adaptSize,
                          width: 75.adaptSize),
                      SizedBox(height: 29.v),
                      Container(
                          height: 138.adaptSize,
                          width: 138.adaptSize,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(69.h))),
                      SizedBox(height: 76.v),
                      Container(
                          width: 382.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.h, vertical: 28.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder25),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 13.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("Name Surname",
                                        style: CustomTextStyles
                                            .titleLargeBlack900)),
                                SizedBox(height: 6.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("Mehmet Yalaz",
                                        style: theme.textTheme.titleLarge)),
                                SizedBox(height: 6.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("Mail",
                                        style: CustomTextStyles
                                            .titleLargeBlack900)),
                                SizedBox(height: 9.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("solutionchallange@gmail.com",
                                        style: theme.textTheme.titleLarge)),
                                SizedBox(height: 4.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("Location",
                                        style: CustomTextStyles
                                            .titleLargeBlack900)),
                                SizedBox(height: 9.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text("Turkiye , Balıkesir",
                                        style: theme.textTheme.titleLarge)),
                                SizedBox(height: 139.v),
                                CustomElevatedButton(
                                    width: 200.h,
                                    text: "Advert",
                                    rightIcon: Container(
                                        margin: EdgeInsets.only(left: 6.h),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgClose,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize)),
                                    buttonStyle:
                                        CustomButtonStyles.outlineBlackTL23,
                                    onPressed: () {
                                      onTapAdvert(context);
                                    },
                                    alignment: Alignment.centerRight)
                              ])),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Navigates to the mainProfilTwoScreen when the action is triggered.
  onTapAdvert(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainProfilTwoScreen);
  }
}
