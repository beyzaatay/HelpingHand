import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MainAnasayfaThreePage extends StatelessWidget {
  MainAnasayfaThreePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

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
                        image: AssetImage(ImageConstant.imgGroup68),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    decoration: AppDecoration.fillDeepPurple.copyWith(
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.imgGroup68),
                            fit: BoxFit.cover)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 30.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 46.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 47.h, right: 48.h),
                                      child: CustomSearchView(
                                          controller: searchController,
                                          hintText: "Search",
                                          alignment: Alignment.center))),
                              Spacer(),
                              _buildMainStack(context)
                            ]))))));
  }

  /// Section Widget
  Widget _buildMainStack(BuildContext context) {
    return SizedBox(
        height: 216.v,
        width: 396.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: theme.colorScheme.onPrimaryContainer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder25),
                  child: Container(
                      height: 203.v,
                      width: 382.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder25),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgHome,
                            height: 24.v,
                            width: 31.h,
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(right: 5.h, bottom: 3.v)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 8.v),
                                      child: Column(
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
                                                        BorderRadius.circular(
                                                            46.h))),
                                            SizedBox(height: 61.v),
                                            Container(
                                                width: 111.h,
                                                margin:
                                                    EdgeInsets.only(left: 3.h),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                          width: 60.h,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      4.h,
                                                                  vertical:
                                                                      2.v),
                                                          decoration: AppDecoration
                                                              .outlineBlack900
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder13),
                                                          child: Text("Clothes",
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge)),
                                                      Container(
                                                          width: 42.h,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      4.h,
                                                                  vertical:
                                                                      2.v),
                                                          decoration: AppDecoration
                                                              .outlineBlack9001
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder13),
                                                          child: Text("Food",
                                                              style: theme
                                                                  .textTheme
                                                                  .labelLarge))
                                                    ]))
                                          ])),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.h, bottom: 113.v),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrowUp,
                                                height: 16.v,
                                                width: 27.h,
                                                margin:
                                                    EdgeInsets.only(left: 37.h),
                                                onTap: () {
                                                  onTapImgArrowUp(context);
                                                }),
                                            SizedBox(height: 6.v),
                                            SizedBox(
                                                width: 115.h,
                                                child: Text(
                                                    "Social aid Association",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: CustomTextStyles
                                                        .titleLargeGray800
                                                        .copyWith(
                                                            height: 1.20)))
                                          ])),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgVector,
                                      height: 34.v,
                                      width: 27.h,
                                      margin: EdgeInsets.only(
                                          left: 62.h, top: 8.v, bottom: 145.v))
                                ]))
                      ])))),
          CustomImageView(
              imagePath: ImageConstant.img1,
              height: 150.adaptSize,
              width: 150.adaptSize,
              alignment: Alignment.topLeft)
        ]));
  }

  /// Navigates to the mainAnasayfaFourScreen when the action is triggered.
  onTapImgArrowUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainAnasayfaFourScreen);
  }
}
