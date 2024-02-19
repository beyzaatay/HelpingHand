import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MainSifreOneScreen extends StatelessWidget {
  MainSifreOneScreen({Key? key}) : super(key: key);

  TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 45.h, vertical: 18.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 296.v,
                          width: 314.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgLogoVektR1,
                                    height: 270.v,
                                    width: 285.h,
                                    alignment: Alignment.topRight),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 41.h),
                                        child: Text("Forgot Password",
                                            style: CustomTextStyles
                                                .headlineSmallSemiBold))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowLeft,
                                    height: 37.adaptSize,
                                    width: 37.adaptSize,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(bottom: 1.v),
                                    onTap: () {
                                      onTapImgArrowLeft(context);
                                    })
                              ])),
                      SizedBox(height: 52.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h, right: 5.h),
                          child: CustomTextFormField(
                              controller: mailController,
                              hintText: "Mail",
                              textInputAction: TextInputAction.done,
                              suffix: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30.h, vertical: 24.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant
                                          .imgMailfill0wght400grad0opsz241,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              suffixConstraints:
                                  BoxConstraints(maxHeight: 73.v),
                              contentPadding: EdgeInsets.only(
                                  left: 30.h, top: 24.v, bottom: 24.v))),
                      Spacer(flex: 70),
                      CustomElevatedButton(
                          height: 73.v,
                          text: "Send Code",
                          margin: EdgeInsets.symmetric(horizontal: 7.h),
                          buttonTextStyle:
                              CustomTextStyles.titleLargeOnPrimaryContainer,
                          onPressed: () {
                            onTapSendCode(context);
                          }),
                      Spacer(flex: 29)
                    ]))));
  }

  /// Navigates to the mainGirisOneScreen when the action is triggered.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainGirisOneScreen);
  }

  /// Navigates to the mainSifreTwoScreen when the action is triggered.
  onTapSendCode(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainSifreTwoScreen);
  }
}
