import 'package:flutter/material.dart';
import '../country_code_selector.dart';
import '../models/country_code.dart';
import '../models/customization_builders.dart';

Future<CountryCode?> showCountryCodePickerDialog({
  required BuildContext context,
  void Function(CountryCode code)? onCountryCodeTap,
  EdgeInsets margin =
      const EdgeInsets.symmetric(horizontal: 28, vertical: 100),
  CustomizationBuilders? customizationBuilders,
  Color backgroundColor = Colors.white,
  BorderSide borderSide = BorderSide.none,
  double elevation = 0.0,
  Color? shadowColor,
  Color? surfaceTintColor,
  Color barrierColor = Colors.black54,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  BorderRadiusGeometry? borderRadius,
  double maxSize = 1,
  double initialSize = 0.5,
  double minSize = 0.5,
  bool snap = true,
  String? countryNameLocale,
}) async {
  return await showDialog(
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    context: context,
    builder: (context) => Padding(
      padding: margin,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(24),
          side: borderSide,
        ),
        elevation: elevation,
        surfaceTintColor: surfaceTintColor,
        shadowColor: shadowColor,
        color: backgroundColor,
        child: SafeArea(
          child: CountryCodeSelector(
            countryNameLocale: countryNameLocale,
            customizationBuilders: customizationBuilders,
            onCountryCodeTap: onCountryCodeTap ??
                (CountryCode code) {
                  Navigator.pop(context, code);
                },
          ),
        ),
      ),
    ),
  );
}
