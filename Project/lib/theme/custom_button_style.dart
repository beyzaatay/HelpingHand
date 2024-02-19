import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      );

  // Outline button style
  static ButtonStyle get outlineBlackTL13 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightGreen400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  static ButtonStyle get outlineBlackTL23 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.errorContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  static ButtonStyle get outlineBlackTL231 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.red700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  static ButtonStyle get outlineBlackTL232 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.greenA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
