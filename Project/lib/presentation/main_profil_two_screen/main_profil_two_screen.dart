import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/presentation/main_anasayfa_one_page/main_anasayfa_one_page.dart';
import 'package:helpinghand/presentation/main_anasayfa_three_page/main_anasayfa_three_page.dart';
import 'package:helpinghand/presentation/main_profil_one_page/main_profil_one_page.dart';
import 'package:helpinghand/widgets/custom_bottom_bar.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MainProfilTwoScreen extends StatelessWidget {
  MainProfilTwoScreen({Key? key}) : super(key: key);

  TextEditingController logoController = TextEditingController();

  TextEditingController helpTopicValueController = TextEditingController();

  TextEditingController explanationValueController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 6.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgLogoVektR1,
                                  height: 75.adaptSize,
                                  width: 75.adaptSize),
                              SizedBox(height: 43.v),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17.h, vertical: 16.v),
                                      decoration: AppDecoration.outlineBlack
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder25),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20.h),
                                                child: Row(children: [
                                                  Text("Advert",
                                                      style: theme.textTheme
                                                          .titleLarge),
                                                  CustomImageView(
                                                      imagePath:
                                                          ImageConstant.imgPlus,
                                                      height: 20.adaptSize,
                                                      width: 20.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          left: 5.h,
                                                          top: 5.v,
                                                          bottom: 4.v))
                                                ])),
                                            SizedBox(height: 14.v),
                                            _buildLogo(context),
                                            SizedBox(height: 13.v),
                                            _buildHelpTopicValue(context),
                                            SizedBox(height: 6.v),
                                            _buildExplanationValue(context),
                                            SizedBox(height: 13.v),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 7.h, right: 31.h),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      _buildAddress(context),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgSettings,
                                                          height: 49.v,
                                                          width: 42.h,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 22.h,
                                                                  top: 6.v,
                                                                  bottom: 17.v))
                                                    ])),
                                            SizedBox(height: 22.v),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7.h),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                          height: 51.v,
                                                          width: 57.h,
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgFilterListFilBlack900,
                                                                    height: 45
                                                                        .adaptSize,
                                                                    width: 45
                                                                        .adaptSize,
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgPlusOnprimary,
                                                                    height: 20
                                                                        .adaptSize,
                                                                    width: 20
                                                                        .adaptSize,
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight)
                                                              ])),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgThumbsUp,
                                                          height: 37.v,
                                                          width: 48.h,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 26.h,
                                                                  top: 6.v,
                                                                  bottom: 8.v)),
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgSettingsOnprimarycontainer,
                                                          height: 37.v,
                                                          width: 48.h,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 24.h,
                                                                  top: 6.v,
                                                                  bottom: 7.v))
                                                    ])),
                                            Spacer(),
                                            SizedBox(height: 9.v),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7.h),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      _buildCancel(context),
                                                      _buildSubmit(context)
                                                    ]))
                                          ]))),
                              SizedBox(height: 5.v)
                            ]))))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildLogo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 15.h),
        child: CustomTextFormField(
            controller: logoController,
            hintText: "Association Name",
            alignment: Alignment.center,
            borderDecoration: TextFormFieldStyleHelper.outlineGray));
  }

  /// Section Widget
  Widget _buildHelpTopicValue(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 15.h),
        child: CustomTextFormField(
            controller: helpTopicValueController,
            hintText: "Help Topic",
            alignment: Alignment.center,
            borderDecoration: TextFormFieldStyleHelper.outlineGray));
  }

  /// Section Widget
  Widget _buildExplanationValue(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 15.h),
        child: CustomTextFormField(
            controller: explanationValueController,
            hintText: "Explanation",
            alignment: Alignment.center,
            borderDecoration: TextFormFieldStyleHelper.outlineGray));
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Expanded(
        child: CustomTextFormField(
            controller: addressController,
            hintText: "Address",
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineGray));
  }

  /// Section Widget
  Widget _buildCancel(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "Cancel",
            margin: EdgeInsets.only(right: 23.h, bottom: 1.v),
            buttonStyle: CustomButtonStyles.outlineBlackTL231));
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "Submit",
            margin: EdgeInsets.only(left: 23.h),
            buttonStyle: CustomButtonStyles.outlineBlackTL232,
            onPressed: () {
              onTapSubmit(context);
            }));
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

  /// Navigates to the mainProfilThreeScreen when the action is triggered.
  onTapSubmit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainProfilThreeScreen);
  }
}
