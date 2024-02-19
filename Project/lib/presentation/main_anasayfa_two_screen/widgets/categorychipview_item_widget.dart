import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_export.dart';

// ignore: must_be_immutable
class CategorychipviewItemWidget extends StatelessWidget {
  const CategorychipviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 3.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Clothes",
        style: TextStyle(
          color: theme.colorScheme.primaryContainer.withOpacity(1),
          fontSize: 13.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.indigo300,
      selectedColor: appTheme.lime900,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          13.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
