import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MainSifreTwoScreen extends StatelessWidget {
  MainSifreTwoScreen({Key? key}) : super(key: key);

  TextEditingController resetCodeController = TextEditingController();

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
                                horizontal: 29.h, vertical: 18.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      height: 296.v,
                                      width: 314.h,
                                      margin: EdgeInsets.only(left: 16.h),
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgLogoVektR1,
                                                height: 270.v,
                                                width: 285.h,
                                                alignment: Alignment.topRight),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 41.h),
                                                    child: Text(
                                                        "Forgot Password",
                                                        style: CustomTextStyles
                                                            .headlineSmallSemiBold))),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrowLeft,
                                                height: 37.adaptSize,
                                                width: 37.adaptSize,
                                                alignment: Alignment.bottomLeft,
                                                margin: EdgeInsets.only(
                                                    bottom: 1.v),
                                                onTap: () {
                                                  onTapImgArrowLeft(context);
                                                })
                                          ]))),
                              SizedBox(height: 36.v),
                              _buildResetCode(context),
                              SizedBox(height: 64.v),
                              _buildPassword(context),
                              SizedBox(height: 24.v),
                              _buildPassword1(context),
                              SizedBox(height: 8.v),
                              Container(
                                  width: 361.h,
                                  margin: EdgeInsets.only(left: 11.h),
                                  child: Text(
                                      "-Your password must be between 8-12 characters.\r\n-Your password must not contain special characters “-, ., _”.",
                                      maxLines: null,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(height: 1.33))),
                              SizedBox(height: 29.v),
                              _buildResetPassword(context),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildResetCode(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: CustomTextFormField(
            controller: resetCodeController, hintText: "Reset Code"));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: CustomTextFormField(
            controller: passwordController,
            hintText: "Password",
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 24.v),
                child: CustomImageView(
                    imagePath:
                        ImageConstant.imgVisibilityofffill0wght400grad0opsz241,
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
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: CustomTextFormField(
            controller: passwordController1,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 24.v),
                child: CustomImageView(
                    imagePath:
                        ImageConstant.imgVisibilityfill0wght400grad0opsz241,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 73.v),
            obscureText: true,
            contentPadding:
                EdgeInsets.only(left: 30.h, top: 24.v, bottom: 24.v)));
  }

  /// Section Widget
  Widget _buildResetPassword(BuildContext context) {
    return CustomElevatedButton(
        height: 73.v,
        text: "Reset Password",
        margin: EdgeInsets.symmetric(horizontal: 23.h),
        buttonTextStyle: CustomTextStyles.titleLargeOnPrimaryContainer,
        onPressed: () {
          onTapResetPassword(context);
        });
  }

  /// Navigates to the mainGirisOneScreen when the action is triggered.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainGirisOneScreen);
  }

  /// Navigates to the mainGirisOneScreen when the action is triggered.
  onTapResetPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainGirisOneScreen);
  }
}
