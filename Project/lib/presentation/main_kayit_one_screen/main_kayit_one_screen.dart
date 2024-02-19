import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MainKayitOneScreen extends StatelessWidget {
  MainKayitOneScreen({Key? key}) : super(key: key);

  TextEditingController surnameController = TextEditingController();

  TextEditingController mailvalueController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

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
                                horizontal: 17.h, vertical: 18.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      height: 288.v,
                                      width: 307.h,
                                      margin: EdgeInsets.only(left: 35.h),
                                      child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgLogoVektR1,
                                                height: 270.v,
                                                width: 285.h,
                                                alignment: Alignment.topRight),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrowDown,
                                                height: 36.adaptSize,
                                                width: 36.adaptSize,
                                                alignment: Alignment.bottomLeft,
                                                onTap: () {
                                                  onTapImgArrowDown(context);
                                                })
                                          ]))),
                              SizedBox(height: 15.v),
                              _buildSurname(context),
                              SizedBox(height: 10.v),
                              _buildMailvalue(context),
                              SizedBox(height: 10.v),
                              _buildPassword(context),
                              SizedBox(height: 10.v),
                              _buildPassword1(context),
                              SizedBox(height: 10.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      width: 361.h,
                                      margin: EdgeInsets.only(left: 35.h),
                                      child: Text(
                                          "-Your password must be between 8-12 characters.\r\n-Your password must not contain special characters “-, ., _”.",
                                          maxLines: null,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(height: 1.33)))),
                              SizedBox(height: 42.v),
                              _buildNext(context),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildSurname(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: CustomTextFormField(
            controller: surnameController, hintText: "Name Surname"));
  }

  /// Section Widget
  Widget _buildMailvalue(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: CustomTextFormField(
            controller: mailvalueController,
            hintText: "Mail",
            suffix: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 24.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 73.v),
            contentPadding:
                EdgeInsets.only(left: 30.h, top: 24.v, bottom: 24.v)));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: CustomTextFormField(
            controller: passwordController,
            hintText: "Password",
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 24.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgIconPrimary,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 73.v),
            obscureText: true,
            contentPadding:
                EdgeInsets.only(left: 30.h, top: 24.v, bottom: 24.v)));
  }

  /// Section Widget
  Widget _buildPassword1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: CustomTextFormField(
            controller: passwordController1,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 24.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgIconPrimary,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 73.v),
            obscureText: true,
            contentPadding:
                EdgeInsets.only(left: 30.h, top: 24.v, bottom: 24.v)));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        height: 73.v,
        text: "Next",
        margin: EdgeInsets.symmetric(horizontal: 35.h),
        buttonTextStyle: CustomTextStyles.titleLargeOnPrimaryContainer,
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates to the mainGirisOneScreen when the action is triggered.
  onTapImgArrowDown(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainGirisOneScreen);
  }

  /// Navigates to the mainGirisOneScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainGirisOneScreen);
  }
}
