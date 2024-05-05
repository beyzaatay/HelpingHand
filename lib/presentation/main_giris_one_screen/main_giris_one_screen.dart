import 'package:flutter/material.dart';

import 'package:helpinghand/core/app_export.dart';
import 'package:helpinghand/notifiers/ad_notifier.dart';
import 'package:helpinghand/presentation/root/root.dart';
import 'package:helpinghand/service/auth/auth_service.dart';
import 'package:helpinghand/widgets/custom_checkbox_button.dart';
import 'package:helpinghand/widgets/custom_elevated_button.dart';
import 'package:helpinghand/widgets/custom_text_form_field.dart';

AdNotifier adNotifier = AdNotifier();

// ignore_for_file: must_be_immutable
class MainGirisOneScreen extends StatelessWidget {
  MainGirisOneScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberCheckBox = false;

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
                padding: EdgeInsets.only(left: 52.h, top: 73.v, right: 52.h),
                child: Column(
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgLogoVektR1,
                        height: 270.v,
                        width: 285.h),
                    SizedBox(height: 48.v),
                    CustomTextFormField(
                        controller: emailController,
                        hintText: "E-mail",
                        textInputType: TextInputType.emailAddress,
                        borderDecoration: TextFormFieldStyleHelper.outlineGray),
                    SizedBox(height: 10.v),
                    CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                        borderDecoration: TextFormFieldStyleHelper.outlineGray),
                    SizedBox(height: 43.v),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h, right: 7.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildRememberCheckBox(context),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword(context);
                                  },
                                  child: Text("Forgot Password ?",
                                      style: CustomTextStyles.bodyLargeGray400))
                            ])),
                    SizedBox(height: 27.v),
                    CustomElevatedButton(
                        height: 73.v,
                        text: "Log IN",
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle:
                            CustomTextStyles.titleLargeOnPrimaryContainer,
                        onPressed: () {
                          onTapLogIN(context);
                        }),
                    SizedBox(height: 28.v),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(left: 38.h, right: 15.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 2.v),
                                      child: Text("Don't have an account ? ",
                                          style: CustomTextStyles
                                              .bodyLargeGreen50)),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtSignUp(context);
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 6.h, top: 2.v),
                                          child: Text("Sign Up!",
                                              style:
                                                  theme.textTheme.titleMedium)))
                                ]))),
                    SizedBox(height: 6.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRememberCheckBox(BuildContext context) {
    return CustomCheckboxButton(
        text: "Remember ",
        value: rememberCheckBox,
        onChange: (value) {
          rememberCheckBox = value;
        });
  }

  /// Navigates to the mainSifreOneScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainSifreOneScreen);
  }

  /// Navigates to the mainAnasayfaOneContainerScreen when the action is triggered.
  onTapLogIN(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill in all fields.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return; // Giriş işlemi başlamadan önce fonksiyonu burada sonlandırıyoruz.
    }

    final result = await AuthService()
        .login(emailController.text, passwordController.text);
    if (result) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Root()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Login failed. Please check your credentials.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// Navigates to the mainKayitOneScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainKayitOneScreen);
  }
}
