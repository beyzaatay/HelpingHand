import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/widgets/app_bar/appbar_trailing_image.dart';
import 'package:helpinghand/widgets/app_bar/custom_app_bar.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MainAnasayfaOnePage extends StatelessWidget {
  MainAnasayfaOnePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 13.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchFilter(context),
                      SizedBox(height: 14.v),
                      _buildProductList(context),
                      SizedBox(height: 15.v),
                      _buildCategoryList(context),
                      SizedBox(height: 11.v),
                      _buildFeaturedItems(context),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: SizedBox(
            height: 47.v,
            width: 42.11.h,
            child: Stack(alignment: Alignment.topCenter, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgVectorOnprimarycontainer,
                  height: 47.v,
                  width: 24.h,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 18.h)),
              CustomImageView(
                  imagePath: ImageConstant.imgVectorOnprimarycontainer28x32,
                  height: 28.v,
                  width: 32.h,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(left: 10.h, top: 6.v, bottom: 12.v))
            ])),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgVectorOnprimarycontainer47x24,
              margin: EdgeInsets.symmetric(horizontal: 187.h, vertical: 4.v))
        ]);
  }

  /// Section Widget
  Widget _buildSearchFilter(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 26.h, right: 41.h),
        child: Row(children: [
          Expanded(
              child: CustomSearchView(
                  controller: searchController, hintText: "Search")),
          CustomImageView(
              imagePath: ImageConstant.imgFilterListFil,
              height: 40.adaptSize,
              width: 40.adaptSize,
              margin: EdgeInsets.only(left: 32.h),
              onTap: () {
                onTapImgFilterListFIL(context);
              })
        ]));
  }

  /// Section Widget
  Widget _buildProductList(BuildContext context) {
    return Container(
        height: 216.v,
        width: 397.h,
        margin: EdgeInsets.only(left: 9.h),
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(left: 15.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 8.v),
                  decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder25),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7.v),
                        Padding(
                            padding: EdgeInsets.only(right: 12.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 93.adaptSize,
                                      width: 93.adaptSize,
                                      decoration: BoxDecoration(
                                          color: theme
                                              .colorScheme.secondaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(46.h))),
                                  Spacer(flex: 42),
                                  Container(
                                      width: 115.h,
                                      margin: EdgeInsets.only(
                                          top: 14.v, bottom: 26.v),
                                      child: Text("Social aid Association",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .titleLargeGray800
                                              .copyWith(height: 1.20))),
                                  Spacer(flex: 57),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgVector,
                                      height: 34.v,
                                      width: 27.h,
                                      margin: EdgeInsets.only(bottom: 58.v))
                                ])),
                        SizedBox(height: 61.v),
                        Padding(
                            padding: EdgeInsets.only(left: 3.h, right: 5.h),
                            child: Row(children: [
                              Container(
                                  width: 60.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.h, vertical: 2.v),
                                  decoration: AppDecoration.outlineBlack900
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder13),
                                  child: Text("Clothes",
                                      style: theme.textTheme.labelLarge)),
                              Container(
                                  width: 42.h,
                                  margin: EdgeInsets.only(left: 9.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.h, vertical: 2.v),
                                  decoration: AppDecoration.outlineBlack9001
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder13),
                                  child: Text("Food",
                                      style: theme.textTheme.labelLarge)),
                              Spacer(),
                              CustomImageView(
                                  imagePath: ImageConstant.imgHome,
                                  height: 24.v,
                                  width: 31.h)
                            ]))
                      ]))),
          CustomImageView(
              imagePath: ImageConstant.img1,
              height: 150.adaptSize,
              width: 150.adaptSize,
              alignment: Alignment.topLeft)
        ]));
  }

  /// Section Widget
  Widget _buildCategoryList(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 216.v,
            width: 397.h,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              CustomImageView(
                  imagePath: ImageConstant.img2,
                  height: 150.adaptSize,
                  width: 150.adaptSize,
                  alignment: Alignment.topLeft),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: EdgeInsets.only(left: 15.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.h, vertical: 8.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder25),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 7.v),
                            Padding(
                                padding: EdgeInsets.only(right: 12.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 93.adaptSize,
                                          width: 93.adaptSize,
                                          decoration: BoxDecoration(
                                              color: theme.colorScheme
                                                  .secondaryContainer,
                                              borderRadius:
                                                  BorderRadius.circular(46.h))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 13.v, bottom: 49.v),
                                          child: Text("Health for All",
                                              style: CustomTextStyles
                                                  .titleLargeGray800)),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgVectorYellow800,
                                          height: 34.v,
                                          width: 27.h,
                                          margin: EdgeInsets.only(bottom: 58.v))
                                    ])),
                            SizedBox(height: 61.v),
                            Padding(
                                padding: EdgeInsets.only(right: 5.h),
                                child: Row(children: [
                                  Container(
                                      width: 149.h,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.h, vertical: 1.v),
                                      decoration: AppDecoration.outlineBlack9002
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder13),
                                      child: Text("Hygiene Products",
                                          style:
                                              CustomTextStyles.labelLargeBold)),
                                  Container(
                                      width: 97.h,
                                      margin: EdgeInsets.only(left: 11.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13.h, vertical: 2.v),
                                      decoration: AppDecoration.outlineBlack9003
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder13),
                                      child: Text("Baby Care",
                                          style: theme.textTheme.labelLarge)),
                                  Spacer(),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgHome,
                                      height: 24.v,
                                      width: 31.h)
                                ]))
                          ])))
            ])));
  }

  /// Section Widget
  Widget _buildFeaturedItems(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 9.h),
        child: IntrinsicWidth(
            child: SizedBox(
                height: 216.v,
                width: 419.h,
                child: Stack(alignment: Alignment.topLeft, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 203.v,
                                width: 382.h,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 203.v,
                                              width: 382.h,
                                              decoration: BoxDecoration(
                                                  color: theme.colorScheme
                                                      .onPrimaryContainer,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.h),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: appTheme.black900
                                                            .withOpacity(0.25),
                                                        spreadRadius: 2.h,
                                                        blurRadius: 2.h,
                                                        offset: Offset(0, 4))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 13.h, right: 18.h),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                        width: 344.h,
                                                        margin: EdgeInsets.only(
                                                            right: 6.h),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                  height: 93
                                                                      .adaptSize,
                                                                  width: 93
                                                                      .adaptSize,
                                                                  decoration: BoxDecoration(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .secondaryContainer,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              46.h))),
                                                              Spacer(),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: 15.v,
                                                                      bottom:
                                                                          47.v),
                                                                  child: Text(
                                                                      "Happy Children",
                                                                      style: CustomTextStyles
                                                                          .titleLargeGray800)),
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgVector,
                                                                  height: 34.v,
                                                                  width: 27.h,
                                                                  margin: EdgeInsets.only(
                                                                      left:
                                                                          20.h,
                                                                      bottom:
                                                                          58.v))
                                                            ])),
                                                    SizedBox(height: 59.v),
                                                    SizedBox(
                                                        width: 350.h,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomElevatedButton(
                                                                  height: 26.v,
                                                                  width: 97.h,
                                                                  text:
                                                                      "Baby Care",
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom: 1
                                                                              .v),
                                                                  buttonStyle:
                                                                      CustomButtonStyles
                                                                          .outlineBlackTL13,
                                                                  buttonTextStyle: theme
                                                                      .textTheme
                                                                      .labelLarge!),
                                                              Container(
                                                                  width: 79.h,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left: 6
                                                                              .h),
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          23.h,
                                                                      vertical:
                                                                          1.v),
                                                                  decoration: AppDecoration
                                                                      .outlineBlack9002
                                                                      .copyWith(
                                                                          borderRadius: BorderRadiusStyle
                                                                              .circleBorder13),
                                                                  child: Text(
                                                                      "Toys",
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge)),
                                                              Container(
                                                                  width: 73.h,
                                                                  margin: EdgeInsets.only(
                                                                      left: 6.h,
                                                                      bottom:
                                                                          1.v),
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          20.h,
                                                                      vertical:
                                                                          2.v),
                                                                  decoration: AppDecoration
                                                                      .outlineBlack9004
                                                                      .copyWith(
                                                                          borderRadius: BorderRadiusStyle
                                                                              .circleBorder13),
                                                                  child: Text(
                                                                      "Book",
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge)),
                                                              Spacer(),
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgHome,
                                                                  height: 24.v,
                                                                  width: 31.h,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              1.v))
                                                            ]))
                                                  ])))
                                    ])),
                            Container(
                                height: 33.adaptSize,
                                width: 33.adaptSize,
                                margin: EdgeInsets.only(
                                    left: 305.h, top: 16.v, bottom: 154.v),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgFrame,
                                          height: 33.adaptSize,
                                          width: 33.adaptSize,
                                          alignment: Alignment.center),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgFrame,
                                          height: 33.adaptSize,
                                          width: 33.adaptSize,
                                          alignment: Alignment.center)
                                    ]))
                          ])),
                  CustomImageView(
                      imagePath: ImageConstant.img3,
                      height: 150.adaptSize,
                      width: 150.adaptSize,
                      alignment: Alignment.topLeft)
                ]))));
  }

  /// Navigates to the mainAnasayfaTwoScreen when the action is triggered.
  onTapImgFilterListFIL(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainAnasayfaTwoScreen);
  }
}
